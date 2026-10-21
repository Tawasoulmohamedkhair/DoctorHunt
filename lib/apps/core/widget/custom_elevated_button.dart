import 'dart:math' as math;

import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.height,
    this.width,
    this.backgroundcolor = AppColors.primary,
    this.disabledBackgroundColor,
    this.expand = false,
  });

  final void Function()? onPressed;
  final Widget? icon;
  final Widget label;
  final double? height;
  final double? width;
  final Color backgroundcolor;
  final Color? disabledBackgroundColor;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundcolor,
      disabledBackgroundColor: disabledBackgroundColor ?? AppColors.primary,
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.r(12)),
      ),
      elevation: 0,
      padding: EdgeInsets.zero,
    );

    final maxAllowedWidth = context.safeWidth;
    final calculatedWidth = width != null ? context.w(width!) : context.w(295);

    final finalWidth = expand
        ? maxAllowedWidth
        : math.min(calculatedWidth, maxAllowedWidth);

    return SizedBox(
      width: finalWidth,
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
