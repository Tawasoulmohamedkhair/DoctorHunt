
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/available_time_slots.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/select_time_schedule.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = DateUtils.dateOnly(DateTime.now());
  final currentMonth = DateTime(today.year, today.month);

  final firstSlot = BookingTimeSlot(
    availabilityId: 'availability-1',
    time: '09:00',
    label: '09:00 AM',
  );

  final secondSlot = BookingTimeSlot(
    availabilityId: 'availability-1',
    time: '10:00',
    label: '10:00 AM',
  );

  final doctor = DoctorModel(
    id: 'doctor-1',
    fullName: 'Mohamed Ahmed',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    imageUrl: null,
    rating: 4.5,
    reviewsCount: 20,
    fee: 15.0,
    isActive: true,
  );


SelectTimeState createState({
  DateTime? displayedMonth,
  DateTime? selectedDate,
  BookingTimeSlot? selectedSlot,
  Map<DateTime, List<BookingTimeSlot>> slotsByDate = const {},
  bool isLoading = false,
  String? errorMessage,
}) {
  return SelectTimeState(
    displayedMonth: displayedMonth ?? currentMonth,
    selectedDate: selectedDate,
    selectedSlot: selectedSlot,
    slotsByDate: slotsByDate,
    isLoading: isLoading,
    errorMessage: errorMessage,
  );
}


  Future<void> pumpSchedule(
    WidgetTester tester, {
    required SelectTimeState state,
    VoidCallback? onRetry,
    VoidCallback? onPreviousMonth,
    VoidCallback? onNextMonth,
    ValueChanged<DateTime>? onDateSelected,
    ValueChanged<BookingTimeSlot>? onTimeSelected,
  }) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          home: Scaffold(
            body: SelectTimeSchedule(
              state: state,
              doctor: doctor,
              onRetry: onRetry ?? () {},
              onPreviousMonth: onPreviousMonth ?? () {},
              onNextMonth: onNextMonth ?? () {},
              onDateSelected: onDateSelected ?? (_) {},
              onTimeSelected: onTimeSelected ?? (_) {},
            ),
          ),
        ),
      ),
    );
  }

  group('SelectTimeSchedule', () {
    testWidgets('displays the doctor information', (tester) async {
      await pumpSchedule(
        tester,
        state: createState(),
      );

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
      expect(find.byType(SelectTimeSchedule), findsOneWidget);
    });

    testWidgets('displays a loading indicator when loading', (
      tester,
    ) async {
      await pumpSchedule(
        tester,
        state: createState(isLoading: true),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays the error and retry button', (tester) async {
      const errorMessage = 'Unable to load available times';
      var retryCalled = false;

      await pumpSchedule(
        tester,
        state: createState(errorMessage: errorMessage),
        onRetry: () {
          retryCalled = true;
        },
      );

      final context = tester.element(find.byType(SelectTimeSchedule));
      final retryLabel = Translations.of(context).retry;

      expect(find.text(errorMessage), findsOneWidget);
      expect(find.text(retryLabel), findsOneWidget);

      await tester.tap(find.text(retryLabel));
      await tester.pump();

      expect(retryCalled, isTrue);
    });

    testWidgets('displays the empty-date message when no dates are available', (
      tester,
    ) async {
      await pumpSchedule(
        tester,
        state: createState(),
      );

      final context = tester.element(find.byType(SelectTimeSchedule));
      final message = Translations.of(context).noAvailableDatesThisMonth;

      expect(find.text(message), findsOneWidget);
      expect(find.byType(CalendarDatePicker), findsNothing);
    });

    testWidgets('displays the calendar when a future date is available', (
      tester,
    ) async {
      final availableDate = DateTime(
        today.year,
        today.month,
        today.day + 1,
      );

      await pumpSchedule(
        tester,
        state: createState(
          slotsByDate: {
            availableDate: [firstSlot],
          },
        ),
      );

      expect(find.byType(CalendarDatePicker), findsOneWidget);
    });

    testWidgets('calls onDateSelected when an available date is selected', (
      tester,
    ) async {
      final availableDate = DateTime(
        today.year,
        today.month,
        today.day + 1,
      );

      DateTime? selectedDate;

      await pumpSchedule(
        tester,
        state: createState(
          slotsByDate: {
            availableDate: [firstSlot],
          },
        ),
        onDateSelected: (date) {
          selectedDate = date;
        },
      );

      await tester.tap(find.text('${availableDate.day}'));
      await tester.pump();

      expect(selectedDate, isNotNull);
      expect(selectedDate!.day, availableDate.day);
      expect(selectedDate!.month, availableDate.month);
      expect(selectedDate!.year, availableDate.year);
    });

    testWidgets('displays the prompt when no date is selected', (
      tester,
    ) async {
      await pumpSchedule(
        tester,
        state: createState(),
      );

      final context = tester.element(find.byType(SelectTimeSchedule));
      final message = Translations.of(context).selectHighlightedDateForTimes;

      expect(find.text(message), findsOneWidget);
    });

    testWidgets('displays the empty-time message when selected date has no slots', (
      tester,
    ) async {
      await pumpSchedule(
        tester,
        state: createState(
          selectedDate: today,
        ),
      );

      final context = tester.element(find.byType(SelectTimeSchedule));
      final message = Translations.of(context).noAvailableTimesForDate;

      expect(find.text(message), findsOneWidget);
    });

    
testWidgets(
  'displays available slots for the selected date',
  (tester) async {
    final testDate = DateTime(
      currentMonth.year,
      currentMonth.month,
      15,
    );

    final testState = createState(
      selectedDate: testDate,
      selectedSlot: firstSlot,
      slotsByDate: {
        testDate: [firstSlot, secondSlot],
      },
    );

    // Verify the state data before rendering the widget.
    expect(testState.selectedDateSlots, [firstSlot, secondSlot]);

    await pumpSchedule(
      tester,
      state: testState,
    );

    expect(find.byType(AvailableTimeSlots), findsOneWidget);
    expect(find.text('09:00 AM'), findsOneWidget);
    expect(find.text('10:00 AM'), findsOneWidget);
  },
);


  
testWidgets(
  'calls onTimeSelected when a time slot is tapped',
  (tester) async {
    final testDate = DateTime(
      currentMonth.year,
      currentMonth.month,
      15,
    );

    BookingTimeSlot? selectedSlot;

    await pumpSchedule(
      tester,
      state: createState(
        selectedDate: testDate,
        slotsByDate: {
          testDate: [firstSlot, secondSlot],
        },
      ),
      onTimeSelected: (slot) {
        selectedSlot = slot;
      },
    );

    final timeFinder = find.text('10:00 AM');

    expect(timeFinder, findsOneWidget);

    await tester.tap(timeFinder);
    await tester.pump();

    expect(selectedSlot, secondSlot);
  },
);

  
testWidgets('calls the month navigation callbacks', (tester) async {
  var previousCalled = false;
  var nextCalled = false;

  final nextMonth = DateTime(
    currentMonth.year,
    currentMonth.month + 1,
  );

  await pumpSchedule(
    tester,
    state: createState(
      displayedMonth: nextMonth,
    ),
    onPreviousMonth: () {
      previousCalled = true;
    },
    onNextMonth: () {
      nextCalled = true;
    },
  );

  final previousButton = find.byIcon(Icons.chevron_left);
  final nextButton = find.byIcon(Icons.chevron_right);

  await tester.ensureVisible(previousButton);
  await tester.tap(previousButton);
  await tester.pump();

  await tester.ensureVisible(nextButton);
  await tester.tap(nextButton);
  await tester.pump();

  expect(previousCalled, isTrue);
  expect(nextCalled, isTrue);
});

testWidgets('does not throw when rendered', (tester) async {
  await pumpSchedule(
    tester,
    state: createState(),
  );

  expect(tester.takeException(), isNull);
});


    testWidgets('does not throw when rendered', (tester) async {
      await pumpSchedule(
        tester,
        state: createState(),
      );

      expect(tester.takeException(), isNull);
    });
  });
}