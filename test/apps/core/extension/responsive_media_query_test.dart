
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive extension', () {
    Future<BuildContext> pumpResponsiveContext(
      WidgetTester tester, {
      Size size = const Size(375, 812),
      EdgeInsets padding = EdgeInsets.zero,
      TextScaler textScaler = TextScaler.noScaling,
    }) async {
      late BuildContext context;

      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(
              size: size,
              padding: padding,
              textScaler: textScaler,
            ),
            child: Builder(
              builder: (builderContext) {
                context = builderContext;
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      return context;
    }

    group('width and height', () {
      testWidgets('returns the full screen dimensions', (tester) async {
        final context = await pumpResponsiveContext(tester);

        expect(context.width, 375);
        expect(context.height, 812);
      });
    });

    group('safeWidth and safeHeight', () {
      testWidgets('returns full dimensions when there is no padding', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(tester);

        expect(context.safeWidth, 375);
        expect(context.safeHeight, 812);
      });

      testWidgets('subtracts horizontal and vertical padding', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(400, 800),
          padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
        );

        expect(context.safeWidth, 360);
        expect(context.safeHeight, 740);
      });

      testWidgets('does not return negative safe dimensions', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(100, 100),
          padding: const EdgeInsets.fromLTRB(60, 70, 60, 70),
        );

        expect(context.safeWidth, 0);
        expect(context.safeHeight, 0);
      });
    });

    group('w, h and r', () {
      testWidgets('scales values using the reference screen dimensions', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(tester);

        expect(context.w(100), 100);
        expect(context.h(100), closeTo(100, 0.001));
        expect(context.r(20), 20);
      });

      testWidgets('scales values according to safe dimensions', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(750, 1624),
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        );

        expect(context.safeWidth, 720);
        expect(context.safeHeight, 1584);
        expect(context.w(100), closeTo(192, 0.001));
        expect(context.h(100), closeTo(195.0739, 0.001));
        expect(context.r(20), closeTo(38.4, 0.001));
      });
    });

    group('sp', () {
      testWidgets('scales text size according to screen width', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(750, 812),
        );

        // 16 * 750 / 375 = 32, then clamped to 24.
        expect(context.sp(16), 24);
      });

      testWidgets('respects the minimum text size', (tester) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(100, 812),
        );

        // 5 * 100 / 375 is less than 11.
        expect(context.sp(5), 11);
      });

      testWidgets('applies system text scaling before clamping', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          textScaler: const TextScaler.linear(1.5),
        );

        // 16 * 1.5 = 24.
        expect(context.sp(16), 24);
      });
    });

    group('breakpoints', () {
      testWidgets('identifies mobile screens', (tester) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(599, 800),
        );

        expect(context.isMobile, isTrue);
        expect(context.isTablet, isFalse);
        expect(context.isDesktop, isFalse);
      });

      testWidgets('identifies tablet screens at 600 pixels', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(600, 800),
        );

        expect(context.isMobile, isFalse);
        expect(context.isTablet, isTrue);
        expect(context.isDesktop, isFalse);
      });

      testWidgets('identifies tablet screens below 1024 pixels', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(1023, 800),
        );

        expect(context.isMobile, isFalse);
        expect(context.isTablet, isTrue);
        expect(context.isDesktop, isFalse);
      });

      testWidgets('identifies desktop screens at 1024 pixels', (
        tester,
      ) async {
        final context = await pumpResponsiveContext(
          tester,
          size: const Size(1024, 800),
        );

        expect(context.isMobile, isFalse);
        expect(context.isTablet, isFalse);
        expect(context.isDesktop, isTrue);
      });
    });
  });
}
