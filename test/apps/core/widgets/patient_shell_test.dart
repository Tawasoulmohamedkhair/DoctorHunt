
import 'package:doctor_hunt/apps/core/widgets/patient_shell.dart';
import 'package:doctor_hunt/apps/core/widgets/patient_drawer.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthCubit extends MockCubit<AuthCubitState>
    implements AuthCubit {}

class MockCubit<T> extends Mock implements Cubit<T> {}


void main() {
  late MockAuthCubit authCubit;

  const testUser = UserModel(
    id: 'patient-1',
    fullName: 'Test Patient',
    email: 'patient@example.com',
    phone: '12345678',
    avatarUrl: null,
    role: 'patient',
    isActive: true,
  );

  const routes = [
    '/home',
    '/favourites',
    '/appointments',
    '/settings',
  ];

  setUp(() {
    authCubit = MockAuthCubit();

    when(() => authCubit.state).thenReturn(
      const AuthCubitState(user: testUser),
    );

    when(() => authCubit.stream).thenAnswer(
      (_) => const Stream<AuthCubitState>.empty(),
    );
  });

  Widget buildTestApp(String initialLocation) {
    final router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return PatientShell(child: child);
          },
          routes: [
            for (final path in routes)
              GoRoute(
                path: path,
                builder: (context, state) {
                  return Center(
                    child: Text('Screen: $path'),
                  );
                },
              ),
          ],
        ),
      ],
    );

    return BlocProvider<AuthCubit>.value(
      value: authCubit,
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }

  group('PatientShell', () {
    for (var index = 0; index < routes.length; index++) {
      final path = routes[index];

      testWidgets('shows child and selects navigation index $index for $path',
          (tester) async {
        await tester.pumpWidget(buildTestApp(path));
        await tester.pumpAndSettle();

        expect(find.text('Screen: $path'), findsOneWidget);
        expect(find.byType(BottomNavBar), findsOneWidget);

        final navBar = tester.widget<BottomNavigationBar>(
          find.descendant(
            of: find.byType(BottomNavBar),
            matching: find.byType(BottomNavigationBar),
          ),
        );

        expect(navBar.currentIndex, index);
        expect(navBar.items, hasLength(4));
      });
    }

    testWidgets('passes the current user name to PatientDrawer',
        (tester) async {
      await tester.pumpWidget(buildTestApp('/home'));
      await tester.pumpAndSettle();

      final drawer = tester.widget<PatientDrawer>(
        find.byType(PatientDrawer),
      );

      expect(drawer.userName, 'Test Patient');
      expect(drawer.avatarUrl, isNull);
      expect(drawer.selectedIndex, 0);
    });

    testWidgets('navigates to favourites when the second item is tapped',
        (tester) async {
      await tester.pumpWidget(buildTestApp('/home'));
      await tester.pumpAndSettle();

      await tester.tap(
        find.descendant(
          of: find.byType(BottomNavBar),
          matching: find.byIcon(Icons.favorite),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Screen: /favourites'), findsOneWidget);

      final navBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );

      expect(navBar.currentIndex, 1);
    });

    testWidgets('navigates to appointments when the third item is tapped',
        (tester) async {
      await tester.pumpWidget(buildTestApp('/home'));
      await tester.pumpAndSettle();

      await tester.tap(
        find.descendant(
          of: find.byType(BottomNavBar),
          matching: find.byIcon(Icons.menu_book_outlined),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Screen: /appointments'), findsOneWidget);
    });

    testWidgets('navigates to settings when the fourth item is tapped',
        (tester) async {
      await tester.pumpWidget(buildTestApp('/home'));
      await tester.pumpAndSettle();

      await tester.tap(
        find.descendant(
          of: find.byType(BottomNavBar),
          matching: find.byIcon(Icons.chat_rounded),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Screen: /settings'), findsOneWidget);
    });

    testWidgets('uses User when no authenticated user exists',
        (tester) async {
      when(() => authCubit.state).thenReturn(
        const AuthCubitState(),
      );

      await tester.pumpWidget(buildTestApp('/home'));
      await tester.pumpAndSettle();

      final drawer = tester.widget<PatientDrawer>(
        find.byType(PatientDrawer),
      );

      expect(drawer.userName, 'User');
      expect(drawer.avatarUrl, isNull);
    });
  });
}
