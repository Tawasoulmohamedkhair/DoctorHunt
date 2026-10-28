
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomElevatedButton', () {
    Future<void> pumpButton(
      WidgetTester tester, {
      required Widget button,
      Size screenSize = const Size(375, 812),
    }) async {
      tester.view.physicalSize = screenSize;
      tester.view.devicePixelRatio = 1;

      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(child: button),
          ),
        ),
      );
    }

    Widget createButton({
      VoidCallback? onPressed = _onPressed,
      Widget label = const Text('Continue'),
      Widget? icon,
      double? height,
      double? width,
      Color backgroundcolor = AppColors.primary,
      Color? disabledBackgroundColor,
      bool expand = false,
    }) {
      return CustomElevatedButton(
        onPressed: onPressed,
        label: label,
        icon: icon,
        height: height,
        width: width,
        backgroundcolor: backgroundcolor,
        disabledBackgroundColor: disabledBackgroundColor,
        expand: expand,
      );
    }

    testWidgets('renders the label', (tester) async {
      await pumpButton(
        tester,
        button: createButton(),
      );

      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('uses the default height and width', (tester) async {
      await pumpButton(
        tester,
        button: createButton(),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
      );

      expect(sizedBox.height, closeTo(54, 0.001));
      expect(sizedBox.width, closeTo(295, 0.001));
    });

    testWidgets('uses custom height and width', (tester) async {
      await pumpButton(
        tester,
        button: createButton(
          height: 60,
          width: 200,
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
      );

      expect(sizedBox.height, closeTo(60, 0.001));
      expect(sizedBox.width, closeTo(200, 0.001));
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var wasPressed = false;

      await pumpButton(
        tester,
        button: createButton(
          onPressed: () => wasPressed = true,
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var wasPressed = false;

      await pumpButton(
        tester,
        button: createButton(
          onPressed: null,
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(wasPressed, isFalse);
    });

    testWidgets('renders an icon when provided', (tester) async {
      await pumpButton(
        tester,
        button: createButton(
          icon: const Icon(Icons.add),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(ElevatedButton).evaluate().length, 1);
    });

    testWidgets('uses the custom background color', (tester) async {
      await pumpButton(
        tester,
        button: createButton(
          backgroundcolor: Colors.blue,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );

      expect(
        button.style?.backgroundColor?.resolve({}),
        Colors.blue,
      );
    });

    testWidgets('uses the configured disabled background color', (
      tester,
    ) async {
      await pumpButton(
        tester,
        button: createButton(
          onPressed: null,
          disabledBackgroundColor: Colors.grey,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );

      expect(
        button.style?.backgroundColor?.resolve({WidgetState.disabled}),
        Colors.grey,
      );
    });

    testWidgets('expands to the available safe width when expand is true', (
      tester,
    ) async {
      await pumpButton(
        tester,
        button: createButton(expand: true),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
      );

      expect(sizedBox.width, closeTo(375, 0.001));
    });

    testWidgets('limits width to the screen width', (tester) async {
      await pumpButton(
        tester,
        button: createButton(width: 500),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
      );

      expect(sizedBox.width, closeTo(375, 0.001));
    });
  });
}

void _onPressed() {}
