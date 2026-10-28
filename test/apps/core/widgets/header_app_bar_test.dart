
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/header_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestWidget({
    String title = 'Test Title',
    VoidCallback? onBackPressed,
    VoidCallback? onActionPressed,
    IconData? actionIcon,
    IconData? icon2,
    bool showAction = true,
    bool showBackButton = true,
    String? text = '',
    TextStyle? titleStyle,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: HeaderAppBar(
          title: title,
          onBackPressed: onBackPressed,
          onActionPressed: onActionPressed,
          actionIcon: actionIcon,
          icon2: icon2,
          showAction: showAction,
          showBackButton: showBackButton,
          text: text,
          titleStyle: titleStyle,
        ),
      ),
    );
  }

  group('HeaderAppBar', () {
    testWidgets('renders the title', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('shows the back button by default', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
    });

    testWidgets('hides the back button when showBackButton is false',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(showBackButton: false),
      );

      expect(find.byIcon(Icons.arrow_back_ios_new), findsNothing);
    });

    testWidgets('calls onBackPressed when the back button is tapped',
        (tester) async {
      var backPressed = false;

      await tester.pumpWidget(
        buildTestWidget(
          onBackPressed: () => backPressed = true,
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
      await tester.pump();

      expect(backPressed, isTrue);
    });

    testWidgets('uses Navigator.pop when no custom back callback is provided',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const Scaffold(
                            body: HeaderAppBar(
                              title: 'Details',
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text('Open details'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open details'));
      await tester.pumpAndSettle();

      expect(find.text('Details'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
      await tester.pumpAndSettle();

      expect(find.text('Open details'), findsOneWidget);
      expect(find.text('Details'), findsNothing);
    });

    testWidgets('shows the action icon when showAction is true',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          actionIcon: Icons.search,
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('hides the action icon when showAction is false',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          showAction: false,
          actionIcon: Icons.search,
        ),
      );

      expect(find.byIcon(Icons.search), findsNothing);
    });

    testWidgets('calls onActionPressed when the action button is tapped',
        (tester) async {
      var actionPressed = false;

      await tester.pumpWidget(
        buildTestWidget(
          actionIcon: Icons.search,
          onActionPressed: () => actionPressed = true,
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      expect(actionPressed, isTrue);
    });

    testWidgets('shows the second icon when text is not empty',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          text: 'Add',
          icon2: Icons.add,
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('hides the second icon when text is empty',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          text: '',
          icon2: Icons.add,
        ),
      );

      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('hides the second icon when text is null',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          text: null,
          icon2: Icons.add,
        ),
      );

      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('uses the provided titleStyle', (tester) async {
      const customStyle = TextStyle(
        fontSize: 24,
        color: Colors.red,
      );

      await tester.pumpWidget(
        buildTestWidget(titleStyle: customStyle),
      );

      final titleFinder = find.text('Test Title');
      final titleWidget = tester.widget<Text>(titleFinder);

      expect(titleWidget.style, customStyle);
    });

    testWidgets('uses the default title style when titleStyle is null',
        (tester) async {
      await tester.pumpWidget(buildTestWidget());

      final titleWidget = tester.widget<Text>(
        find.text('Test Title'),
      );

      expect(titleWidget.style, isNotNull);
    });

    testWidgets('limits the title to one line with ellipsis',
        (tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(320, 800)),
          child: buildTestWidget(
            title:
                'This is a very long title that should not overflow the app bar',
            showAction: false,
            showBackButton: false,
          ),
        ),
      );

      final titleWidget = tester.widget<Text>(
        find.text(
          'This is a very long title that should not overflow the app bar',
        ),
      );

      expect(titleWidget.maxLines, 1);
      expect(titleWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('renders the expected container colors', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          text: 'Add',
          icon2: Icons.add,
        ),
      );

      final backButtonContainer = tester.widget<Container>(
        find.ancestor(
          of: find.byIcon(Icons.arrow_back_ios_new),
          matching: find.byType(Container),
        ).first,
      );

      final backDecoration =
          backButtonContainer.decoration! as BoxDecoration;

      expect(backDecoration.color, AppColors.white);

      final secondIconContainer = tester.widget<Container>(
        find.ancestor(
          of: find.byIcon(Icons.add),
          matching: find.byType(Container),
        ).first,
      );

      final secondIconDecoration =
          secondIconContainer.decoration! as BoxDecoration;

      expect(secondIconDecoration.color, AppColors.primary);
    });
  });
}
