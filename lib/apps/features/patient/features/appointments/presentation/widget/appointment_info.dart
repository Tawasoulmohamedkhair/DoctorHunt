import 'package:flutter/material.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({super.key, 
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.surfaceMint,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 14, color: AppColors.primary),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,

                style: context.regularPx9.copyWith(color: Color(0xFF858EA9)),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: context.mediumPx11.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

