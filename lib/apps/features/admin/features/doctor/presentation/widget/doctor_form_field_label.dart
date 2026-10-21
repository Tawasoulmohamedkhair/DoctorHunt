import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorFormFieldLabel extends StatelessWidget {
  const DoctorFormFieldLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.semiBoldPx11.copyWith(fontSize: context.sp(11), color: AppColors.textMuted, letterSpacing: context.sp(0.6)),
    );
  }
}

