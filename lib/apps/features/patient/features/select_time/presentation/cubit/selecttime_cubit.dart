import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'selecttime_state.dart';

class SelectTimeCubit extends Cubit<SelectTimeState> {
  final DoctorRepository _repository;
  final AppointmentRepository _appointmentRepository;

  SelectTimeCubit(this._repository, this._appointmentRepository)
    : super(
        SelectTimeState(
          displayedMonth: DateTime(DateTime.now().year, DateTime.now().month),
        ),
      );

  Future<void> loadMonth(String doctorId, DateTime month) async {
    final normalizedMonth = DateTime(month.year, month.month);

    emit(SelectTimeState(displayedMonth: normalizedMonth, isLoading: true));

    try {
      final availability = await _repository.getDoctorAvailabilityForMonth(
        doctorId: doctorId,
        month: normalizedMonth,
      );
      final ids = availability
          .map((row) => row['id'] as String)
          .toSet()
          .toList();

      final bookedRows = ids.isEmpty
          ? <Map<String, dynamic>>[]
          : await _repository.getBookedSlots(ids);

      final bookedKeys = bookedRows.map((row) {
        final id = row['availability_id'] as String;
        final time = _normalizeTime(row['appointment_time'].toString());

        return '$id|$time';
      }).toSet();

      // DateTime.now() uses the device's local time.
      // The app device is expected to use Oman time (Asia/Muscat).
      final now = DateTime.now();
      final slotsByDate = <DateTime, List<BookingTimeSlot>>{};

      for (final row in availability) {
        final workDate = DateTime.parse(row['work_date'] as String);
        final dateKey = DateTime(workDate.year, workDate.month, workDate.day);

        final start = _parseTime(row['start_time'].toString());
        final end = _parseTime(row['end_time'].toString());
        final duration = row['slot_duration_minutes'] as int;
        final availabilityId = row['id'] as String;

        if (duration <= 0) continue;

        var minutes = start.hour * 60 + start.minute;
        final endMinutes = end.hour * 60 + end.minute;

        while (minutes + duration <= endMinutes) {
          final hour = minutes ~/ 60;
          final minute = minutes % 60;
          final time = _formatTime(hour, minute);

          final slotDateTime = DateTime(
            dateKey.year,
            dateKey.month,
            dateKey.day,
            hour,
            minute,
          );

          final isFuture = slotDateTime.isAfter(now);
          final isBooked = bookedKeys.contains('$availabilityId|$time');

          if (isFuture && !isBooked) {
            slotsByDate.putIfAbsent(dateKey, () => []);

            slotsByDate[dateKey]!.add(
              BookingTimeSlot(
                availabilityId: availabilityId,
                time: time,
                label: _formatLabel(hour, minute),
              ),
            );
          }

          minutes += duration;
        }
      }

      for (final slots in slotsByDate.values) {
        slots.sort((a, b) => a.time.compareTo(b.time));
      }

      emit(
        SelectTimeState(
          displayedMonth: normalizedMonth,
          slotsByDate: slotsByDate,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Failed to load appointment slots: $e');
      debugPrintStack(stackTrace: stackTrace);

      emit(
        SelectTimeState(
          displayedMonth: normalizedMonth,
          errorMessage: t.unableToLoadAvailableTimes,
        ),
      );
    }
  }

  void selectDate(DateTime date) {
    final normalized = DateUtils.dateOnly(date);

    if (!state.isDateAvailable(normalized)) return;

    emit(
      state.copyWith(
        selectedDate: normalized,
        clearSelectedSlot: true,
        clearError: true,
        clearBookingError: true,
        clearBookingId: true,
      ),
    );
  }

  void selectTime(BookingTimeSlot slot) {
    if (state.selectedDate == null || !state.selectedDateSlots.contains(slot)) {
      return;
    }

    emit(
      state.copyWith(
        selectedSlot: slot,
        clearBookingError: true,
        clearBookingId: true,
      ),
    );
  }

  Future<void> confirmBooking({required String doctorId}) async {
    final slot = state.selectedSlot;

    if (slot == null ||
        state.selectedDate == null ||
        state.isBooking ||
        state.isLoading) {
      return;
    }

    emit(
      state.copyWith(
        isBooking: true,
        clearBookingError: true,
        clearBookingId: true,
      ),
    );
    debugPrint('Confirm booking tapped');
    debugPrint('Selected date: ${state.selectedDate}');
    debugPrint('Availability ID: ${slot.availabilityId}');
    debugPrint('Appointment time: ${slot.time}');
    try {
      final bookingId = await _appointmentRepository.bookAppointment(
        availabilityId: slot.availabilityId,
        appointmentTime: '${slot.time}:00',
      );
      debugPrint('Booking succeeded. Booking ID: $bookingId');
      emit(
        state.copyWith(
          isBooking: false,
          bookingId: bookingId,
          clearBookingError: true,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Appointment booking failed: $e');
      debugPrintStack(stackTrace: stackTrace);

      emit(
        state.copyWith(
          isBooking: false,
          bookingError: t.unableToBookAppointment,
        ),
      );

      // Refresh availability after a failed attempt, since another
      // patient may have booked the selected slot.
      await loadMonth(doctorId, state.displayedMonth);
    }
  }

  static TimeOfDay _parseTime(String value) {
    final parts = value.split(':');

    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String _formatTime(int hour, int minute) {
    return '${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')}';
  }

  static String _normalizeTime(String value) {
    final parts = value.split(':');

    return '${parts[0].padLeft(2, '0')}:'
        '${parts[1].padLeft(2, '0')}';
  }

  static String _formatLabel(int hour, int minute) {
    final period = hour >= 12 ? t.pm : t.am;
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;

    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }
}
