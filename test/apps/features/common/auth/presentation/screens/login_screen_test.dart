import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/apps/features/common/choose_role/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class MockAuthCubit extends MockCubit<AuthCubitState> implements AuthCubit {}

void main() {
  late MockAuthCubit authCubit;

  setUpAll(() {
    registerFallbackValue(UserRole.patient);
  });

  setUp(() {
    authCubit = MockAuthCubit();

    when(() => authCubit.state).thenReturn(const AuthCubitState());

    when(
      () => authCubit.stream,
    ).thenAnswer((_) => const Stream<AuthCubitState>.empty());
  });

  Widget createWidgetUnderTest({UserRole role = UserRole.patient}) {
    return MaterialApp(
      locale: const Locale('en'),
      home: TranslationProvider(
        child: BlocProvider<AuthCubit>.value(
          value: authCubit,
          child: LoginScreen(role: role),
        ),
      ),
    );
  }

  // Find fields by their configured keyboard types instead of their positions.
  final emailField = find.byWidgetPredicate(
    (widget) =>
        widget is EditableText &&
        widget.keyboardType == TextInputType.emailAddress,
  );

  final passwordField = find.byWidgetPredicate(
    (widget) =>
        widget is EditableText &&
        widget.keyboardType == TextInputType.visiblePassword,
  );

  group('LoginScreen Widget Tests', () {
    testWidgets('renders login screen elements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.byType(TextFormField), findsAtLeastNWidgets(2));
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('shows validation errors when fields are empty', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final translations = Translations.of(
        tester.element(find.byType(LoginScreen)),
      );

      await tester.ensureVisible(find.text(translations.logIn));
      await tester.tap(find.text(translations.logIn));
      await tester.pumpAndSettle();

      expect(find.text(translations.enterEmail), findsOneWidget);
      expect(find.text(translations.enterPassword), findsOneWidget);

      verifyNever(
        () => authCubit.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
          role: any(named: 'role'),
        ),
      );
    });

    testWidgets('calls login with entered credentials', (tester) async {
      when(
        () => authCubit.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
          role: any(named: 'role'),
        ),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());

      final translations = Translations.of(
        tester.element(find.byType(LoginScreen)),
      );

      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');

      await tester.ensureVisible(find.text(translations.logIn));
      await tester.tap(find.text(translations.logIn));
      await tester.pump();

      verify(
        () => authCubit.login(
          email: 'test@example.com',
          password: 'password123',
          role: UserRole.patient,
        ),
      ).called(1);
    });

    testWidgets(
      'disables login button and shows progress indicator while loading',
      (tester) async {
        when(
          () => authCubit.state,
        ).thenReturn(const AuthCubitState(status: AuthStatus.loading));

        await tester.pumpWidget(createWidgetUnderTest());

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets('shows error message when login fails', (tester) async {
      const errorMessage = 'Unable to sign in';

      whenListen(
        authCubit,
        Stream<AuthCubitState>.fromIterable([
          const AuthCubitState(
            status: AuthStatus.failure,
            errorMessage: errorMessage,
          ),
        ]),
        initialState: const AuthCubitState(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('does not show join link for admin role', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(role: UserRole.admin));

      final translations = Translations.of(
        tester.element(find.byType(LoginScreen)),
      );

      expect(find.text(translations.join), findsNothing);
    });
  });
}
