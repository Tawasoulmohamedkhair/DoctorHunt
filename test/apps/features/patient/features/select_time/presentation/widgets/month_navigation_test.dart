
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/month_navigation.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpMonthNavigation(
    WidgetTester tester, {
    required DateTime month,
    required VoidCallback onPrevious,
    required VoidCallback onNext,
    required bool canGoPrevious,
    required bool canGoNext,
  }) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          home: Scaffold(
            body: MonthNavigation(
              month: month,
              onPrevious: onPrevious,
              onNext: onNext,
              canGoPrevious: canGoPrevious,
              canGoNext: canGoNext,
            ),
          ),
        ),
      ),
    );
  }

  group('MonthNavigation', () {
    testWidgets('displays the selected month and year', (tester) async {
      await pumpMonthNavigation(
        tester,
        month: DateTime(2026, 3),
        onPrevious: () {},
        onNext: () {},
        canGoPrevious: true,
        canGoNext: true,
      );

      final context = tester.element(find.byType(MonthNavigation));
      final translations = Translations.of(context);

      expect(
        find.text('${translations.march} 2026'),
        findsOneWidget,
      );
    });

    testWidgets('calls onPrevious when the previous button is tapped', (
      tester,
    ) async {
      var wasPreviousPressed = false;

      await pumpMonthNavigation(
        tester,
        month: DateTime(2026, 3),
        onPrevious: () {
          wasPreviousPressed = true;
        },
        onNext: () {},
        canGoPrevious: true,
        canGoNext: true,
      );

      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pump();

      expect(wasPreviousPressed, isTrue);
    });

    testWidgets('calls onNext when the next button is tapped', (
      tester,
    ) async {
      var wasNextPressed = false;

      await pumpMonthNavigation(
        tester,
        month: DateTime(2026, 3),
        onPrevious: () {},
        onNext: () {
          wasNextPressed = true;
        },
        canGoPrevious: true,
        canGoNext: true,
      );

      await tester.tap(find.byIcon(Icons.chevron_right));
      await tester.pump();

      expect(wasNextPressed, isTrue);
    });

    testWidgets('disables the previous button when canGoPrevious is false', (
      tester,
    ) async {
      await pumpMonthNavigation(
        tester,
        month: DateTime(2026, 3),
        onPrevious: () {},
        onNext: () {},
        canGoPrevious: false,
        canGoNext: true,
      );

      final previousButton = tester.widget<IconButton>(
        find.ancestor(
          of: find.byIcon(Icons.chevron_left),
          matching: find.byType(IconButton),
        ),
      );

      expect(previousButton.onPressed, isNull);
    });

    testWidgets('disables the next button when canGoNext is false', (
      tester,
    ) async {
      await pumpMonthNavigation(
        tester,
        month: DateTime(2026, 3),
        onPrevious: () {},
        onNext: () {},
        canGoPrevious: true,
        canGoNext: false,
      );

      final nextButton = tester.widget<IconButton>(
        find.ancestor(
          of: find.byIcon(Icons.chevron_right),
          matching: find.byType(IconButton),
        ),
      );

      expect(nextButton.onPressed, isNull);
    });

    testWidgets('renders without throwing an exception', (tester) async {
      await pumpMonthNavigation(
        tester,
        month: DateTime(2026, 3),
        onPrevious: () {},
        onNext: () {},
        canGoPrevious: true,
        canGoNext: true,
      );

      expect(tester.takeException(), isNull);
    });
  });
}
