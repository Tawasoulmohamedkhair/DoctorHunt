import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_state.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class AvailableTimeSlots extends StatelessWidget {
  const AvailableTimeSlots({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.onSlotSelected,
  });

  final List<BookingTimeSlot> slots;
  final BookingTimeSlot? selectedSlot;
  final ValueChanged<BookingTimeSlot> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    if (slots.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: context.w(10),
      runSpacing: context.h(10),
      children: slots.map((slot) {
        final isSelected = selectedSlot == slot;

        return ChoiceChip(
          label: Text(
            slot.label,
            style: context.medium.copyWith(
              color: isSelected ? AppColors.white : AppColors.primary,
            ),
          ),
          selected: isSelected,
          onSelected: (_) => onSlotSelected(slot),
          selectedColor: AppColors.primary,
          backgroundColor: AppColors.white,
          side: BorderSide(
            color: isSelected ? AppColors.primary : AppColors.darkgray,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.r(10)),
          ),
          showCheckmark: false,
        );
      }).toList(),
    );
  }
}
