
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorDetailsInfoCard extends StatelessWidget {
  const DoctorDetailsInfoCard({
    super.key,
    required this.doctor,
  });

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          context.r(16),
        ),
        border: Border.all(
          color: const Color(0xFFE4ECE6),
        ),
      ),
      child: Column(
        children: [
          _InfoRow(
            label: t.specialty,
            value: localizeSpecialty(context, doctor.specialtyName),
            icon: Icons.medical_services_outlined,
          ),
          _Divider(),
          _InfoRow(
            label: t.rating,
            value:
                '${doctor.rating.toStringAsFixed(1)} • ${doctor.reviewsCount} ${t.reviews}',
            icon: Icons.star_rounded,
            iconColor: const Color(0xFFF6D060),
          ),
          _Divider(),
          _InfoRow(
            label: t.consultationFee,
            value: '\$${doctor.fee.toStringAsFixed(2)}',
            icon: Icons.payments_outlined,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
    this.iconColor,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.w(16)),
      child: Row(
        children: [
          Container(
            width: context.w(38),
            height: context.w(38),
            decoration: const BoxDecoration(
              color: AppColors.surfaceMint,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: context.r(19),
              color: iconColor ??  AppColors.success,
            ),
          ),
          SizedBox(width: context.w(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.regularPx12.copyWith(fontSize: context.sp(12), color: AppColors.textSub),
                ),
                SizedBox(height: context.h(4)),
                Text(
                  value,
                  style: context.semiBoldPx15.copyWith(fontSize: context.sp(15), color: AppColors.textDeep),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFE8EEE9),
    );
  }
}
