import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorStatusBadge extends StatelessWidget {
  const DoctorStatusBadge({
    super.key,
    required this.isActive,
    this.compact = false,
  });

  final bool isActive;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final statusColor = isActive
        ? AppColors.success
        : const Color(0xFFEF4444);

    final backgroundColor = isActive
        ? AppColors.surfaceMint
        : const Color(0xFFFEECEC);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(compact ? 8 : 12),
        vertical: context.h(compact ? 5 : 6),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.w(compact ? 6 : 7),
            height: context.w(compact ? 6 : 7),
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: context.w(compact ? 5 : 6)),
          Text(
            isActive ? t.active : t.inactive,
            style: context.semiBold.copyWith(fontSize: context.sp(compact ? 10 : 12), color: statusColor),
          ),
        ],
      ),
    );
  }
}

