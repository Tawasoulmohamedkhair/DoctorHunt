import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/custom_search_field.dart';
import 'package:doctor_hunt/apps/core/widget/header_appbar.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/widget/favourite_card_widget.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavouritesScreen extends StatefulWidget {
  final String? patientId;

  const FavouritesScreen({super.key, this.patientId});
  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final TextEditingController _controller = TextEditingController();

  late final FavoritesCubit _favoritesCubit;
  late final Future<List<DoctorModel>> _doctorsFuture;

  String? _patientId;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _favoritesCubit = context.read<FavoritesCubit>();
    _patientId =
        widget.patientId ?? Supabase.instance.client.auth.currentUser?.id;

    _doctorsFuture = getIt<DoctorRepository>().getActiveDoctors();

    if (_patientId != null) {
      _favoritesCubit.loadFavorites(_patientId!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_patientId == null) {
      return const Scaffold(
        body: Center(child: Text('Please log in to view your favorites.')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,

      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        bloc: _favoritesCubit,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          return FutureBuilder<List<DoctorModel>>(
            future: _doctorsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Unable to load doctors.'));
              }

              final doctors = snapshot.data ?? [];

              final favoriteDoctors = doctors
                  .where((doctor) => state.doctorIds.contains(doctor.id))
                  .toList();

              final filteredDoctors = favoriteDoctors.where((doctor) {
                return doctor.fullName.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                );
              }).toList();

              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      Assets.images.bg.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: context.h(20)),
                      HeaderAppBar(
                        title: t.favorites,
                        onBackPressed: () => context.go('/home'),
                      ),

                      CustomSearchField(
                        hintText: t.search_hint,
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value.trim();
                          });
                        },
                        onClear: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      ),
                      Expanded(
                        child: filteredDoctors.isEmpty
                            ? Center(
                                child: Text(
                                  favoriteDoctors.isEmpty
                                      ? 'No favorite doctors yet.'
                                      : 'No matching favorite doctors.',
                                ),
                              )
                            : GridView.builder(
                                padding: const EdgeInsets.all(16),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      mainAxisExtent: 180,
                                    ),
                                itemCount: filteredDoctors.length,
                                itemBuilder: (context, index) {
                                  final doctor = filteredDoctors[index];

                                  return FavoriteDoctorCard(
                                    doctor: doctor,
                                    onFavoriteTap: () {
                                      _favoritesCubit.toggleFavorite(
                                        patientId: _patientId!,
                                        doctorId: doctor.id,
                                      );
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
