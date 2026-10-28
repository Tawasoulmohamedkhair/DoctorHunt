
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/logout_confirmation_dialog.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LogoutConfirmationDialog', () {
    Future<void> pumpDialog(
      WidgetTester tester, {
      required ValueChanged<bool?> onResult,
    }) async {
      await tester.pumpWidget(
        TranslationProvider(
          child: MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => TextButton(
                  onPressed: () async {
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (_) =>
                          const LogoutConfirmationDialog(),
                    );

                    onResult(result);
                  },
                  child: const Text('Open dialog'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open dialog'));
      await tester.pumpAndSettle();
    }

    testWidgets('renders an AlertDialog', (tester) async {
      bool? result;

      await pumpDialog(
        tester,
        onResult: (value) => result = value,
      );

      expect(find.byType(LogoutConfirmationDialog), findsOneWidget);
      expect(find.byType(AlertDialog), findsOneWidget);

      // The dialog is still open.
      expect(result, isNull);
    });

    testWidgets('displays the translated title and message',
        (tester) async {
      await pumpDialog(
        tester,
        onResult: (_) {},
      );

      final dialogContext =
          tester.element(find.byType(LogoutConfirmationDialog));
      final t = Translations.of(dialogContext);

      expect(find.text(t.logout), findsOneWidget);
      expect(find.text(t.confirmLogout), findsOneWidget);
    });

    testWidgets('displays the translated Cancel and OK buttons',
        (tester) async {
      await pumpDialog(
        tester,
        onResult: (_) {},
      );

      final dialogContext =
          tester.element(find.byType(LogoutConfirmationDialog));
      final t = Translations.of(dialogContext);

      expect(find.text(t.cancel), findsOneWidget);
      expect(find.text(t.ok), findsOneWidget);
    });

    testWidgets('uses the expected dialog background color',
        (tester) async {
      await pumpDialog(
        tester,
        onResult: (_) {},
      );

      final dialog = tester.widget<AlertDialog>(
        find.byType(AlertDialog),
      );

      expect(dialog.backgroundColor, AppColors.white);
    });

    testWidgets('returns false when Cancel is tapped',
        (tester) async {
      bool? result;

      await pumpDialog(
        tester,
        onResult: (value) => result = value,
      );

      final dialogContext =
          tester.element(find.byType(LogoutConfirmationDialog));
      final cancelLabel = Translations.of(dialogContext).cancel;

      await tester.tap(find.text(cancelLabel));
      await tester.pumpAndSettle();

      expect(result, isFalse);
      expect(find.byType(LogoutConfirmationDialog), findsNothing);
    });

    testWidgets('returns true when OK is tapped', (tester) async {
      bool? result;

      await pumpDialog(
        tester,
        onResult: (value) => result = value,
      );

      final dialogContext =
          tester.element(find.byType(LogoutConfirmationDialog));
      final okLabel = Translations.of(dialogContext).ok;

      await tester.tap(find.text(okLabel));
      await tester.pumpAndSettle();

      expect(result, isTrue);
      expect(find.byType(LogoutConfirmationDialog), findsNothing);
    });

    testWidgets('does not close before a button is tapped',
        (tester) async {
      await pumpDialog(
        tester,
        onResult: (_) {},
      );

      expect(find.byType(LogoutConfirmationDialog), findsOneWidget);
      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
