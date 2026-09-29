import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/data/Repository/auth_repo.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthResponse extends Mock implements AuthResponse {}

class MockUserResponse extends Mock implements UserResponse {}

class MockUser extends Mock implements User {}

class MockSession extends Mock implements Session {}

void main() {
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  // =========================================================================
  // LOGIN
  // =========================================================================

  group('AuthCubit - Login', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, success] when login succeeds',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();

        when(() => response.user).thenReturn(user);

        when(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(email: 'test@gmail.com', password: '123456'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.success,
        ),
      ],
      verify: (_) {
        verify(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when login returns null user',
      build: () {
        final response = MockAuthResponse();

        when(() => response.user).thenReturn(null);

        when(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(email: 'test@gmail.com', password: '123456'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              t.failedLogin,
            ),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when login throws an exception',
      build: () {
        when(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).thenThrow(Exception('Invalid credentials'));

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(email: 'test@gmail.com', password: '123456'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Invalid credentials',
            ),
      ],
    );
  });

  // =========================================================================
  // SIGN UP
  // =========================================================================

  group('AuthCubit - Sign Up', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, signUpSuccess] when sign up succeeds',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();

        when(() => response.user).thenReturn(user);

        when(
          () => authRepository.signUp(
            email: 'test@gmail.com',
            password: '123456',
            fullName: 'Test User',
          ),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signUp(
        email: 'test@gmail.com',
        password: '123456',
        fullName: 'Test User',
      ),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.signUpSuccess,
        ),
      ],
      verify: (_) {
        verify(
          () => authRepository.signUp(
            email: 'test@gmail.com',
            password: '123456',
            fullName: 'Test User',
          ),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when sign up returns null user',
      build: () {
        final response = MockAuthResponse();

        when(() => response.user).thenReturn(null);

        when(
          () => authRepository.signUp(
            email: 'test@gmail.com',
            password: '123456',
            fullName: 'Test User',
          ),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signUp(
        email: 'test@gmail.com',
        password: '123456',
        fullName: 'Test User',
      ),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              t.failedSignup,
            ),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when sign up throws an exception',
      build: () {
        when(
          () => authRepository.signUp(
            email: 'test@gmail.com',
            password: '123456',
            fullName: 'Test User',
          ),
        ).thenThrow(Exception('Sign up failed'));

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signUp(
        email: 'test@gmail.com',
        password: '123456',
        fullName: 'Test User',
      ),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Sign up failed',
            ),
      ],
    );
  });

  // =========================================================================
  // GOOGLE SIGN IN
  // =========================================================================

  group('AuthCubit - Google Sign In', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, success] when Google sign in succeeds',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();

        when(() => response.user).thenReturn(user);

        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.success,
        ),
      ],
      verify: (_) {
        verify(() => authRepository.signInWithGoogle()).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when Google sign in returns null user',
      build: () {
        final response = MockAuthResponse();

        when(() => response.user).thenReturn(null);

        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              t.googleSigninFailed,
            ),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when Google sign in throws an exception',
      build: () {
        when(
          () => authRepository.signInWithGoogle(),
        ).thenThrow(Exception('Google sign in failed'));

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Google sign in failed',
            ),
      ],
    );
  });

  // =========================================================================
  // FORGOT PASSWORD
  // =========================================================================

  group('AuthCubit - Forgot Password', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, forgotPasswordSuccess] when forgot password succeeds',
      build: () {
        when(
          () => authRepository.forgotPassword(email: 'test@gmail.com'),
        ).thenAnswer((_) async {});

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.forgotPassword(email: '  test@gmail.com  '),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.forgotPasswordSuccess,
        ),
      ],
      verify: (_) {
        verify(
          () => authRepository.forgotPassword(email: 'test@gmail.com'),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when forgot password throws an exception',
      build: () {
        when(
          () => authRepository.forgotPassword(email: 'test@gmail.com'),
        ).thenThrow(Exception('Email not found'));

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.forgotPassword(email: 'test@gmail.com'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Email not found',
            ),
      ],
    );
  });

  // =========================================================================
  // VERIFY RECOVERY CODE
  // =========================================================================

  group('AuthCubit - Verify Recovery Code', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, verifyCodeSuccess] when recovery code is valid',
      build: () {
        final response = MockAuthResponse();
        final session = MockSession();

        when(() => response.session).thenReturn(session);

        when(
          () => authRepository.verifyRecoveryCode(
            email: 'test@gmail.com',
            code: '1234',
          ),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) =>
          cubit.verifyRecoveryCode(email: '  test@gmail.com  ', code: ' 1234 '),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.verifyCodeSuccess,
        ),
      ],
      verify: (_) {
        verify(
          () => authRepository.verifyRecoveryCode(
            email: 'test@gmail.com',
            code: '1234',
          ),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when recovery code has no session',
      build: () {
        final response = MockAuthResponse();

        when(() => response.session).thenReturn(null);

        when(
          () => authRepository.verifyRecoveryCode(
            email: 'test@gmail.com',
            code: '1234',
          ),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) =>
          cubit.verifyRecoveryCode(email: 'test@gmail.com', code: '1234'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              t.otpnorecovery,
            ),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when verify recovery code throws an exception',
      build: () {
        when(
          () => authRepository.verifyRecoveryCode(
            email: 'test@gmail.com',
            code: '1234',
          ),
        ).thenThrow(Exception('Invalid OTP'));

        return AuthCubit(authRepository);
      },
      act: (cubit) =>
          cubit.verifyRecoveryCode(email: 'test@gmail.com', code: '1234'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Invalid OTP',
            ),
      ],
    );
  });

  // =========================================================================
  // RESET PASSWORD
  // =========================================================================

  group('AuthCubit - Reset Password', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, resetPasswordSuccess] when reset password succeeds',
      build: () {
        final response = MockUserResponse();

        when(
          () => authRepository.resetPassword(password: 'NewPassword123'),
        ).thenAnswer((_) async => response);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.resetPassword(password: 'NewPassword123'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.resetPasswordSuccess,
        ),
      ],
      verify: (_) {
        verify(
          () => authRepository.resetPassword(password: 'NewPassword123'),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when reset password throws an exception',
      build: () {
        when(
          () => authRepository.resetPassword(password: 'NewPassword123'),
        ).thenThrow(Exception('Reset password failed'));

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.resetPassword(password: 'NewPassword123'),
      expect: () => [
        isA<AuthCubitState>().having(
          (state) => state.status,
          'status',
          AuthStatus.loading,
        ),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.failure)
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Reset password failed',
            ),
      ],
    );
  });
}
