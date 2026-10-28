import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_elevated_button.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class DoctorDetailsActions extends StatelessWidget {
  const DoctorDetailsActions({
    super.key,
    required this.onEdit,
    required this.onManageAvailability,
  });

  final VoidCallback onEdit;
  final VoidCallback onManageAvailability;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          onPressed: onEdit,
          expand: true,
          height: 52,
          backgroundcolor:  AppColors.success,
          label: Text(
            t.editDoctor,
            style: context.semiBoldPx15.copyWith(
              fontSize: context.sp(15),
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(height: context.h(12)),
        SizedBox(
          width: double.infinity,
          height: context.h(52),
          child: OutlinedButton(
            onPressed: onManageAvailability,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.success,
              backgroundColor: AppColors.white,
              side: const BorderSide(color: AppColors.success),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.r(12)),
              ),
            ),
            child: Text(
              t.manageAvailability,
              style: context.semiBoldPx15.copyWith(
                fontSize: context.sp(15),
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
