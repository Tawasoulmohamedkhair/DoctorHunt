import 'package:doctor_hunt/apps/core/widget/header_appbar.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/sharedwidget/widgets/doctor_list_view.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final patientId = Supabase.instance.client.auth.currentUser?.id;

      if (patientId != null) {
        context.read<FavoritesCubit>().loadFavorites(patientId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Column(
              children: [
                HeaderAppBar(
                  title: t.popularDoctor,
                  onBackPressed: () => context.go('/home'),
                ),
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, homeState) {
                      if (homeState is HomeInitial ||
                          homeState is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (homeState is HomeError) {
                        return Center(child: Text(homeState.message));
                      }

                      if (homeState is! HomeLoaded ||
                          homeState.popularDoctors.isEmpty) {
                        return Center(child: Text(t.nodoctorfound));
                      }

                      final doctors = homeState.popularDoctors;

                      return BlocBuilder<FavoritesCubit, FavoritesState>(
                        builder: (context, favoritesState) {
                          return DoctorListView(
                            doctors: doctors,
                            isFavorite: (doctor) =>
                                favoritesState.isFavorite(doctor.id),
                            onFavoriteTap: (doctor) {
                              final patientId =
                                  Supabase.instance.client.auth.currentUser?.id;

                              if (patientId == null) return;

                              context.read<FavoritesCubit>().toggleFavorite(
                                patientId: patientId,
                                doctorId: doctor.id,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
