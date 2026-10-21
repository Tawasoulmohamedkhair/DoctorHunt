import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/custom_search_field.dart';
import 'package:doctor_hunt/apps/core/widget/header_appbar.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/cubit/finddoctor_state.dart';
import 'package:doctor_hunt/apps/features/patient/sharedwidget/widgets/doctor_list_view.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FindDoctorsScreen extends StatefulWidget {
  final String? initialQuery;

  const FindDoctorsScreen({super.key, this.initialQuery});

  @override
  State<FindDoctorsScreen> createState() => _FindDoctorsScreenState();
}

class _FindDoctorsScreenState extends State<FindDoctorsScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialQuery ?? '');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final patientId = Supabase.instance.client.auth.currentUser?.id;

      if (patientId != null) {
        context.read<FavoritesCubit>().loadFavorites(patientId);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              SizedBox(height: context.h(20)),
              HeaderAppBar(
                title: t.find_doctors,
                onBackPressed: () => context.go('/home'),
              ),

              CustomSearchField(
                hintText: t.search_hint,
                controller: _controller,
                onChanged: (value) {
                  context.read<FindDoctorsCubit>().search(value.trim());
                },
                onClear: () {
                  context.read<FindDoctorsCubit>().search('');
                },
              ),

              Expanded(
                child: BlocBuilder<FindDoctorsCubit, FindDoctorsState>(
                  builder: (context, state) {
                    if (state is FindDoctorsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is FindDoctorsError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is FindDoctorsLoaded) {
                      if (state.doctors.isEmpty) {
                        return Center(child: Text(t.nodoctorfound));
                      }

                      return BlocBuilder<FavoritesCubit, FavoritesState>(
                        builder: (context, favoritesState) {
                          return DoctorListView(
                            doctors: state.doctors,
                            isFavorite: (doctor) {
                              return favoritesState.doctorIds.contains(
                                doctor.id,
                              );
                            },
                            onFavoriteTap: (doctor) {
                              final patientId =
                                  Supabase.instance.client.auth.currentUser?.id;

                              if (patientId == null) return;

                              context.read<FavoritesCubit>().toggleFavorite(
                                patientId: patientId,
                                doctorId: doctor.id,
                              );
                            },
                            onDoctorTap: (doctor) {
                              DetailsRoute(doctorId: doctor.id).push(context);
                            },
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
