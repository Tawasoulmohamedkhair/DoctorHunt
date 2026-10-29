
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/available_time_slots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const firstSlot = BookingTimeSlot(
    time: '09:00',
    label: '09:00 AM',
    availabilityId: 'availability-1',
  );

  const secondSlot = BookingTimeSlot(
    time: '10:00',
    label: '10:00 AM',
    availabilityId: 'availability-2',
  );

  Future<void> pumpAvailableTimeSlots(
    WidgetTester tester, {
    required List<BookingTimeSlot> slots,
    BookingTimeSlot? selectedSlot,
    required ValueChanged<BookingTimeSlot> onSlotSelected,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AvailableTimeSlots(
            slots: slots,
            selectedSlot: selectedSlot,
            onSlotSelected: onSlotSelected,
          ),
        ),
      ),
    );
  }

  group('AvailableTimeSlots', () {
    testWidgets('displays all available time slots', (tester) async {
      await pumpAvailableTimeSlots(
        tester,
        slots: const [firstSlot, secondSlot],
        onSlotSelected: (_) {},
      );

      expect(find.text('09:00 AM'), findsOneWidget);
      expect(find.text('10:00 AM'), findsOneWidget);
      expect(find.byType(ChoiceChip), findsNWidgets(2));
    });

    testWidgets('renders nothing when slots are empty', (tester) async {
      await pumpAvailableTimeSlots(
        tester,
        slots: const [],
        onSlotSelected: (_) {},
      );

      expect(find.byType(ChoiceChip), findsNothing);
    });

    testWidgets('marks the selected slot as selected', (tester) async {
      await pumpAvailableTimeSlots(
        tester,
        slots: const [firstSlot, secondSlot],
        selectedSlot: firstSlot,
        onSlotSelected: (_) {},
      );

      final firstChip = tester.widget<ChoiceChip>(
        find.widgetWithText(ChoiceChip, '09:00 AM'),
      );

      final secondChip = tester.widget<ChoiceChip>(
        find.widgetWithText(ChoiceChip, '10:00 AM'),
      );

      expect(firstChip.selected, isTrue);
      expect(secondChip.selected, isFalse);
    });

    testWidgets('calls onSlotSelected with the tapped slot', (
      tester,
    ) async {
      BookingTimeSlot? selectedSlot;

      await pumpAvailableTimeSlots(
        tester,
        slots: const [firstSlot, secondSlot],
        onSlotSelected: (slot) {
          selectedSlot = slot;
        },
      );

      await tester.tap(find.text('10:00 AM'));
      await tester.pump();

      expect(selectedSlot, secondSlot);
    });

    testWidgets('renders without throwing an exception', (tester) async {
      await pumpAvailableTimeSlots(
        tester,
        slots: const [firstSlot, secondSlot],
        onSlotSelected: (_) {},
      );

      expect(tester.takeException(), isNull);
    });
  });
}