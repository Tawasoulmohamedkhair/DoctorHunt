import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadHomeData(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is HomeError) {
                  return Center(child: Text(state.message));
                }

                if (state is HomeLoaded) {
                  return CustomScrollView(
                    slivers: [
                      // Header
                      const SliverToBoxAdapter(child: HeaderWidget()),

                      // Live Doctors
                      SliverToBoxAdapter(
                        child: LiveDoctorsSection(doctors: state.liveDoctors),
                      ),
                     SliverToBoxAdapter(child: SizedBox(height: context.h(30)),
                      ),

                      // Categories
                      SliverToBoxAdapter(child: CategoriesSection()),
                      //Popular Doctors
                      SliverToBoxAdapter(
                        child: PopularDoctorsSection(
                          doctors: state.popularDoctors,
                          onSeeAllTap: () {},
                        ),
                      ),
                      // Featured Doctors
                      SliverToBoxAdapter(
                        child: FeaturedDoctorsSection(
                          doctors: state.featuredDoctors,
                        ),
                      ),
                     SliverToBoxAdapter(child: SizedBox(height:context.h(20))),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
