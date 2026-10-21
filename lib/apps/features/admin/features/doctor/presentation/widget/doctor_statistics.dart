import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorStatistics extends StatelessWidget {
  final int activeDoctors;
  final int totalDoctors;

  const DoctorStatistics({
    super.key,
    required this.activeDoctors,
    required this.totalDoctors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatisticCard(title: t.activeDoctors, value: activeDoctors),
        ),
        SizedBox(width: context.w(12)),
        Expanded(
          child: _StatisticCard(title: t.totalDoctors, value: totalDoctors),
        ),
      ],
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String title;
  final int value;

  const _StatisticCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(16)),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.regularPx11.copyWith(fontSize: context.sp(11), color: AppColors.slateBlue),
          ),
          SizedBox(height: context.h(4)),
          Text(
            '$value',
            style: context.boldPx18.copyWith(fontSize: context.sp(18), color: AppColors.slate),
          ),
        ],
      ),
    );
  }
}

