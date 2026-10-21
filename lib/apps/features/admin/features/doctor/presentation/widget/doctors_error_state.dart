import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorsErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const DoctorsErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override

  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.w(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: context.r(40),
              color: Colors.redAccent,
            ),
            SizedBox(height: context.h(12)),
            Text(
              t.error,
              textAlign: TextAlign.center,
              style: context.boldPx16.copyWith(fontSize: context.sp(16), color: AppColors.slate),
            ),
            SizedBox(height: context.h(8)),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.regularPx12.copyWith(fontSize: context.sp(12), color: AppColors.slateBlue),
            ),
            SizedBox(height: context.h(16)),
            TextButton(onPressed: onRetry, child: Text(t.retry)),
          ],
        ),
      ),
    );
  }
}

