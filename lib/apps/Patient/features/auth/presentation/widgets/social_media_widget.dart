import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/gen/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.auth;

    return Row(
      children: [
        Expanded(
          child: _socialItem(context,
            image: Assets.images.google.image(width: 20.w, height: 20.h),
            text: t.google,
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: _socialItem(context,
            image: Assets.images.facebook.image(width: 20.w, height: 20.h),
            text: t.facebook,
          ),
        ),
      ],
    );
  }

  Widget _socialItem(BuildContext context,{required Widget image, required String text}) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 22.r,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(width: 8.w),
          Text(text,style: context.light16textSecondary,),
        ],
      ),
    );
  }
}
