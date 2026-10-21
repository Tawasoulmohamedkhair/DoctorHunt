import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final imageUrl = doctor.imageUrl;

    return Container(
      padding: EdgeInsets.all(context.w(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          AppImage(
            imageUrl: imageUrl != null && imageUrl.isNotEmpty ? imageUrl : null,
            width: context.w(72),
            height: context.h(72),
            fit: BoxFit.cover,
            borderRadius: 10,
            backgroundColor: Colors.transparent,
            fallback: const Icon(Icons.person, size: 42),
            showLoadingIndicator: false,
          ),
          SizedBox(width: context.w(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.fullName, style: context.semiBoldPx15),
                SizedBox(height: context.h(6)),
                Text(
                  localizeSpecialty(context, doctor.specialtyName),
                  style: context.regularPx13.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: context.h(6)),
                Text(
                  '${t.fee}: ${doctor.fee}',
                  style: context.medium.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
