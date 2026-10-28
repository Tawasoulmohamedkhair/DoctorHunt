
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthCubit extends MockCubit<AuthCubitState> implements AuthCubit {}

void main() {
  late MockAuthCubit mockCubit;

  setUp(() {
    mockCubit = MockAuthCubit();

    when(
      () => mockCubit.state,
    ).thenReturn(const AuthCubitState(status: AuthStatus.initial));

    when(
      () => mockCubit.stream,
    ).thenAnswer((_) => const Stream<AuthCubitState>.empty());
  });

  Widget buildSubject() {
    return TranslationProvider(
      child: MaterialApp(
        home: BlocProvider<AuthCubit>.value(
          value: mockCubit,
          child: const SignupScreen(),
        ),
      ),
    );
  }

  // Locate fields by their configured keyboard types, not their positions.
  final nameField = find.byWidgetPredicate(
    (widget) =>
        widget is EditableText &&
        widget.keyboardType == TextInputType.text,
  );

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

  Future<void> enterValidCredentials(WidgetTester tester) async {
    expect(nameField, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);

    await tester.enterText(nameField, 'Ahmed Ali');
    await tester.enterText(emailField, 'ahmed@test.com');
    await tester.enterText(passwordField, 'Aa@12345');
  }

  testWidgets('renders SignupScreen', (tester) async {
    await tester.pumpWidget(buildSubject());
    await tester.pumpAndSettle();

    expect(find.byType(SignupScreen), findsOneWidget);
  });

  testWidgets('does not call signUp when fields are empty', (tester) async {
    when(
      () => mockCubit.signUp(
        fullName: any(named: 'fullName'),
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async {});

    await tester.pumpWidget(buildSubject());
    await tester.pumpAndSettle();

    final signUpButton = find.byType(CustomElevatedButton);
    expect(signUpButton, findsOneWidget);

    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

    verifyNever(
      () => mockCubit.signUp(
        fullName: any(named: 'fullName'),
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    );
  });

  testWidgets(
    'calls signUp when form is valid and privacy is accepted',
    (tester) async {
      when(
        () => mockCubit.signUp(
          fullName: any(named: 'fullName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(buildSubject());
      await tester.pumpAndSettle();

      await enterValidCredentials(tester);

      final checkbox = find.byType(Checkbox);
      expect(checkbox, findsOneWidget);

      await tester.tap(checkbox);
      await tester.pump();

      final signUpButton = find.byType(CustomElevatedButton);
      expect(signUpButton, findsOneWidget);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      verify(
        () => mockCubit.signUp(
          fullName: 'Ahmed Ali',
          email: 'ahmed@test.com',
          password: 'Aa@12345',
        ),
      ).called(1);
    },
  );

  testWidgets(
    'does not call signUp when privacy is not accepted',
    (tester) async {
      when(
        () => mockCubit.signUp(
          fullName: any(named: 'fullName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(buildSubject());
      await tester.pumpAndSettle();

      await enterValidCredentials(tester);

      // Privacy is intentionally not accepted.
      final signUpButton = find.byType(CustomElevatedButton);
      expect(signUpButton, findsOneWidget);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      verifyNever(
        () => mockCubit.signUp(
          fullName: any(named: 'fullName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    },
  );

testWidgets('does not call signUp when email is invalid', (tester) async {
    when(
      () => mockCubit.signUp(
        fullName: any(named: 'fullName'),
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async {});

    await tester.pumpWidget(buildSubject());
    await tester.pump();

    expect(nameField, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);

    await tester.enterText(nameField, 'Ahmed Ali');
    await tester.enterText(emailField, 'ahmed@test');
    await tester.enterText(passwordField, 'Aa@12345');

    final checkbox = find.byType(Checkbox);
    expect(checkbox, findsOneWidget);

    await tester.tap(checkbox);
    await tester.pump();

    final signUpButton = find.byType(CustomElevatedButton);
    expect(signUpButton, findsOneWidget);

    await tester.tap(signUpButton);
    await tester.pump();

    verifyNever(
      () => mockCubit.signUp(
        fullName: any(named: 'fullName'),
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    );
  });
}
