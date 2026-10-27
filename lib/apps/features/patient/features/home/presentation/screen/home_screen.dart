import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/categories_section.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/header_widget.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/popular_doctors_section.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/top_rated_doctors_section.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().loadHomeData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final user = context.read<AuthCubit>().state.user;

      if (user != null && user.role == 'patient') {
        context.read<FavoritesCubit>().loadFavorites(user.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          


          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, homeState) {
              if (homeState is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (homeState is HomeError) {
                return Center(child: Text(homeState.message));
              }

              if (homeState is HomeLoaded) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: BlocBuilder<AuthCubit, AuthCubitState>(
                        builder: (context, authState) {
                          final userName = authState.user?.fullName ?? 'User';
                          final avatarUrl = authState.user?.avatarUrl;

                          return HeaderWidget(
                            userName: userName,
                            avatarUrl: avatarUrl,
                            onMenuPressed: () {
                              ZoomDrawer.of(context)?.toggle();
                            },

                            onSearchTap: () {
                              const FindDoctorsRoute().go(context);
                            },
                          );
                        },
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: context.h(30))),

                    SliverToBoxAdapter(child: CategoriesSection()),

                    //use the same section for favorites
                    SliverToBoxAdapter(
                      child: BlocBuilder<FavoritesCubit, FavoritesState>(
                        builder: (context, favoritesState) {
                          final user = context.read<AuthCubit>().state.user;

                          final isPatient =
                              user != null && user.role == 'patient';

                          return Column(
                            children: [
                              PopularDoctorsSection(
                                doctors: homeState.popularDoctors,
                                onSeeAllTap: () {
                                  PopularRoute().go(context);
                                },
                                isFavorite: (doctor) =>
                                    favoritesState.isFavorite(doctor.id),
                                onFavoriteTap: (doctor) {
                                  if (!isPatient) return;

                                  context.read<FavoritesCubit>().toggleFavorite(
                                    patientId: user.id,
                                    doctorId: doctor.id,
                                  );
                                },
                              ),

                              TopRatedDoctorsSection(
                                doctors: homeState.topRatedDoctors,
                                isFavorite: (doctor) =>
                                    favoritesState.isFavorite(doctor.id),
                                onFavoriteTap: (doctor) {
                                  if (!isPatient) return;

                                  context.read<FavoritesCubit>().toggleFavorite(
                                    patientId: user.id,
                                    doctorId: doctor.id,
                                  );
                                },
                                onSeeAllTap: () {
                                  const FindDoctorsRoute(
                                    sortByRating: true,
                                  ).go(context);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: context.h(20))),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
