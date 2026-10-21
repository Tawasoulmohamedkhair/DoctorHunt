import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/header_appbar.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctordetails_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctordetails_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_details_actions.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_details_info_card.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_details_profile.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctors_error_state.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminDoctorDetailsScreen extends StatelessWidget {
  const AdminDoctorDetailsScreen({super.key, required this.doctorId});

  final String doctorId;

  Future<void> _editDoctor(BuildContext context) async {
    final result = await EditDoctorRoute(doctorId: doctorId).push(context);

    if (!context.mounted) return;

    if (result == true) {
      Navigator.of(context).pop(true);
    }
  }

  void _manageAvailability(BuildContext context) {
    AdminDoctorScheduleRoute(doctorId: doctorId).push(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FBF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3FBF4),
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: context.h(56),
        titleSpacing: 0,
        title: HeaderAppBar(
          title: t.doctorDetails,
          showAction: false,
          titleStyle: context.boldPx20.copyWith(fontSize: context.sp(20), color: AppColors.textDeep),
          onBackPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<AdminDoctorDetailsCubit, AdminDoctorDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case AdminDoctorDetailsStatus.initial:
              case AdminDoctorDetailsStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );

              case AdminDoctorDetailsStatus.failure:
                return DoctorsErrorState(
                  message: state.errorMessage ?? t.unableToLoadDoctorDetails,
                  onRetry: () {
                    context.read<AdminDoctorDetailsCubit>().refreshDoctor();
                  },
                );

              case AdminDoctorDetailsStatus.success:
                final doctor = state.doctor;

                if (doctor == null) {
                  return DoctorsErrorState(
                    message: t.doctorDataUnavailable,
                    onRetry: () {
                      context.read<AdminDoctorDetailsCubit>().refreshDoctor();
                    },
                  );
                }

                return _DoctorDetailsContent(
                  doctor: doctor,
                  onEdit: () => _editDoctor(context),
                  onManageAvailability: () {
                    _manageAvailability(context);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

class _DoctorDetailsContent extends StatelessWidget {
  const _DoctorDetailsContent({
    required this.doctor,
    required this.onEdit,
    required this.onManageAvailability,
  });

  final DoctorModel doctor;
  final VoidCallback onEdit;
  final VoidCallback onManageAvailability;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        context.w(20),
        context.h(16),
        context.w(20),
        context.h(32),
      ),
      child: Column(
        children: [
          DoctorDetailsProfile(doctor: doctor),
          SizedBox(height: context.h(24)),
          DoctorDetailsInfoCard(doctor: doctor),
          SizedBox(height: context.h(24)),
          DoctorDetailsActions(
            onEdit: onEdit,
            onManageAvailability: onManageAvailability,
          ),
        ],
      ),
    );
  }
}
