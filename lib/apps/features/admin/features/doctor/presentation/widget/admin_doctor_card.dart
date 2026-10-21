import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_status_badge.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminDoctorCard extends StatelessWidget {
  const AdminDoctorCard({super.key, required this.doctor, this.onTap});

  final DoctorModel doctor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(context.r(16)),
        child: Container(
          padding: EdgeInsets.all(context.w(12)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.r(16)),
            border: Border.all(color: const Color(0xFFF1F5F9)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x07000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              AppImage(
                imageUrl: doctor.imageUrl,
                width: context.w(72),
                height: context.w(72),
                shape: AppImageShape.rectangle,
                borderRadius: context.r(12),
                fit: BoxFit.cover,
                backgroundColor: AppColors.lightGreys,
                fallback: Image.asset(
                  Assets.images.profile.path,
                  width: context.w(72),
                  height: context.w(72),
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const Icon(Icons.person),
                ),
              ),
              SizedBox(width: context.w(12)),
              Expanded(child: _DoctorInformation(doctor: doctor)),
              SizedBox(width: context.w(8)),
              DoctorStatusBadge(isActive: doctor.isActive, compact: true),
            ],
          ),
        ),
      ),
    );
  }
}

class _DoctorInformation extends StatelessWidget {
  const _DoctorInformation({required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctor.fullName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.boldPx14.copyWith(fontSize: context.sp(14), color: AppColors.slate),
        ),
        SizedBox(height: context.h(4)),
        Text(
          localizeSpecialty(context, doctor.specialtyName),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.regularPx11.copyWith(fontSize: context.sp(11), color: const Color(0xFF64748B)),
        ),
        SizedBox(height: context.h(6)),
        Row(
          children: [
            Icon(
              Icons.star_rounded,
              size: context.r(16),
              color: const Color(0xFFF6D060),
            ),
            SizedBox(width: context.w(3)),
            Text(
              doctor.rating.toStringAsFixed(1),
              style: context.semiBoldPx11.copyWith(fontSize: context.sp(11), color: const Color(0xFF334155)),
            ),
            SizedBox(width: context.w(5)),
            Text(
              '(${doctor.reviewsCount})',
              style: context.regularPx10.copyWith(fontSize: context.sp(10), color: AppColors.slateBlue),
            ),
          ],
        ),
      ],
    );
  }
}
