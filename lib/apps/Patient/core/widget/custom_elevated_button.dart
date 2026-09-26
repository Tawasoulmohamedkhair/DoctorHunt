import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.label,
    this.height,
    this.width,
  });

  final void Function()? onPressed;
  final Widget? icon;
  final Widget label;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.r(12)),
      ),
      elevation: 0,
      padding: EdgeInsets.zero,
    );

    return SizedBox(
      width: width != null ? context.w(width!) : context.w(295),
      height: height != null ? context.h(height!) : context.h(54),
      child: icon != null
          ? ElevatedButton.icon(
              style: buttonStyle,
              onPressed: onPressed,
              icon: icon!,
              label: label,
            )
          : ElevatedButton(
              style: buttonStyle,
              onPressed: onPressed,
              child: label,
            ),
    );
  }
}
