
import 'package:doctor_hunt/apps/core/widgets/custom_outlined_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomOutlinedActionButton', () {
    Widget createButton({
      String text = 'Delete',
      VoidCallback? onPressed = _onPressed,
      double height = 50,
      double fontSize = 14,
      double borderRadius = 8,
      FontWeight fontWeight = FontWeight.w600,
      Color backgroundColor = const Color(0xFFFFF0F0),
      Color foregroundColor = const Color(0xFFF15B5D),
      Color borderColor = const Color(0xFFF15B5D),
      EdgeInsetsGeometry padding = EdgeInsets.zero,
      Widget? icon,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CustomOutlinedActionButton(
              text: text,
              onPressed: onPressed,
              height: height,
              fontSize: fontSize,
              borderRadius: borderRadius,
              fontWeight: fontWeight,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              borderColor: borderColor,
              padding: padding,
              icon: icon,
            ),
          ),
        ),
      );
    }

    Finder getButton() => find.byType(OutlinedButton);

    testWidgets('renders the button text', (tester) async {
      await tester.pumpWidget(createButton());

      expect(find.text('Delete'), findsOneWidget);
      expect(getButton(), findsOneWidget);
    });

    testWidgets('uses the default height', (tester) async {
      await tester.pumpWidget(createButton());

      final size = tester.getSize(find.byType(SizedBox).first);

      expect(size.height, 50);
    });

    testWidgets('uses a custom height', (tester) async {
      await tester.pumpWidget(
        createButton(height: 60),
      );

      final size = tester.getSize(find.byType(SizedBox).first);

      expect(size.height, 60);
    });

    testWidgets('uses the default background color', (tester) async {
      await tester.pumpWidget(createButton());

      final button = tester.widget<OutlinedButton>(getButton());
      final background = button.style?.backgroundColor?.resolve({});

      expect(background, const Color(0xFFFFF0F0));
    });

    testWidgets('uses a custom background color', (tester) async {
      await tester.pumpWidget(
        createButton(backgroundColor: Colors.blue),
      );

      final button = tester.widget<OutlinedButton>(getButton());

      expect(
        button.style?.backgroundColor?.resolve({}),
        Colors.blue,
      );
    });

    testWidgets('uses the configured foreground color', (tester) async {
      await tester.pumpWidget(
        createButton(foregroundColor: Colors.black),
      );

      final button = tester.widget<OutlinedButton>(getButton());

      expect(
        button.style?.foregroundColor?.resolve({}),
        Colors.black,
      );
    });

    testWidgets('uses the configured border color', (tester) async {
      await tester.pumpWidget(
        createButton(borderColor: Colors.green),
      );

      final button = tester.widget<OutlinedButton>(getButton());
      final side = button.style?.side?.resolve({});

      expect(side?.color, Colors.green);
      expect(side?.width, 1);
    });

    testWidgets('uses the configured border radius', (tester) async {
      await tester.pumpWidget(
        createButton(borderRadius: 12),
      );

      final button = tester.widget<OutlinedButton>(getButton());
      final shape = button.style?.shape?.resolve({});

      expect(shape, isA<RoundedRectangleBorder>());

      final roundedShape = shape! as RoundedRectangleBorder;

      expect(
        roundedShape.borderRadius,
        BorderRadius.circular(12),
      );
    });

    testWidgets('renders the icon when provided', (tester) async {
      await tester.pumpWidget(
        createButton(
          icon: const Icon(Icons.delete),
        ),
      );

      expect(find.byIcon(Icons.delete), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('does not render an icon when none is provided', (
      tester,
    ) async {
      await tester.pumpWidget(createButton());

      expect(find.byType(Icon), findsNothing);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        createButton(
          onPressed: () => pressed = true,
        ),
      );

      await tester.tap(getButton());
      await tester.pump();

      expect(pressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        createButton(onPressed: null),
      );

      await tester.tap(getButton());
      await tester.pump();

      expect(pressed, isFalse);
    });

    testWidgets('supports custom font size and weight', (tester) async {
      await tester.pumpWidget(
        createButton(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );

      final button = tester.widget<OutlinedButton>(getButton());
      final textStyle = button.style?.textStyle?.resolve({});

      expect(textStyle?.fontSize, 18);
      expect(textStyle?.fontWeight, FontWeight.bold);
      expect(textStyle?.fontFamily, 'Rubik');
    });

    testWidgets('uses the supplied padding', (tester) async {
      const padding = EdgeInsets.all(12);

      await tester.pumpWidget(
        createButton(padding: padding),
      );

      final button = tester.widget<OutlinedButton>(getButton());

      expect(
        button.style?.padding?.resolve({}),
        padding,
      );
    });

    testWidgets('button takes the available width', (tester) async {
      await tester.pumpWidget(createButton());

      final buttonSize = tester.getSize(getButton());
      final scaffoldSize = tester.getSize(find.byType(Scaffold));

      expect(buttonSize.width, scaffoldSize.width);
    });
  });
}

void _onPressed() {}