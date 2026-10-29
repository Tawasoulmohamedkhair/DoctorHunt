
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/select_time_header.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SelectTimeHeader', () {
    testWidgets('renders the title and back button', (tester) async {
      await tester.pumpWidget(
        TranslationProvider(
          child: MaterialApp(
            home: Scaffold(
              body: SelectTimeHeader(
                onBack: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SelectTimeHeader), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
      expect(find.text(TranslationProvider.of(tester.element(
        find.byType(SelectTimeHeader),
      )).translations.selecttime), findsOneWidget);
    });

    testWidgets('calls onBack when the back button is tapped', (
      tester,
    ) async {
      var wasBackPressed = false;

      await tester.pumpWidget(
        TranslationProvider(
          child: MaterialApp(
            home: Scaffold(
              body: SelectTimeHeader(
                onBack: () {
                  wasBackPressed = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
      await tester.pump();

      expect(wasBackPressed, isTrue);
    });
  });
}
