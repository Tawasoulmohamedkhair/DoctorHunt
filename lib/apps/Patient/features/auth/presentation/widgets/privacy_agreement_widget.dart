
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyAgreementWidget extends StatelessWidget {
  const PrivacyAgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.auth;

    return Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: AppColors.textSecondary.withValues(alpha: 0.50),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.done,
            color: AppColors.primary,
            size: 10.h,
          ),
        ),
        SizedBox(width: 11.w),
        Expanded(
          child: Text(
            t.agreeAndPrivacy,
            style: context.light12textSub,
          ),
        ),
      ],
    );
  }
}
