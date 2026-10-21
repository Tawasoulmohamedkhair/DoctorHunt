import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/features/common/choose_role/presentation/cubit/role_selection_state.dart';
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

class MockUserModel extends Mock implements UserModel {}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

void main() {
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  // =========================================================================
  // LOGIN
  // =========================================================================

  group('AuthCubit - Login', () {
    // -----------------------------------------------------------------------
    // Login - Patient success
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, success] when patient login succeeds',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();
        final userProfile = MockUserModel();

        when(() => response.user).thenReturn(user);

        when(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        when(() => userProfile.role).thenReturn('patient');

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(
        email: 'test@gmail.com',
        password: '123456',
        role: UserRole.patient,
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
          AuthStatus.success,
        ),
      ],
      verify: (_) {
        verify(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).called(1);

        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Login - Admin success
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, success] when admin login succeeds',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();
        final userProfile = MockUserModel();

        when(() => response.user).thenReturn(user);

        when(
          () => authRepository.login(
            email: 'admin@gmail.com',
            password: '123456',
          ),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        when(() => userProfile.role).thenReturn('admin');

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(
        email: 'admin@gmail.com',
        password: '123456',
        role: UserRole.admin,
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
          AuthStatus.success,
        ),
      ],
      verify: (_) {
        verify(
          () => authRepository.login(
            email: 'admin@gmail.com',
            password: '123456',
          ),
        ).called(1);

        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Login - null user
    // -----------------------------------------------------------------------

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
      act: (cubit) => cubit.login(
        email: 'test@gmail.com',
        password: '123456',
        role: UserRole.patient,
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
              t.failedLogin,
            ),
      ],
      verify: (_) {
        verify(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).called(1);

        verifyNever(() => authRepository.getCurrentUserProfile());

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Login - profile not found
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when user profile is not found',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();

        when(() => response.user).thenReturn(user);

        when(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => null);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(
        email: 'test@gmail.com',
        password: '123456',
        role: UserRole.patient,
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
              'User profile not found.',
            ),
      ],
      verify: (_) {
        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Login - wrong role
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] and logs out when selected role '
      'does not match user role',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();
        final userProfile = MockUserModel();

        when(() => response.user).thenReturn(user);

        when(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        when(() => userProfile.role).thenReturn('patient');

        when(() => authRepository.logOut()).thenAnswer((_) async {});

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(
        email: 'test@gmail.com',
        password: '123456',
        role: UserRole.admin,
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
              contains('admin'),
            ),
      ],
      verify: (_) {
        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verify(() => authRepository.logOut()).called(1);
      },
    );

    // -----------------------------------------------------------------------
    // Login - exception
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when login throws an exception',
      build: () {
        when(
          () =>
              authRepository.login(email: 'test@gmail.com', password: '123456'),
        ).thenThrow(Exception('Invalid credentials'));

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.login(
        email: 'test@gmail.com',
        password: '123456',
        role: UserRole.patient,
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
              'Exception: Invalid credentials',
            ),
      ],
    );
  });

  // =========================================================================
  // SIGN UP
  // =========================================================================

  group('AuthCubit - Sign Up', () {
    // -----------------------------------------------------------------------
    // Sign Up - success
    // -----------------------------------------------------------------------

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

    // -----------------------------------------------------------------------
    // Sign Up - null user
    // -----------------------------------------------------------------------

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

    // -----------------------------------------------------------------------
    // Sign Up - exception
    // -----------------------------------------------------------------------

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
    // -----------------------------------------------------------------------
    // Google - Patient success
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, success] when Google sign in succeeds for patient',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();
        final userProfile = MockUserModel();

        when(() => response.user).thenReturn(user);

        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        when(() => userProfile.role).thenReturn('patient');

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
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

        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Google - Admin success
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, success] when Google sign in succeeds for admin',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();
        final userProfile = MockUserModel();

        when(() => response.user).thenReturn(user);

        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        when(() => userProfile.role).thenReturn('admin');

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.admin),
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

        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Google - null user
    // -----------------------------------------------------------------------

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
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
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
      verify: (_) {
        verify(() => authRepository.signInWithGoogle()).called(1);

        verifyNever(() => authRepository.getCurrentUserProfile());

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Google - profile not found
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when Google user profile is not found',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();

        when(() => response.user).thenReturn(user);

        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => null);

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
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
              'User profile not found.',
            ),
      ],
      verify: (_) {
        verify(() => authRepository.signInWithGoogle()).called(1);

        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verifyNever(() => authRepository.logOut());
      },
    );

    // -----------------------------------------------------------------------
    // Google - wrong role
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] and logs out when Google account '
      'role does not match selected role',
      build: () {
        final response = MockAuthResponse();
        final user = MockUser();
        final userProfile = MockUserModel();

        when(() => response.user).thenReturn(user);

        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => response);

        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        // Account is Patient but Admin was selected.
        when(() => userProfile.role).thenReturn('patient');

        when(() => authRepository.logOut()).thenAnswer((_) async {});

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.admin),
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
              contains('admin'),
            ),
      ],
      verify: (_) {
        verify(() => authRepository.signInWithGoogle()).called(1);

        verify(() => authRepository.getCurrentUserProfile()).called(1);

        verify(() => authRepository.logOut()).called(1);
      },
    );

    // -----------------------------------------------------------------------
    // Google - exception
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when Google sign in throws an exception',
      build: () {
        when(
          () => authRepository.signInWithGoogle(),
        ).thenThrow(Exception('Google sign in failed'));

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
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
    // -----------------------------------------------------------------------
    // Forgot password - success
    // -----------------------------------------------------------------------

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, forgotPasswordSuccess] when forgot password succeeds',
      build: () {
        when(
          () => authRepository.forgotPassword(email: 'test@gmail.com'),
        ).thenAnswer((_) async {});

        return AuthCubit(authRepository);
      },
      act: (cubit) => cubit.forgotPassword(email: ' test@gmail.com '),
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

    // -----------------------------------------------------------------------
    // Forgot password - exception
    // -----------------------------------------------------------------------

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
    // -----------------------------------------------------------------------
    // Verify recovery code - success
    // -----------------------------------------------------------------------

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
          cubit.verifyRecoveryCode(email: ' test@gmail.com ', code: ' 1234 '),
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

    // -----------------------------------------------------------------------
    // Verify recovery code - no session
    // -----------------------------------------------------------------------

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

    // -----------------------------------------------------------------------
    // Verify recovery code - exception
    // -----------------------------------------------------------------------

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
    // -----------------------------------------------------------------------
    // Reset password - success
    // -----------------------------------------------------------------------

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

    // -----------------------------------------------------------------------
    // Reset password - exception
    // -----------------------------------------------------------------------

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
