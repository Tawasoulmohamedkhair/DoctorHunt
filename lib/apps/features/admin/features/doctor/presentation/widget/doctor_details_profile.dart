import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_status_badge.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorDetailsProfile extends StatelessWidget {
  const DoctorDetailsProfile({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppImage(
          imageUrl: doctor.imageUrl,
          width: context.w(112),
          height: context.w(112),
          shape: AppImageShape.circle,
          fit: BoxFit.cover,
          backgroundColor:  AppColors.lightGreys,
          fallback: Image.asset(
            Assets.images.profile.path,
            width: context.w(112),
            height: context.w(112),
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const Icon(Icons.person),
          ),
        ),
        SizedBox(height: context.h(14)),
        Text(
          doctor.fullName,
          textAlign: TextAlign.center,
          style: context.boldPx22.copyWith(fontSize: context.sp(22), color: AppColors.textDeep),
        ),
        SizedBox(height: context.h(8)),
        DoctorStatusBadge(isActive: doctor.isActive),
      ],
    );
  }
}
