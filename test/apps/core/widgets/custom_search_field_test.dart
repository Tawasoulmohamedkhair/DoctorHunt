import 'package:doctor_hunt/apps/core/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomSearchField', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    tearDown(() {
      controller.dispose();
    });

    Future<void> pumpSearchField(
      WidgetTester tester, {
      String hintText = 'Search doctors',
      ValueChanged<String>? onChanged,
      ValueChanged<String>? onSubmitted,
      VoidCallback? onClear,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchField(
              controller: controller,
              hintText: hintText,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              onClear: onClear,
            ),
          ),
        ),
      );
    }

    testWidgets('renders the search field and hint text', (tester) async {
      await pumpSearchField(tester);

      expect(find.byType(CustomSearchField), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search doctors'), findsOneWidget);
    });

    testWidgets('displays the search and clear icons', (tester) async {
      await pumpSearchField(tester);

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('uses the provided controller', (tester) async {
      controller.text = 'Cardiology';

      await pumpSearchField(tester);

      expect(find.text('Cardiology'), findsOneWidget);
      expect(controller.text, 'Cardiology');
    });

    testWidgets('calls onChanged when the user types', (tester) async {
      String? changedValue;

      await pumpSearchField(tester, onChanged: (value) => changedValue = value);

      await tester.enterText(find.byType(TextField), 'Cardiology');

      expect(changedValue, 'Cardiology');
    });

    testWidgets('calls onSubmitted when the user submits', (tester) async {
      String? submittedValue;

      await pumpSearchField(
        tester,
        onSubmitted: (value) => submittedValue = value,
      );

      await tester.enterText(find.byType(TextField), 'Cardiology');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(submittedValue, 'Cardiology');
    });

    testWidgets('clears the controller when the close icon is tapped', (
      tester,
    ) async {
      controller.text = 'Cardiology';

      await pumpSearchField(tester);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(controller.text, isEmpty);
      expect(find.text('Cardiology'), findsNothing);
    });

    testWidgets('calls onClear when the close icon is tapped', (tester) async {
      var clearCalled = false;

      await pumpSearchField(tester, onClear: () => clearCalled = true);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(clearCalled, isTrue);
    });

    testWidgets('clears the controller before calling onClear', (tester) async {
      controller.text = 'Cardiology';

      String? valueWhenCleared;

      await pumpSearchField(
        tester,
        onClear: () => valueWhenCleared = controller.text,
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(valueWhenCleared, isEmpty);
    });

    testWidgets('works when optional callbacks are null', (tester) async {
      controller.text = 'Cardiology';

      await pumpSearchField(tester);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(controller.text, isEmpty);
      expect(tester.takeException(), isNull);
    });
  });
}
