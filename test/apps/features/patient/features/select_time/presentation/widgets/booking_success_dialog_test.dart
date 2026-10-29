
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/booking_success_dialog.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

  final bookingDate = DateTime(2026, 11, 15);

  Future<void> pumpDialog(
    WidgetTester tester, {
    VoidCallback? onDone,
    DoctorModel? doctorOverride,
    DateTime? date,
    String time = '09:00 AM',
    Object fee = 15.0,
  }) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          home: Scaffold(
            body: BookingSuccessDialog(
              doctor: doctorOverride ?? doctor,
              date: date ?? bookingDate,
              time: time,
              fee: fee,
              onDone: onDone ?? () {},
            ),
          ),
        ),
      ),
    );
  }

  group('BookingSuccessDialog', () {
    testWidgets('displays the success icon', (tester) async {
      await pumpDialog(tester);

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('displays the doctor name', (tester) async {
      await pumpDialog(tester);

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
    });

    testWidgets('displays the booking date', (tester) async {
      await pumpDialog(tester);

      expect(find.text('15/11/2026'), findsOneWidget);
    });

    testWidgets('displays the booking time', (tester) async {
      await pumpDialog(tester, time: '10:00 AM');

      expect(find.text('10:00 AM'), findsOneWidget);
    });

    testWidgets('displays the booking fee', (tester) async {
      await pumpDialog(tester, fee: 25.0);

      expect(find.text('25.0'), findsOneWidget);
    });

    testWidgets('displays localized detail labels and Done button', (
      tester,
    ) async {
      await pumpDialog(tester);

      final context = tester.element(
        find.byType(BookingSuccessDialog),
      );
      final translations = Translations.of(context);

      expect(find.text(translations.date), findsOneWidget);
      expect(find.text(translations.time), findsOneWidget);
      expect(find.text(translations.fee), findsOneWidget);
      expect(find.text(translations.done), findsOneWidget);
    });

    testWidgets('uses the primary color for the success icon', (
      tester,
    ) async {
      await pumpDialog(tester);

      final icon = tester.widget<Icon>(
        find.byIcon(Icons.check_circle),
      );

      expect(icon.color, AppColors.primary);
    });

    testWidgets('calls onDone when Done is tapped', (tester) async {
      var doneCalled = false;

      await pumpDialog(
        tester,
        onDone: () {
          doneCalled = true;
        },
      );

      final context = tester.element(
        find.byType(BookingSuccessDialog),
      );
      final doneLabel = Translations.of(context).done;

      await tester.tap(find.text(doneLabel));
      await tester.pump();

      expect(doneCalled, isTrue);
    });

    testWidgets('renders without throwing', (tester) async {
      await pumpDialog(tester);

      expect(tester.takeException(), isNull);
    });
  });
}
