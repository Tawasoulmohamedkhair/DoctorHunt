// doctor_details_screen.dart

import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_state.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/doctor_card.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/header_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/stats_row.dart';
import 'package:doctor_hunt/gen/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final String doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DoctorDetailsCubit()..loadDoctorDetails(doctorId),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
            ),
            BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
              builder: (context, state) {
                if (state is DoctorDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is DoctorDetailsError) {
                  return Center(child: Text(state.message));
                }
                if (state is DoctorDetailsLoaded) {
                  final doctor = state.doctor;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderAppBar(),
                        // ===== Doctor Card =====
                        DoctorCard(doctor: doctor),
                        const SizedBox(height: 16),

                        // ===== Stats =====
                        StatsRow(doctor: doctor),
                        const SizedBox(height: 24),

                        // ===== Services =====
                        Text(
                          context.t.details.service,
                          style: context.medium18textSecondary,
                        ),
                        const SizedBox(height: 12),
                        ...List.generate(doctor.servicesKeys.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              '${index + 1}.   ${_getService(context, doctor.servicesKeys[index])}',
                              style: context.light13textSub,
                            ),
                          );
                        }),
                        const SizedBox(height: 20),

                        // ===== Map =====
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            Assets.images.map.path,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              height: 180,
                              color: AppColors.darkgray,
                              child: const Center(
                                child: Icon(Icons.map, size: 50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getService(BuildContext context, String key) {
    final t = context.t.details;
    switch (key) {
      case 'patientCare':
        return t.patientCare;

      case 'run':
        return t.run;

      case 'appointmentReminder':
        return t.appointmentReminder;

      default:
        return key;
    }
  }
}
