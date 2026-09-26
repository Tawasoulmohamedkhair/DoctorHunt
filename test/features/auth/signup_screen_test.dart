import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

void main() {
  late MockAuthCubit mockCubit;

  setUp(() {
    mockCubit = MockAuthCubit();

    when(
      () => mockCubit.state,
    ).thenReturn(const AuthCubitState(status: AuthStatus.initial));

    when(() => mockCubit.stream).thenAnswer((_) => const Stream.empty());
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

  testWidgets('calls signUp when form is valid and privacy is accepted', (
    tester,
  ) async {
    when(
      () => mockCubit.signUp(
        fullName: any(named: 'fullName'),
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async {});

    await tester.pumpWidget(buildSubject());

    await tester.pumpAndSettle();

    final fields = find.byType(TextFormField);

    expect(fields, findsNWidgets(3));

    await tester.enterText(fields.at(0), 'Ahmed Ali');

    await tester.enterText(fields.at(1), 'ahmed@test.com');

    await tester.enterText(fields.at(2), 'Aa@12345');

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
  });
}
