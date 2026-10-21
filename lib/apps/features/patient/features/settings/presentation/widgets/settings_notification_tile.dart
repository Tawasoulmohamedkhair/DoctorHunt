import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SettingsNotificationTile extends StatelessWidget {
  const SettingsNotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(12)),
      child: Row(
        children: [
          Container(
            width: context.w(32),
            height: context.w(32),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none,
              size: context.sp(18),
              color: AppColors.successGreen,
            ),
          ),
          SizedBox(width: context.w(12)),
          Expanded(
            child: Text(
              t.notifications,
              style: context.lightPx16.copyWith(
                fontSize: context.sp(16),
                color: AppColors.textSub,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
