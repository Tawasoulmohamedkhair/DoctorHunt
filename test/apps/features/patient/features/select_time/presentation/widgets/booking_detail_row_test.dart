
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/booking_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpRow(
    WidgetTester tester, {
    required String label,
    required String value,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BookingDetailRow(
            label: label,
            value: value,
          ),
        ),
      ),
    );
  }

  group('BookingDetailRow', () {
    testWidgets('displays the label and value', (tester) async {
      await pumpRow(
        tester,
        label: 'Date',
        value: '15/11/2026',
      );

      expect(find.text('Date'), findsOneWidget);
      expect(find.text('15/11/2026'), findsOneWidget);
    });

    testWidgets('uses a Row layout', (tester) async {
      await pumpRow(
        tester,
        label: 'Time',
        value: '09:00 AM',
      );

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
      expect(find.byType(Flexible), findsOneWidget);
    });

    testWidgets('aligns the value text to the end', (tester) async {
      await pumpRow(
        tester,
        label: 'Fee',
        value: '15.0 OMR',
      );

      final valueText = tester.widget<Text>(
        find.text('15.0 OMR'),
      );

      expect(valueText.textAlign, TextAlign.end);
    });

    testWidgets('uses the expected label text style', (tester) async {
      await pumpRow(
        tester,
        label: 'Date',
        value: '15/11/2026',
      );

      final labelText = tester.widget<Text>(
        find.text('Date'),
      );

      expect(labelText.style?.color, Colors.grey.shade600);
    });

    testWidgets('renders long label and value without throwing', (
      tester,
    ) async {
      await pumpRow(
        tester,
        label: 'Appointment date and time',
        value: '15/11/2026 at 09:00 AM',
      );

      expect(find.text('Appointment date and time'), findsOneWidget);
      expect(find.text('15/11/2026 at 09:00 AM'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders empty label and value', (tester) async {
      await pumpRow(
        tester,
        label: '',
        value: '',
      );

      expect(find.byType(BookingDetailRow), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
