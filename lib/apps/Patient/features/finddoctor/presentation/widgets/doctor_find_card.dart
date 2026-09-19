import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/data/find_doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
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
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  doctor.imageUrl,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    width: 70.w,
                    height: 70.w,
                    color: AppColors.grey,
                    child: const Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
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
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      getSpecialty(context, doctor.specialtyKey),
                      style: context.regular13primary,
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      '${doctor.yearsOfExperience} ${context.t.find.years_experience}',
                      style: context.regular14textSub,
                    ),
                    SizedBox(height: 6.h),

                    Row(
                      children: [
                        _dotInfo(context, '${doctor.ratingPercentage}%'),
                        SizedBox(width: 12.w),
                        _dotInfo(
                          context,
                          '${doctor.patientStoriesCount} ${context.t.find.patient_stories}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.t.find.next_available,
                      style: context.regular13primary,
                    ),
                    SizedBox(height: 2.h),

                    Text(
                      '${doctor.nextAvailableTime} ${context.t.find.tomorrow}',
                      style: context.regular14textSub,
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                width: 112,
                height: 34,
                onPressed: onBookNow,
                label: Text(
                  context.t.details.bookNow,
                  style: context.medium12white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dotInfo(BuildContext context, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(text, style: context.light11textSub),
      ],
    );
  }

  String getFindDoctorName(BuildContext context, String key) {
    switch (key) {
      case 'shruti':
        return context.t.find.doctors.shruti;
      case 'watamaniuk':
        return context.t.find.doctors.watamaniuk;
      case 'crownover':
        return context.t.find.doctors.crownover;
      case 'balestra':
        return context.t.find.doctors.balestra;
      default:
        return key;
    }
  }

  String getSpecialty(BuildContext context, String key) {
    switch (key) {
      case 'dentist':
        return context.t.specialties.dentist;
      default:
        return key;
    }
  }
}
