import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AppointmentDoctorHeader extends StatelessWidget {
  const AppointmentDoctorHeader({
    super.key,
    required this.doctorName,
    required this.specialtyName,
    required this.status,
    this.imageUrl,
  });

  final String doctorName;
  final String specialtyName;
  final String status;
  final String? imageUrl;

  Color get _statusColor {
    switch (status) {
      case 'completed':
        return const Color(0xFF4285F4);
      case 'cancelled':
        return const Color(0xFFF15B5D);
      default:
        return AppColors.primary;
    }
  }

  Color get _statusBackground {
    switch (status) {
      case 'completed':
        return const Color(0xFFEAF2FF);
      case 'cancelled':
        return const Color(0xFFFFF0F0);
      default:
        return AppColors.surfaceMint;
    }
  }
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final statusLabel = switch (status) {
      'completed' => t.completed,
      'cancelled' => t.cancelled,
      'upcoming' => t.upcoming,
      _ => status,
    };

    return Row(
      children: [
AppImage(
  imageUrl: imageUrl,
  width: 66,
  height: 66,
  borderRadius: 8,
  fit: BoxFit.cover,
  backgroundColor: AppColors.surfaceMint,
  fallback: const Icon(
    Icons.person,
    color: AppColors.primary,
    size: 32,
  ),
),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.mediumPx14.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 5),
              Text(
                specialtyName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.lightPx12.copyWith(color: AppColors.textSub),
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: _statusBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: _statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                statusLabel,
                style: context.mediumPx9.copyWith(color: _statusColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

