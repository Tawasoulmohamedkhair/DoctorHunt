import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/features/common/choose_role/presentation/cubit/role_selection_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthResponse extends Mock implements AuthResponse {}

class MockSupabaseUser extends Mock implements User {}

class MockSession extends Mock implements Session {}
class MockUserResponse extends Mock implements UserResponse {}

Matcher hasStatus(AuthStatus status) {
  return isA<AuthCubitState>().having(
    (state) => state.status,
    'status',
    status,
  );
}

void main() {
  late MockAuthRepository repository;
  late MockAuthResponse response;
  late MockSupabaseUser supabaseUser;
  late MockSession session;

  const userProfile = UserModel(
    id: 'user-123',
    fullName: 'Test Patient',
    email: 'test@example.com',
    role: 'patient',
    isActive: true,
  );

  const updatedProfile = UserModel(
    id: 'user-123',
    fullName: 'Updated Patient',
    email: 'test@example.com',
    phone: '12345678',
    avatarUrl: 'https://example.com/avatar.png',
    role: 'patient',
    isActive: true,
  );

  setUp(() {
    repository = MockAuthRepository();
    response = MockAuthResponse();
    supabaseUser = MockSupabaseUser();
    session = MockSession();
  });

  group('AuthCubit - login', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits loading then success when login succeeds',
      setUp: () {
        when(
          () => repository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });

        when(
          () => repository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.login(
        email: 'test@example.com',
        password: 'password123',
        role: UserRole.patient,
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.success)
            .having((state) => state.user?.id, 'user id', userProfile.id),
      ],
      verify: (_) {
        verify(
          () => repository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).called(1);

        verify(() => repository.getCurrentUserProfile()).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when login response has no user',
      setUp: () {
        when(
          () => repository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).thenAnswer((_) async {
          when(() => response.user).thenReturn(null);
          return response;
        });
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.login(
        email: 'test@example.com',
        password: 'password123',
        role: UserRole.patient,
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
      verify: (_) {
        verifyNever(() => repository.getCurrentUserProfile());
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when user profile is missing',
      setUp: () {
        when(
          () => repository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });

        when(
          () => repository.getCurrentUserProfile(),
        ).thenAnswer((_) async => null);
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.login(
        email: 'test@example.com',
        password: 'password123',
        role: UserRole.patient,
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'logs out when the selected role does not match the account role',
      setUp: () {
        when(
          () => repository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });

        when(
          () => repository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        when(() => repository.logOut()).thenAnswer((_) async {});
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.login(
        email: 'test@example.com',
        password: 'password123',
        role: UserRole.admin,
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
      verify: (_) {
        verify(() => repository.logOut()).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when repository throws',
      setUp: () {
        when(
          () => repository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).thenThrow(Exception('Login failed'));
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.login(
        email: 'test@example.com',
        password: 'password123',
        role: UserRole.patient,
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );
  });

  group('AuthCubit - signUp', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits signUpSuccess when registration succeeds',
      setUp: () {
        when(
          () => repository.signUp(
            email: 'test@example.com',
            password: 'password123',
            fullName: 'Test Patient',
          ),
        ).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signUp(
        email: 'test@example.com',
        password: 'password123',
        fullName: 'Test Patient',
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.signUpSuccess),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when registration response has no user',
      setUp: () {
        when(
          () => repository.signUp(
            email: 'test@example.com',
            password: 'password123',
            fullName: 'Test Patient',
          ),
        ).thenAnswer((_) async {
          when(() => response.user).thenReturn(null);
          return response;
        });
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signUp(
        email: 'test@example.com',
        password: 'password123',
        fullName: 'Test Patient',
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when registration throws',
      setUp: () {
        when(
          () => repository.signUp(
            email: 'test@example.com',
            password: 'password123',
            fullName: 'Test Patient',
          ),
        ).thenThrow(Exception('Registration failed'));
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signUp(
        email: 'test@example.com',
        password: 'password123',
        fullName: 'Test Patient',
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );
  });

  group('AuthCubit - signInWithGoogle', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits success when Google sign in succeeds',
      setUp: () {
        when(() => repository.signInWithGoogle()).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });

        when(
          () => repository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
      expect: () => [
        hasStatus(AuthStatus.loading),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.success)
            .having((state) => state.user?.id, 'user id', userProfile.id),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when Google response has no user',
      setUp: () {
        when(() => repository.signInWithGoogle()).thenAnswer((_) async {
          when(() => response.user).thenReturn(null);
          return response;
        });
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
      verify: (_) {
        verifyNever(() => repository.getCurrentUserProfile());
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when Google account has no profile',
      setUp: () {
        when(() => repository.signInWithGoogle()).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });

        when(
          () => repository.getCurrentUserProfile(),
        ).thenAnswer((_) async => null);
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'logs out when Google account role does not match',
      setUp: () {
        when(() => repository.signInWithGoogle()).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });

        when(
          () => repository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);

        when(() => repository.logOut()).thenAnswer((_) async {});
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.admin),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
      verify: (_) {
        verify(() => repository.logOut()).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when Google sign in throws',
      setUp: () {
        when(
          () => repository.signInWithGoogle(),
        ).thenThrow(Exception('Google sign in failed'));
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.signInWithGoogle(role: UserRole.patient),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );
  });

  group('AuthCubit - forgotPassword', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits forgotPasswordSuccess when request succeeds',
      setUp: () {
        when(
          () => repository.forgotPassword(email: 'test@example.com'),
        ).thenAnswer((_) async {});
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.forgotPassword(email: '  test@example.com  '),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.forgotPasswordSuccess),
      ],
      verify: (_) {
        verify(
          () => repository.forgotPassword(email: 'test@example.com'),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when password reset request throws',
      setUp: () {
        when(
          () => repository.forgotPassword(email: 'test@example.com'),
        ).thenThrow(Exception('Request failed'));
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.forgotPassword(email: 'test@example.com'),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );
  });

  group('AuthCubit - verifyRecoveryCode', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits verifyCodeSuccess when session exists',
      setUp: () {
        when(
          () => repository.verifyRecoveryCode(
            email: 'test@example.com',
            code: '123456',
          ),
        ).thenAnswer((_) async {
          when(() => response.session).thenReturn(session);
          return response;
        });
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.verifyRecoveryCode(
        email: ' test@example.com ',
        code: ' 123456 ',
      ),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.verifyCodeSuccess),
      ],
      verify: (_) {
        verify(
          () => repository.verifyRecoveryCode(
            email: 'test@example.com',
            code: '123456',
          ),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when response has no session',
      setUp: () {
        when(
          () => repository.verifyRecoveryCode(
            email: 'test@example.com',
            code: '123456',
          ),
        ).thenAnswer((_) async {
          when(() => response.session).thenReturn(null);
          return response;
        });
      },
      build: () => AuthCubit(repository),
      act: (cubit) =>
          cubit.verifyRecoveryCode(email: 'test@example.com', code: '123456'),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits failure when verification throws',
      setUp: () {
        when(
          () => repository.verifyRecoveryCode(
            email: 'test@example.com',
            code: '123456',
          ),
        ).thenThrow(Exception('Verification failed'));
      },
      build: () => AuthCubit(repository),
      act: (cubit) =>
          cubit.verifyRecoveryCode(email: 'test@example.com', code: '123456'),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.failure),
      ],
    );
  });

  group('AuthCubit - resetPassword', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits resetPasswordSuccess when reset succeeds',
      setUp: () {
        when(
          () => repository.resetPassword(password: 'newPassword123'),
        ).thenAnswer((_) async {
          return MockUserResponse();
        });
      },
      build: () => AuthCubit(repository),
      act: (cubit) => cubit.resetPassword(password: 'newPassword123'),
      expect: () => [
        hasStatus(AuthStatus.loading),
        hasStatus(AuthStatus.resetPasswordSuccess),
      ],
    );
  });

  group('AuthCubit - updateCurrentUserProfile', () {
    blocTest<AuthCubit, AuthCubitState>(
      'updates the profile after a successful login',
      setUp: () {
        when(
          () => repository.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ).thenAnswer((_) async {
          when(() => response.user).thenReturn(supabaseUser);
          return response;
        });

        when(
          () => repository.getCurrentUserProfile(),
        ).thenAnswer((_) async => userProfile);
      },
      build: () => AuthCubit(repository),
      act: (cubit) async {
        await cubit.login(
          email: 'test@example.com',
          password: 'password123',
          role: UserRole.patient,
        );

        cubit.updateCurrentUserProfile(
          fullName: 'Updated Patient',
          phone: '12345678',
          avatarUrl: 'https://example.com/avatar.png',
        );
      },
      expect: () => [
        hasStatus(AuthStatus.loading),
        isA<AuthCubitState>()
            .having((state) => state.status, 'status', AuthStatus.success)
            .having(
              (state) => state.user?.fullName,
              'original name',
              userProfile.fullName,
            ),
        isA<AuthCubitState>()
            .having(
              (state) => state.user?.fullName,
              'updated name',
              updatedProfile.fullName,
            )
            .having(
              (state) => state.user?.phone,
              'updated phone',
              updatedProfile.phone,
            )
            .having(
              (state) => state.user?.avatarUrl,
              'updated avatar',
              updatedProfile.avatarUrl,
            ),
      ],
    );

    blocTest<AuthCubit, AuthCubitState>(
      'does not emit a new state when there is no logged-in user',
      build: () => AuthCubit(repository),
      act: (cubit) {
        cubit.updateCurrentUserProfile(
          fullName: 'Updated Patient',
          phone: '12345678',
          avatarUrl: null,
        );
      },
      expect: () => <AuthCubitState>[],
    );
  });
}
