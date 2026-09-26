// ==================== Stats ====================
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/stat_item.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  final dynamic doctor;
  const StatsRow({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatItem(value: '${doctor.running}', label: t.running),
        const SizedBox(width: 12),
        StatItem(value: '${doctor.ongoing}', label: t.ongoing),
        const SizedBox(width: 12),
        StatItem(
          value: '${doctor.patients}',
          label:t.patient,
        ),
      ],
    );
  }
}


