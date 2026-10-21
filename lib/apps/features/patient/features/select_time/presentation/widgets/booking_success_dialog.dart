import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class BookingSuccessDialog extends StatelessWidget {
  const BookingSuccessDialog({
    super.key,
    required this.doctor,
    required this.date,
    required this.time,
    required this.fee,
    required this.onDone,
  });

  final DoctorModel doctor;
  final DateTime date;
  final String time;
  final Object fee;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      contentPadding: EdgeInsets.all(context.w(24)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.primary,
            size: context.r(64),
          ),
          SizedBox(height: context.h(16)),
          // Text(
          //   t.bookingSuccessful,
          //   textAlign: TextAlign.center,
          //   style: context.semiBoldPx20,
          // ),
          SizedBox(height: context.h(20)),
          Text(
            doctor.fullName,
            textAlign: TextAlign.center,
            style: context.semiBoldPx16,
          ),
          SizedBox(height: context.h(12)),
          _DetailRow(
            label: t.date,
            value: '${date.day}/${date.month}/${date.year}',
          ),
          SizedBox(height: context.h(10)),
          _DetailRow(label: t.time, value: time),
          SizedBox(height: context.h(10)),
          _DetailRow(label: t.fee, value: fee.toString()),
          SizedBox(height: context.h(24)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onDone,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: Text(t.done),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: context.regularPx14.copyWith(color: Colors.grey),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: context.semiBoldPx14,
          ),
        ),
      ],
    );
  }
}
