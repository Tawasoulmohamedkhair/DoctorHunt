import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/doctor_info_card.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/available_time_slots.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/month_navigation.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SelectTimeSchedule extends StatelessWidget {
  const SelectTimeSchedule({
    super.key,
    required this.state,
    required this.doctor,
    required this.onRetry,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  final SelectTimeState state;
  final DoctorModel doctor;
  final VoidCallback onRetry;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<BookingTimeSlot> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month);

    final previousMonth = DateTime(
      state.displayedMonth.year,
      state.displayedMonth.month - 1,
    );

    final canGoPrevious = !previousMonth.isBefore(currentMonth);
    final canGoNext = true;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: context.w(16)),
      children: [
        DoctorInfoCard(doctor: doctor),
        SizedBox(height: context.h(24)),
        Text(t.selectDateLabel, style: context.medium18textSecondary),
        SizedBox(height: context.h(12)),
        if (state.isLoading)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (state.errorMessage != null)
          Center(
            child: Column(
              children: [
                Text(state.errorMessage!, textAlign: TextAlign.center),
                TextButton(onPressed: onRetry, child: Text(t.retry)),
              ],
            ),
          )
        else ...[
          MonthNavigation(
            month: state.displayedMonth,
            onPrevious: onPreviousMonth,
            onNext: onNextMonth,
            canGoNext: canGoNext,
            canGoPrevious: canGoPrevious,
          ),
          if (_hasAvailableDate(state))
            CalendarDatePicker(
              key: ValueKey(
                '${state.displayedMonth.year}-${state.displayedMonth.month}',
              ),
              initialDate: state.selectedDate ?? _firstAvailableDate(state)!,
              firstDate: _firstDate(state.displayedMonth),
              lastDate: DateTime(
                state.displayedMonth.year,
                state.displayedMonth.month + 1,
                0,
              ),
              currentDate: DateUtils.dateOnly(DateTime.now()),
              selectableDayPredicate: (date) {
                final today = DateUtils.dateOnly(DateTime.now());
                final normalizedDate = DateUtils.dateOnly(date);

                return !normalizedDate.isBefore(today) &&
                    state.isDateAvailable(normalizedDate);
              },
              onDateChanged: onDateSelected,
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
              child: Column(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 42,
                    color: AppColors.borderMuted,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.noAvailableDatesThisMonth,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        ],
        SizedBox(height: context.h(12)),
        Text(t.availableTimeSlots, style: context.medium18textSecondary),
        SizedBox(height: context.h(12)),
        if (state.selectedDate == null)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                t.selectHighlightedDateForTimes,
                textAlign: TextAlign.center,
              ),
            ),
          )
        else if (state.selectedDateSlots.isEmpty)
          Center(child: Text(t.noAvailableTimesForDate))
        else
          AvailableTimeSlots(
            slots: state.selectedDateSlots,
            selectedSlot: state.selectedSlot,
            onSlotSelected: onTimeSelected,
          ),
        SizedBox(height: context.h(24)),
      ],
    );
  }

  static DateTime _firstDate(DateTime month) {
    final today = DateUtils.dateOnly(DateTime.now());
    final firstOfMonth = DateTime(month.year, month.month);
    return firstOfMonth.isBefore(today) ? today : firstOfMonth;
  }

  static bool _hasAvailableDate(SelectTimeState state) {
    final today = DateUtils.dateOnly(DateTime.now());

    return state.slotsByDate.entries.any((entry) {
      return !entry.key.isBefore(today) && entry.value.isNotEmpty;
    });
  }

  static DateTime? _firstAvailableDate(SelectTimeState state) {
    final today = DateUtils.dateOnly(DateTime.now());

    final availableDates =
        state.slotsByDate.entries
            .where(
              (entry) => !entry.key.isBefore(today) && entry.value.isNotEmpty,
            )
            .map((entry) => DateUtils.dateOnly(entry.key))
            .toList()
          ..sort();

    return availableDates.isEmpty ? null : availableDates.first;
  }
}
