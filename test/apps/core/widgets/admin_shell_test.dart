
import 'package:doctor_hunt/apps/core/widgets/admin_shell.dart';
import 'package:doctor_hunt/apps/features/admin/features/navigation/widgets/admin_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  late GoRouter router;

  setUp(() {
    router = GoRouter(
      initialLocation: '/admin',
      routes: [
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminShell(
            child: Text('Admin Content'),
          ),
        ),
      ],
    );
  });

  tearDown(() {
    router.dispose();
  });

  Future<void> pumpAdminShell(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    await tester.pumpAndSettle();
  }

  group('AdminShell', () {
    testWidgets('renders the child widget', (tester) async {
      await pumpAdminShell(tester);

      expect(find.text('Admin Content'), findsOneWidget);
    });

    testWidgets('renders AdminNavigationBar', (tester) async {
      await pumpAdminShell(tester);

      expect(find.byType(AdminNavigationBar), findsOneWidget);
    });

    testWidgets('places child inside Scaffold body', (tester) async {
      await pumpAdminShell(tester);

      final scaffold = tester.widget<Scaffold>(
        find.byType(Scaffold).first,
      );

      expect(scaffold.body, isA<Widget>());
      expect(
        find.descendant(
          of: find.byType(Scaffold).first,
          matching: find.text('Admin Content'),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
      'sets AdminNavigationBar as bottomNavigationBar',
      (tester) async {
        await pumpAdminShell(tester);

        final scaffold = tester.widget<Scaffold>(
          find.byType(Scaffold).first,
        );

        expect(
          scaffold.bottomNavigationBar,
          isA<AdminNavigationBar>(),
        );
      },
    );

    testWidgets(
      'keeps child visible alongside bottom navigation',
      (tester) async {
        await pumpAdminShell(tester);

        expect(find.text('Admin Content'), findsOneWidget);
        expect(find.byType(AdminNavigationBar), findsOneWidget);
      },
    );
  });
}