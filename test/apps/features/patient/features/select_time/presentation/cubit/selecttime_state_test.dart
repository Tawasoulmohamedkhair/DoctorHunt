
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DateTime displayedMonth;
  late DateTime selectedDate;
  late BookingTimeSlot morningSlot;
  late BookingTimeSlot afternoonSlot;
  late SelectTimeState state;

  setUp(() {
    displayedMonth = DateTime(2026, 10);
    selectedDate = DateTime(2026, 10, 29);

    morningSlot = const BookingTimeSlot(
      availabilityId: 'availability-1',
      time: '09:00',
      label: '9:00 AM',
    );

    afternoonSlot = const BookingTimeSlot(
      availabilityId: 'availability-2',
      time: '14:00',
      label: '2:00 PM',
    );

    state = SelectTimeState(
      displayedMonth: displayedMonth,
      selectedDate: selectedDate,
      selectedSlot: morningSlot,
      slotsByDate: {
        selectedDate: [morningSlot, afternoonSlot],
      },
      isLoading: true,
      errorMessage: 'Loading error',
      isBooking: true,
      bookingError: 'Booking error',
      bookingId: 'booking-1',
    );
  });

  group('BookingTimeSlot', () {
    test('equal slots with the same properties are equal', () {
      const first = BookingTimeSlot(
        availabilityId: 'availability-1',
        time: '09:00',
        label: '9:00 AM',
      );

      const second = BookingTimeSlot(
        availabilityId: 'availability-1',
        time: '09:00',
        label: '9:00 AM',
      );

      expect(first, equals(second));
    });

    test('slots with different properties are not equal', () {
      const first = BookingTimeSlot(
        availabilityId: 'availability-1',
        time: '09:00',
        label: '9:00 AM',
      );

      const second = BookingTimeSlot(
        availabilityId: 'availability-2',
        time: '10:00',
        label: '10:00 AM',
      );

      expect(first, isNot(equals(second)));
    });
  });

  group('selectedDateSlots', () {
    test('returns slots for the selected date', () {
      expect(
        state.selectedDateSlots,
        [morningSlot, afternoonSlot],
      );
    });

    test('returns an empty list when no date is selected', () {
      final result = SelectTimeState(
        displayedMonth: displayedMonth,
      );

      expect(result.selectedDateSlots, isEmpty);
    });

    test('returns an empty list when the selected date has no slots', () {
      final result = SelectTimeState(
        displayedMonth: displayedMonth,
        selectedDate: DateTime(2026, 10, 30),
        slotsByDate: {
          selectedDate: [morningSlot],
        },
      );

      expect(result.selectedDateSlots, isEmpty);
    });

    test('matches the selected date regardless of its time component', () {
      final result = SelectTimeState(
        displayedMonth: displayedMonth,
        selectedDate: DateTime(2026, 10, 29, 18, 30),
        slotsByDate: {
          selectedDate: [morningSlot],
        },
      );

      expect(result.selectedDateSlots, [morningSlot]);
    });
  });

  group('isDateAvailable', () {
    test('returns true when the date has available slots', () {
      expect(state.isDateAvailable(selectedDate), isTrue);
    });

    test('returns false when the date has no slots', () {
      expect(
        state.isDateAvailable(DateTime(2026, 10, 30)),
        isFalse,
      );
    });

    test('returns false when the slots list is empty', () {
      final result = SelectTimeState(
        displayedMonth: displayedMonth,
        slotsByDate: {
          selectedDate: [],
        },
      );

      expect(result.isDateAvailable(selectedDate), isFalse);
    });

    test('matches the date regardless of its time component', () {
      expect(
        state.isDateAvailable(DateTime(2026, 10, 29, 22, 15)),
        isTrue,
      );
    });
  });

  group('copyWith', () {
    test('preserves existing values when no arguments are provided', () {
      final result = state.copyWith();

      expect(result, state);
    });

    test('updates the displayed month', () {
      final newMonth = DateTime(2026, 11);

      final result = state.copyWith(
        displayedMonth: newMonth,
      );

      expect(result.displayedMonth, newMonth);
      expect(result.selectedDate, selectedDate);
      expect(result.selectedSlot, morningSlot);
    });

    test('updates the selected date and slot', () {
      final newDate = DateTime(2026, 10, 30);

      final result = state.copyWith(
        selectedDate: newDate,
        selectedSlot: afternoonSlot,
      );

      expect(result.selectedDate, newDate);
      expect(result.selectedSlot, afternoonSlot);
    });

    test('updates loading and booking statuses', () {
      final result = state.copyWith(
        isLoading: false,
        isBooking: false,
      );

      expect(result.isLoading, isFalse);
      expect(result.isBooking, isFalse);
    });

    test('updates slotsByDate', () {
      final newSlots = {
        DateTime(2026, 10, 30): [afternoonSlot],
      };

      final result = state.copyWith(
        slotsByDate: newSlots,
      );

      expect(result.slotsByDate, newSlots);
    });

    test('clears the selected date when clearSelectedDate is true', () {
      final result = state.copyWith(
        clearSelectedDate: true,
      );

      expect(result.selectedDate, isNull);
    });

    test('clears the selected slot when clearSelectedSlot is true', () {
      final result = state.copyWith(
        clearSelectedSlot: true,
      );

      expect(result.selectedSlot, isNull);
    });

    test('clears the general error when clearError is true', () {
      final result = state.copyWith(
        clearError: true,
      );

      expect(result.errorMessage, isNull);
    });

    test('clears the booking error when clearBookingError is true', () {
      final result = state.copyWith(
        clearBookingError: true,
      );

      expect(result.bookingError, isNull);
    });

    test('clears the booking ID when clearBookingId is true', () {
      final result = state.copyWith(
        clearBookingId: true,
      );

      expect(result.bookingId, isNull);
    });

    test('clears multiple values at once', () {
      final result = state.copyWith(
        clearSelectedDate: true,
        clearSelectedSlot: true,
        clearError: true,
        clearBookingError: true,
        clearBookingId: true,
      );

      expect(result.selectedDate, isNull);
      expect(result.selectedSlot, isNull);
      expect(result.errorMessage, isNull);
      expect(result.bookingError, isNull);
      expect(result.bookingId, isNull);
    });
  });

  group('Equatable', () {
    test('states with the same properties are equal', () {
      final first = SelectTimeState(
        displayedMonth: displayedMonth,
        selectedDate: selectedDate,
        selectedSlot: morningSlot,
        slotsByDate: {
          selectedDate: [morningSlot, afternoonSlot],
        },
        isLoading: true,
        errorMessage: 'Loading error',
        isBooking: true,
        bookingError: 'Booking error',
        bookingId: 'booking-1',
      );

      expect(first, equals(state));
    });

    test('states with different properties are not equal', () {
      final result = state.copyWith(
        isLoading: false,
      );

      expect(result, isNot(equals(state)));
    });
  });
}
