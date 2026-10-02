import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/cubit/home_state.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/categories_section.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/featured_doctors_section.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/header_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/live_doctors_section.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/popular_doctors_section.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                          );
                        },
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: LiveDoctorsSection(doctors: homeState.liveDoctors),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: context.h(30))),

                    SliverToBoxAdapter(child: CategoriesSection()),

                    SliverToBoxAdapter(
                      child: PopularDoctorsSection(
                        doctors: homeState.popularDoctors,
                        onSeeAllTap: () {},
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: FeaturedDoctorsSection(
                        doctors: homeState.featuredDoctors,
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
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
