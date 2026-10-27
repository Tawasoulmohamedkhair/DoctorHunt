import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminAppointmentCard extends StatelessWidget {
  const AdminAppointmentCard({
    required this.appointment,
    this.onCancel,
    this.onComplete,
    this.onViewDetails,
    super.key,
  });

  final Map<String, dynamic> appointment;
  final VoidCallback? onCancel;
  final VoidCallback? onComplete;
  final VoidCallback? onViewDetails;

  @override
  Widget build(BuildContext context) {
    final status = appointment['status'] as String? ?? 'upcoming';

    final patients = appointment['patients'] as Map<String, dynamic>?;
    final patient = patients?['users'] as Map<String, dynamic>?;

    final availability =
        appointment['doctor_availability'] as Map<String, dynamic>?;
    final doctor = availability?['doctors'] as Map<String, dynamic>?;
    final specialty = doctor?['specialties'] as Map<String, dynamic>?;

    final patientName = patient?['full_name'] as String? ?? t.patient;
    final patientAvatar = patient?['avatar_url'] as String?;
    final doctorName = doctor?['full_name'] as String? ?? t.doctor;
    final specialtyName = localizeSpecialty(
      context,
      specialty?['name'] as String? ?? t.specialty,
    );

    final workDate = availability?['work_date']?.toString() ?? '';
    final appointmentTime = _formatTime(
      appointment['appointment_time']?.toString() ?? '',
    );
    final fee = appointment['fee_at_booking']?.toString() ?? '0';

    final isUpcoming = status == 'upcoming';

    return Container(
      margin: EdgeInsets.only(bottom: context.h(14)),
      padding: EdgeInsets.all(context.r(12)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(context.r(12)),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppImage(
                imageUrl: patientAvatar,
                width: context.r(48),
                height: context.r(48),
                shape: AppImageShape.circle,
                backgroundColor: Colors.grey.shade100,
                fallback: patientAvatar == null || patientAvatar.isEmpty
                    ? Icon(
                        Icons.person_outline,
                        color: AppColors.cyan,
                        size: context.r(25),
                      )
                    : const SizedBox.shrink(),
                showLoadingIndicator: false,
              ),
              SizedBox(width: context.w(10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.semiBoldPx14.copyWith(fontSize: context.sp(14)),
                    ),
                    SizedBox(height: context.h(4)),
                    Text(
                      '$doctorName · $specialtyName',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.regularPx11.copyWith(fontSize: context.sp(11), color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              SizedBox(width: context.w(6)),
              _StatusBadge(status: status),
            ],
          ),
          SizedBox(height: context.h(12)),
          Divider(height: 1, color: Colors.grey.shade200),
          SizedBox(height: context.h(12)),
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  icon: Icons.calendar_today_outlined,
                  label: t.date,
                  value: workDate,
                ),
              ),
              Expanded(
                child: _InfoItem(
                  icon: Icons.access_time,
                  label: t.time,
                  value: appointmentTime,
                ),
              ),
              Expanded(
                child: _InfoItem(
                  icon: Icons.payments_outlined,
                  label: t.fee,
                  value: '\$$fee',
                ),
              ),
            ],
          ),
          SizedBox(height: context.h(14)),
          Row(
            children: [
              if (isUpcoming) ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: EdgeInsets.symmetric(vertical: context.h(10)),
                    ),
                    child: Text(t.cancel),
                  ),
                ),
                SizedBox(width: context.w(8)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onComplete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cyan,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: context.h(10)),
                    ),
                    child: Text(t.complete),
                  ),
                ),
              ] else ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: onViewDetails,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.cyan,
                      side: const BorderSide(color: AppColors.cyan),
                      padding: EdgeInsets.symmetric(vertical: context.h(10)),
                    ),
                    child: Text(t.viewDetails),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}


String _formatTime(String value) {
  final parts = value.split(':');
  return parts.length >= 2 ? '${parts[0]}:${parts[1]}' : value;
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: context.r(14), color: Colors.grey.shade600),
            SizedBox(width: context.w(4)),
            Flexible(
              child: Text(
                label,
                style: context.regularPx10.copyWith(fontSize: context.sp(10), color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
        SizedBox(height: context.h(5)),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.semiBoldPx11.copyWith(fontSize: context.sp(11)),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      'completed' => Colors.green,
      'cancelled' => Colors.red,
      _ => AppColors.cyan,
    };

    final label = switch (status) {
      'completed' => t.completed,
      'cancelled' => t.cancelled,
      _ => t.upcoming,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(8),
        vertical: context.h(5),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Text(
        label,
        style: context.semiBoldPx10.copyWith(fontSize: context.sp(10), color: color),
      ),
    );
  }
}
