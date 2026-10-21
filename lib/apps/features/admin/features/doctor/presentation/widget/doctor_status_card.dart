
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorStatusCard extends StatelessWidget {
  const DoctorStatusCard({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  final bool isActive;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(16)),
        border: Border.all(
          color: AppColors.borderMuted,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: context.w(36),
            height: context.w(36),
            decoration: BoxDecoration(
              color: AppColors.lightGreys,
              borderRadius: BorderRadius.circular(
                context.r(12),
              ),
            ),
            child: Icon(
              Icons.medical_services_outlined,
              size: context.r(20),
              color: AppColors.textMuted,
            ),
          ),
          SizedBox(width: context.w(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.doctorStatus,
                  style: context.semiBoldPx14.copyWith(fontSize: context.sp(14), color: AppColors.textDeep),
                ),
                SizedBox(height: context.h(2)),
                Text(
                  isActive ? t.activeAndAvailable : t.inactive,
                  style: context.regularPx12.copyWith(fontSize: context.sp(12), color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          Switch(
            value: isActive,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.success,
          ),
        ],
      ),
    );
  }
}

