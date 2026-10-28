import 'package:doctor_hunt/apps/core/widgets/custom_app_text_field.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/search_bar.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidget({VoidCallback? onTap}) {
    return TranslationProvider(
      child: MaterialApp(
        home: Scaffold(body: CustomSearchBar(onTap: onTap)),
      ),
    );
  }

  group('CustomSearchBar', () {
    testWidgets('displays the localized search hint', (tester) async {
      await tester.pumpWidget(createWidget());

      final t = Translations.of(tester.element(find.byType(CustomSearchBar)));

      expect(find.text(t.search_hint), findsOneWidget);
    });

    testWidgets('displays the search icon', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('contains a CustomAppTextField', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(CustomAppTextField), findsOneWidget);
    });

    testWidgets('calls onTap when the search bar is tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(createWidget(onTap: () => tapped = true));

      await tester.tap(find.byType(CustomSearchBar));

      expect(tapped, isTrue);
    });

    testWidgets('does not throw when onTap is null', (tester) async {
      await tester.pumpWidget(createWidget());

      await tester.tap(find.byType(CustomSearchBar));

      expect(tester.takeException(), isNull);
    });

    testWidgets('absorbs pointer events to prevent text-field interaction', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget());

      final absorbPointerFinder = find.descendant(
        of: find.byType(CustomSearchBar),
        matching: find.byType(AbsorbPointer),
      );

      expect(absorbPointerFinder, findsOneWidget);

      final absorbPointer = tester.widget<AbsorbPointer>(absorbPointerFinder);

      expect(absorbPointer.absorbing, isTrue);
    });
  });
}
