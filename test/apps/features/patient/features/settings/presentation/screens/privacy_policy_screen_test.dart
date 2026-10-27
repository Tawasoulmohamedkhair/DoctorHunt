import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestApp({
    required Widget child,
    AppLocale locale = AppLocale.en,
    bool showPreviousScreen = false,
  }) {
    return TranslationProvider(
      child: MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('en'), Locale('ar')],
        locale: Locale(locale.languageCode),
        home: showPreviousScreen
            ? Builder(
                builder: (context) => Scaffold(
                  body: Column(
                    children: [
                      const Text('Previous Screen'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(builder: (_) => child),
                          );
                        },
                        child: const Text('Open Privacy Policy'),
                      ),
                    ],
                  ),
                ),
              )
            : child,
      ),
    );
  }

  group('PrivacyPolicyScreen Widget Tests', () {
    testWidgets('displays the privacy policy title and all section titles', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp(child: const PrivacyPolicyScreen()));
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(PrivacyPolicyScreen));
      final t = Translations.of(context);

      expect(find.text(t.privacyPolicyTitle), findsOneWidget);
      expect(find.text(t.privacyPolicyLastUpdated), findsOneWidget);

      expect(find.text(t.privacyPolicyIntroductionTitle), findsOneWidget);
      expect(find.text(t.privacyPolicyInformationTitle), findsOneWidget);
      expect(find.text(t.privacyPolicyUsageTitle), findsOneWidget);
      expect(find.text(t.privacyPolicySecurityTitle), findsOneWidget);
      expect(find.text(t.privacyPolicySharingTitle), findsOneWidget);
      expect(find.text(t.privacyPolicyRightsTitle), findsOneWidget);
      expect(find.text(t.privacyPolicyChildrenTitle), findsOneWidget);
      expect(find.text(t.privacyPolicyChangesTitle), findsOneWidget);
      expect(find.text(t.privacyPolicyContactTitle), findsOneWidget);
    });

    testWidgets('uses LTR direction for English', (tester) async {
      await tester.pumpWidget(
        buildTestApp(child: const PrivacyPolicyScreen(), locale: AppLocale.en),
      );
      await tester.pumpAndSettle();

      final directionalityFinder = find.ancestor(
        of: find.byType(SingleChildScrollView),
        matching: find.byType(Directionality),
      );

      expect(directionalityFinder, findsWidgets);

      final directionality = tester.widget<Directionality>(
        directionalityFinder.first,
      );

      expect(directionality.textDirection, TextDirection.ltr);
    });

    testWidgets('Flutter supports Arabic locale in the test', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          locale: Locale('ar'),
          supportedLocales: [Locale('ar'), Locale('en')],
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Text('اختبار الاتجاه'),
            ),
          ),
        ),
      );

      expect(find.text('اختبار الاتجاه'), findsOneWidget);

      final directionality = tester.widget<Directionality>(
        find
            .ancestor(
              of: find.text('اختبار الاتجاه'),
              matching: find.byType(Directionality),
            )
            .first,
      );

      expect(directionality.textDirection, TextDirection.rtl);
    });

    testWidgets('allows scrolling to the last section', (tester) async {
      // Set the test screen dimensions.
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1;

      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(buildTestApp(child: const PrivacyPolicyScreen()));
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);

      expect(scrollView, findsOneWidget);

      await tester.drag(scrollView, const Offset(0, -2500));
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(PrivacyPolicyScreen));
      final t = Translations.of(context);

      expect(find.text(t.privacyPolicyContactTitle), findsOneWidget);
    });

    testWidgets('returns to the previous screen when back is pressed', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const PrivacyPolicyScreen(),
          showPreviousScreen: true,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Open Privacy Policy'));
      await tester.pumpAndSettle();

      expect(find.byType(PrivacyPolicyScreen), findsOneWidget);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(find.text('Previous Screen'), findsOneWidget);

      expect(find.byType(PrivacyPolicyScreen), findsNothing);
    });
  });
}
