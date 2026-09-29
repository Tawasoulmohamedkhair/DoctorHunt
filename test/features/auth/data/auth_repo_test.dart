import 'dart:async';

import 'package:doctor_hunt/apps/Patient/features/auth/data/Repository/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockAuthResponse extends Mock implements AuthResponse {}

class MockUserResponse extends Mock implements UserResponse {}

class MockUser extends Mock implements User {}

class MockSession extends Mock implements Session {}
class FakeUserAttributes extends Fake implements UserAttributes {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUserAttributes());
  });
  late MockSupabaseClient supabaseClient;
  late MockGoTrueClient auth;
  late AuthRepository repository;

  setUp(() {
    supabaseClient = MockSupabaseClient();
    auth = MockGoTrueClient();

    when(() => supabaseClient.auth).thenReturn(auth);

    repository = AuthRepository(supabaseClient);
  });

  // ============================================================
  // LOGIN
  // ============================================================

  group('login', () {
    test('should call signInWithPassword with correct data', () async {
      final response = MockAuthResponse();

      when(
        () => auth.signInWithPassword(
          email: 'test@gmail.com',
          password: 'Password123',
        ),
      ).thenAnswer((_) async => response);

      final result = await repository.login(
        email: 'test@gmail.com',
        password: 'Password123',
      );

      expect(result, response);

      verify(
        () => auth.signInWithPassword(
          email: 'test@gmail.com',
          password: 'Password123',
        ),
      ).called(1);
    });

    test('should trim email before calling Supabase', () async {
      final response = MockAuthResponse();

      when(
        () => auth.signInWithPassword(
          email: 'test@gmail.com',
          password: 'Password123',
        ),
      ).thenAnswer((_) async => response);

      await repository.login(
        email: '  test@gmail.com  ',
        password: 'Password123',
      );

      verify(
        () => auth.signInWithPassword(
          email: 'test@gmail.com',
          password: 'Password123',
        ),
      ).called(1);
    });

    test('should throw exception when Supabase login fails', () async {
      when(
        () => auth.signInWithPassword(
          email: 'test@gmail.com',
          password: 'Password123',
        ),
      ).thenThrow(Exception('Login failed'));

      expect(
        () =>
            repository.login(email: 'test@gmail.com', password: 'Password123'),
        throwsException,
      );
    });
  });

  // ============================================================
  // SIGN UP
  // ============================================================

  group('signUp', () {
    test('should call signUp with correct data', () async {
      final response = MockAuthResponse();

      when(
        () => auth.signUp(
          email: 'test@gmail.com',
          password: 'Password123',
          data: {'full_name': 'Test User'},
        ),
      ).thenAnswer((_) async => response);

      final result = await repository.signUp(
        email: 'test@gmail.com',
        password: 'Password123',
        fullName: 'Test User',
      );

      expect(result, response);

      verify(
        () => auth.signUp(
          email: 'test@gmail.com',
          password: 'Password123',
          data: {'full_name': 'Test User'},
        ),
      ).called(1);
    });

    test('should trim email before calling Supabase', () async {
      final response = MockAuthResponse();

      when(
        () => auth.signUp(
          email: 'test@gmail.com',
          password: 'Password123',
          data: {'full_name': 'Test User'},
        ),
      ).thenAnswer((_) async => response);

      await repository.signUp(
        email: '  test@gmail.com  ',
        password: 'Password123',
        fullName: 'Test User',
      );

      verify(
        () => auth.signUp(
          email: 'test@gmail.com',
          password: 'Password123',
          data: {'full_name': 'Test User'},
        ),
      ).called(1);
    });

    test('should throw exception when Supabase signup fails', () async {
      when(
        () => auth.signUp(
          email: 'test@gmail.com',
          password: 'Password123',
          data: {'full_name': 'Test User'},
        ),
      ).thenThrow(Exception('Signup failed'));

      expect(
        () => repository.signUp(
          email: 'test@gmail.com',
          password: 'Password123',
          fullName: 'Test User',
        ),
        throwsException,
      );
    });
  });

  // ============================================================
  // FORGOT PASSWORD
  // ============================================================

  group('forgotPassword', () {
    test('should call resetPasswordForEmail with correct email', () async {
      when(
        () => auth.resetPasswordForEmail('test@gmail.com'),
      ).thenAnswer((_) async {});

      await repository.forgotPassword(email: 'test@gmail.com');

      verify(() => auth.resetPasswordForEmail('test@gmail.com')).called(1);
    });

    test('should trim email before sending reset request', () async {
      when(
        () => auth.resetPasswordForEmail('test@gmail.com'),
      ).thenAnswer((_) async {});

      await repository.forgotPassword(email: '  test@gmail.com  ');

      verify(() => auth.resetPasswordForEmail('test@gmail.com')).called(1);
    });

    test('should throw exception when reset request fails', () async {
      when(
        () => auth.resetPasswordForEmail('test@gmail.com'),
      ).thenThrow(Exception('Reset password failed'));

      expect(
        () => repository.forgotPassword(email: 'test@gmail.com'),
        throwsException,
      );
    });
  });

  // ============================================================
  // VERIFY RECOVERY OTP
  // ============================================================

  group('verifyRecoveryCode', () {
    test('should call verifyOTP with recovery type', () async {
      final response = MockAuthResponse();

      when(
        () => auth.verifyOTP(
          email: 'test@gmail.com',
          token: '1234',
          type: OtpType.recovery,
        ),
      ).thenAnswer((_) async => response);

      final result = await repository.verifyRecoveryCode(
        email: 'test@gmail.com',
        code: '1234',
      );

      expect(result, response);

      verify(
        () => auth.verifyOTP(
          email: 'test@gmail.com',
          token: '1234',
          type: OtpType.recovery,
        ),
      ).called(1);
    });

    test('should trim email and code', () async {
      final response = MockAuthResponse();

      when(
        () => auth.verifyOTP(
          email: 'test@gmail.com',
          token: '1234',
          type: OtpType.recovery,
        ),
      ).thenAnswer((_) async => response);

      await repository.verifyRecoveryCode(
        email: '  test@gmail.com  ',
        code: ' 1234 ',
      );

      verify(
        () => auth.verifyOTP(
          email: 'test@gmail.com',
          token: '1234',
          type: OtpType.recovery,
        ),
      ).called(1);
    });

    test('should throw exception when OTP verification fails', () async {
      when(
        () => auth.verifyOTP(
          email: 'test@gmail.com',
          token: '1234',
          type: OtpType.recovery,
        ),
      ).thenThrow(Exception('Invalid OTP'));

      expect(
        () => repository.verifyRecoveryCode(
          email: 'test@gmail.com',
          code: '1234',
        ),
        throwsException,
      );
    });
  });

  // ============================================================
  // RESET PASSWORD
  // ============================================================

  group('resetPassword', () {
    test('should call updateUser with new password', () async {
      final response = MockUserResponse();

      when(() => auth.updateUser(any())).thenAnswer((_) async => response);

      final result = await repository.resetPassword(password: 'NewPassword123');

      expect(result, response);

      verify(
        () => auth.updateUser(
          any(
            that: isA<UserAttributes>().having(
              (attributes) => attributes.password,
              'password',
              'NewPassword123',
            ),
          ),
        ),
      ).called(1);
    });

    test('should throw exception when password update fails', () async {
      when(
        () => auth.updateUser(any()),
      ).thenThrow(Exception('Update password failed'));

      expect(
        () => repository.resetPassword(password: 'NewPassword123'),
        throwsException,
      );
    });
  });

  // ============================================================
  // AUTH STATE CHANGES
  // ============================================================

  group('authStateChanges', () {
    test('should return Supabase auth state stream', () {
      final controller = StreamController<AuthState>();

      when(() => auth.onAuthStateChange).thenAnswer((_) => controller.stream);

      final result = repository.authStateChanges;

      expect(result, controller.stream);

      verify(() => auth.onAuthStateChange).called(1);

      controller.close();
    });
  });
}
