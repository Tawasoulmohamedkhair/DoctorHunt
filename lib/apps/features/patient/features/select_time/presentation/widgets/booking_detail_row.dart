import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class BookingDetailRow extends StatelessWidget {
  const BookingDetailRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: context.regularPx14.copyWith(color: Colors.grey.shade600),
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
