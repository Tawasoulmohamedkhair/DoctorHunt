import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/admin_appointment_details_cubit.dart';
import '../cubit/admin_appointment_details_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminAppointmentDetailsScreen extends StatelessWidget {
  const AdminAppointmentDetailsScreen({super.key, required this.appointmentId});

  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.appointmentDetails)),
      body:
          BlocBuilder<
            AdminAppointmentDetailsCubit,
            AdminAppointmentDetailsState
          >(
            builder: (context, state) {
              if (state is AdminAppointmentDetailsInitial ||
                  state is AdminAppointmentDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is AdminAppointmentDetailsError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 12),
                        Text(state.message, textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<AdminAppointmentDetailsCubit>()
                                .loadAppointment(appointmentId);
                          },
                          child: Text(t.retry),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final Map<String, dynamic> appointment;

              if (state is AdminAppointmentDetailsLoaded) {
                appointment = state.appointment;
              } else if (state is AdminAppointmentDetailsActionLoading) {
                appointment = state.appointment;
              } else {
                return const SizedBox.shrink();
              }

              final patient =
                  appointment['patients'] as Map<String, dynamic>? ?? {};
              final patientUser =
                  patient['users'] as Map<String, dynamic>? ?? {};

              final availability =
                  appointment['doctor_availability'] as Map<String, dynamic>? ??
                  {};
              final doctor =
                  availability['doctors'] as Map<String, dynamic>? ?? {};
              final specialty =
                  doctor['specialties'] as Map<String, dynamic>? ?? {};
              final service =
                  availability['medical_services'] as Map<String, dynamic>? ??
                  {};

              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _InfoSection(
                    title: t.patient,
                    children: [
                      _PersonHeader(
                        imageUrl: patientUser['avatar_url']?.toString(),
                        name:
                            patientUser['full_name']?.toString() ??
                            t.unknownPatient,
                        subtitle: patientUser['email']?.toString() ?? '',
                        imageSize: 64,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _InfoSection(
                    title: t.doctor,
                    children: [
                      _PersonHeader(
                        imageUrl: doctor['image_url']?.toString(),
                        name:
                            doctor['full_name']?.toString() ?? t.unknownDoctor,
                        subtitle: localizeSpecialty(
                          context,
                          specialty['name']?.toString() ?? '',
                        ),
                        imageSize: 56,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                           SizedBox(
                            width: 125,
                            child: Text(
                              t.medicalService,
                              style: context.regular.copyWith(color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              service['name']?.toString() ?? t.notAvailable,
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.clip,
                              style: context.medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _InfoSection(
                    title: t.appointmentDetails,
                    children: [
                      _InfoRow(
                        label: t.date,
                        value:
                            availability['work_date']?.toString() ??
                            t.notAvailable,
                      ),
                      _InfoRow(
                        label: t.time,
                        value: _formatTime(
                          availability['start_time']?.toString() ??
                              appointment['appointment_time']?.toString() ??
                              t.notAvailable,
                        ),
                      ),
                      _InfoRow(
                        label: t.shift,
                        value:
                            availability['shift']?.toString() ??
                            t.notAvailable,
                      ),
                      _InfoRow(
                        label: t.consultationFee,
                        value: appointment['fee_at_booking'] == null
                            ? t.notAvailable
                            : '\$${appointment['fee_at_booking']}',
                      ),
                      _InfoRow(
                        label: t.status,
                        value:
                            appointment['status']?.toString() ??
                            t.notAvailable,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
    );
  }
}

String _formatTime(String value) {
  final parts = value.split(':');
  return parts.length >= 2 ? '${parts[0]}:${parts[1]}' : value;
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Text(label, style: context.regular.copyWith(color: Colors.grey)),
          ),
          Expanded(
            child: Text(
              value,
              style: context.medium,
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonHeader extends StatelessWidget {
  const _PersonHeader({
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.imageSize,
  });

  final String? imageUrl;
  final String name;
  final String subtitle;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim() ?? '';
    final validImageUrl =
        url.startsWith('https://') || url.startsWith('http://') ? url : null;

    return Row(
      children: [
        AppImage(
          imageUrl: validImageUrl,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.cover,
          borderRadius: 12,
          backgroundColor: Colors.grey.shade100,
          fallback: Icon(
            Icons.person,
            size: imageSize * 0.55,
            color: Colors.grey,
          ),
          showLoadingIndicator: false,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.semiBoldPx15,
              ),
              if (subtitle.isNotEmpty) ...[
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.regularPx12.copyWith(color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
