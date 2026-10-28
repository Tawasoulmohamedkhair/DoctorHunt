import 'dart:async';

import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_app_text_field.dart';
import 'package:doctor_hunt/apps/core/widgets/header_appbar.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctors_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctors_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_specialty_tabs.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_statistics.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctors_empty_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctors_error_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctors_list.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorsScreen extends StatelessWidget {
  const AdminDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AdminDoctorsCubit>()..loadDoctors(),
      child: const _AdminDoctorsView(),
    );
  }
}

class _AdminDoctorsView extends StatefulWidget {
  const _AdminDoctorsView();

  @override
  State<_AdminDoctorsView> createState() => _AdminDoctorsViewState();
}

class _AdminDoctorsViewState extends State<_AdminDoctorsView> {
  final _searchController = TextEditingController();

  AdminDoctorsCubit get _cubit => context.read<AdminDoctorsCubit>();

  @override
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refresh() => _cubit.loadDoctors(isRefresh: true);

  Future<void> _openCreateDoctor() async {
    final result = await const CreateDoctorRoute().push(context);
    if (!mounted || result != true) return;
    await _refresh();
  }

  Future<void> _openDoctorDetails(String doctorId) async {
    final result = await AdminDoctorDetailsRoute(
      doctorId: doctorId,
    ).push(context);
    if (!mounted || result != true) return;
    await _refresh();
  }

  void _onSearchChanged(String query) {
    _cubit.searchDoctors(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton:
          BlocSelector<AdminDoctorsCubit, AdminDoctorsState, bool>(
            selector: (state) =>
                state.status == AdminDoctorsStatus.success ||
                state.status == AdminDoctorsStatus.refreshing,
            builder: (context, showFab) {
              if (!showFab) return const SizedBox.shrink();
              return FloatingActionButton.extended(
                onPressed: _openCreateDoctor,
                backgroundColor: AppColors.cyan,
                icon: Icon(Icons.add, size: context.r(18)),
                label: Text(context.t.adddoctor),
              );
            },
          ),
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<AdminDoctorsCubit, AdminDoctorsState>(
              builder: (context, state) => _DoctorsBody(
                state: state,
                searchController: _searchController,
                onSearchChanged: _onSearchChanged,
                onRefresh: _refresh,
                onRetry: _cubit.loadDoctors,
                onDoctorTap: _openDoctorDetails,
              ),
            ),
            const _RefreshingIndicator(),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// Body
// ============================================================

class _DoctorsBody extends StatelessWidget {
  const _DoctorsBody({
    required this.state,
    required this.searchController,
    required this.onSearchChanged,
    required this.onRefresh,
    required this.onRetry,
    required this.onDoctorTap,
  });

  final AdminDoctorsState state;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final ValueChanged<String> onDoctorTap;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case AdminDoctorsStatus.initial:
      case AdminDoctorsStatus.loading:
        return Center(
          child: Semantics(
            label: context.t.loading,
            liveRegion: true,
            child: const CircularProgressIndicator(color: AppColors.cyan),
          ),
        );

      case AdminDoctorsStatus.failure:
        return DoctorsErrorState(
          message: state.errorMessage ?? context.t.unabletoloaddoctors,
          onRetry: onRetry,
        );

      default:
        return RefreshIndicator(
          color: AppColors.cyan,
          onRefresh: onRefresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  context.w(20),
                  context.h(8),
                  context.w(20),
                  context.h(100),
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    HeaderAppBar(
                      title: context.t.doctors,
                      showBackButton: false,
                      showAction: false, // TODO: فعّله لما صفحة الإشعارات تجهز
                      actionIcon: Icons.notifications_none_outlined,
                      onActionPressed: () {},
                      text: 'A',
                      icon2: Icons.person,
                    ),
                    SizedBox(height: context.h(8)),
                    DoctorStatistics(
                      activeDoctors: state.activeDoctorsCount,
                      totalDoctors: state.doctors.length,
                    ),
                    SizedBox(height: context.h(8)),
                    _SearchField(
                      controller: searchController,
                      onChanged: onSearchChanged,
                    ),
                    SizedBox(height: context.h(12)),
                    _DoctorsSection(state: state, onDoctorTap: onDoctorTap),
                  ]),
                ),
              ),
            ],
          ),
        );
    }
  }
}

// ============================================================
// Search
// ============================================================

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomAppTextField(
      type: AppTextFieldType.search,
      prefixIcon: Icon(
        Icons.search,
        size: context.r(20),
        color: AppColors.rockblue,
      ),
      hintText: context.t.searchdoctor,
      controller: controller,
      onChanged: onChanged,
    );
  }
}

// ============================================================
// Doctors Section
// ============================================================

class _DoctorsSection extends StatelessWidget {
  const _DoctorsSection({required this.state, required this.onDoctorTap});

  final AdminDoctorsState state;
  final ValueChanged<String> onDoctorTap;

  @override
  Widget build(BuildContext context) {
    if (state.doctors.isEmpty) {
      return DoctorsEmptyState(
        title: context.t.nodoctorsyet,
        message: context.t.nodoctorsyetmessage,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoctorSpecialtyTabs(
          doctors: state.doctors,
          specialties: state.specialties,
          selectedSpecialtyId: state.selectedSpecialtyId,
          onSelected: (id) =>
              context.read<AdminDoctorsCubit>().selectSpecialty(id),
        ),
        SizedBox(height: context.h(16)),
        if (state.filteredDoctors.isEmpty)
          DoctorsEmptyState(
            icon: Icons.search_off_rounded,
            title: context.t.nodoctorfound,
            message: context.t.nodoctoematch,
          )
        else
          DoctorsList(doctors: state.filteredDoctors, onDoctorTap: onDoctorTap),
      ],
    );
  }
}

// ============================================================
// Refreshing indicator
// ============================================================

class _RefreshingIndicator extends StatelessWidget {
  const _RefreshingIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AdminDoctorsCubit, AdminDoctorsState, bool>(
      selector: (state) => state.status == AdminDoctorsStatus.refreshing,
      builder: (context, isRefreshing) {
        if (!isRefreshing) return const SizedBox.shrink();
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Semantics(
            label: context.t.refreshing,
            liveRegion: true,
            child: const LinearProgressIndicator(
              minHeight: 2,
              color: AppColors.cyan,
            ),
          ),
        );
      },
    );
  }
}
