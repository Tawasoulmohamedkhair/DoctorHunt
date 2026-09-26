import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/data/find_doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class DoctorFindCard extends StatelessWidget {
  final FindDoctorModel doctor;
  final VoidCallback? onBookNow;
  final VoidCallback? onFavoriteTap;

  const DoctorFindCard({
    super.key,
    required this.doctor,
    this.onBookNow,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DetailsRoute(doctorId: doctor.id).go(context),
      child: Container(
        margin: EdgeInsets.only(bottom: context.h(12)),
        padding: EdgeInsets.all(context.w(12)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(context.r(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.r(8)),
                  child: Image.asset(
                    doctor.imageUrl,
                    width: context.w(70),
                    height: context.w(70),
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      width: context.w(70),
                      height: context.w(70),
                      color: AppColors.grey,
                      child: const Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(width: context.w(12)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              getFindDoctorName(context, doctor.nameKey),
                              style: context.medium18textSecondary,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: onFavoriteTap,
                            child: Icon(
                              doctor.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: doctor.isFavorite
                                  ? AppColors.danger
                                  : AppColors.grey,
                              size: context.sp(22),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.h(4)),
                      Text(
                        getSpecialty(context, doctor.specialtyKey),
                        style: context.regular13primary,
                      ),
                      SizedBox(height: context.h(4)),
                      Text(
                        '${doctor.yearsOfExperience} ${t.years_experience}',
                        style: context.regular14textSub,
                      ),
                      SizedBox(height: context.h(6)),
                      Row(
                        children: [
                          _dotInfo(context, '${doctor.ratingPercentage}%'),
                          SizedBox(width: context.w(12)),
                          _dotInfo(
                            context,
                            '${doctor.patientStoriesCount} ${t.patient_stories}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: context.h(12)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.next_available,
                        style: context.regular13primary,
                      ),
                      SizedBox(height: context.h(2)),
                      Text(
                        '${doctor.nextAvailableTime} ${t.tomorrow}',
                        style: context.regular14textSub,
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  width: context.w(112),
                  height: context.h(34),
                  onPressed: onBookNow,
                  label: Text(
                    t.bookNow,
                    style: context.medium12white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dotInfo(BuildContext context, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: context.w(8),
          height: context.w(8),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: context.w(4)),
        Text(text, style: context.light11textSub),
      ],
    );
  }

  String getFindDoctorName(BuildContext context, String key) {
    switch (key) {
      case 'shruti':
        return t.shruti;
      case 'watamaniuk':
        return t.watamaniuk;
      case 'crownover':
        return t.crownover;
      case 'balestra':
        return t.balestra;
      default:
        return key;
    }
  }

  String getSpecialty(BuildContext context, String key) {
    switch (key) {
      case 'dentist':
        return t.dentist;
      default:
        return key;
    }
  }
}
