import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.onTap,
    this.showArrow = true,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.r(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.h(12)),
        child: Row(
          children: [
            Container(
              width: context.w(32),
              height: context.w(32),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: context.sp(18), color: iconColor),
            ),
            SizedBox(width: context.w(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.lightPx16.copyWith(
                      fontSize: context.sp(16),
                      color: AppColors.textSub,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: context.h(4)),
                    Text(
                      subtitle!,
                      style: context.lightPx12.copyWith(
                        fontSize: context.sp(12),
                        color: AppColors.textSub,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (showArrow && onTap != null)
              Icon(
                Icons.chevron_right,
                size: context.sp(20),
                color: AppColors.textSub,
              ),
          ],
        ),
      ),
    );
  }
}
