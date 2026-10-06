// doctor_details_screen.dart

import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/enum/doctor_service.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_state.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/doctor_card.dart';
import 'package:doctor_hunt/apps/core/widget/header_widget.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/stats_row.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<DoctorDetailsCubit>().loadDoctorDetails(widget.doctorId);
    ();
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
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(16),
                    vertical: context.h(16),
                  ),
                  child: SafeArea(
                    top: true,
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: context.h(10)),

                        HeaderAppBar(
                          title: t.doctorDetails,
                          actionIcon: Icons.search,
                        ),

                        // ===== Doctor Card =====
                        DoctorCard(doctor: doctor),
                        SizedBox(height: context.h(16)),

                        // ===== Stats =====
                        StatsRow(doctor: doctor),
                        SizedBox(height: context.h(24)),

                        // ===== Services =====
                        Text(t.service, style: context.medium18textSecondary),
                        SizedBox(height: context.h(12)),
                        ...List.generate(doctor.services.length, (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: context.h(10)),
                            child: Text(
                              '${index + 1}.   ${_getService(context, doctor.services[index])}',
                              style: context.light13textSub,
                            ),
                          );
                        }),
                        SizedBox(height: context.h(20)),

                        // ===== Map =====
                        ClipRRect(
                          borderRadius: BorderRadius.circular(context.r(16)),
                          child: Image.asset(
                            Assets.images.map.path,
                            height: context.h(180),
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: context.h(180),
                                  color: AppColors.darkgray,
                                  child: Center(
                                    child: Icon(
                                      Icons.map,
                                      size: context.sp(50),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  String _getService(BuildContext context, DoctorService service) {
    switch (service) {
      case DoctorService.patientCare:
        return t.patientCare;
      case DoctorService.run:
        return t.run;
      case DoctorService.appointmentReminder:
        return t.appointmentReminder;
    }
  }
}
