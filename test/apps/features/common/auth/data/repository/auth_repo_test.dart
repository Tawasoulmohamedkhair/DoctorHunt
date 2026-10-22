import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockAuthResponse extends Mock implements AuthResponse {}

class MockSupabaseUser extends Mock implements User {}

class MockSession extends Mock implements Session {}

class MockUserResponse extends Mock implements UserResponse {}

class FakeUserAttributes extends Fake implements UserAttributes {}

void main() {
  late MockSupabaseClient supabase;
  late MockGoTrueClient auth;
  late AuthRepository repository;
  setUpAll(() {
    registerFallbackValue(FakeUserAttributes());
  });

  setUp(() {
    supabase = MockSupabaseClient();
    auth = MockGoTrueClient();

    when(() => supabase.auth).thenReturn(auth);

    repository = AuthRepository(supabase);
  });

  group('AuthRepository - current user', () {
    test('hasCurrentUser returns true when user exists', () {
      when(() => auth.currentUser).thenReturn(MockSupabaseUser());

      expect(repository.hasCurrentUser, isTrue);
    });

    test('hasCurrentUser returns false when user is null', () {
      when(() => auth.currentUser).thenReturn(null);

      expect(repository.hasCurrentUser, isFalse);
    });

    test('currentUserId returns the current user ID', () {
      final user = MockSupabaseUser();

      when(() => auth.currentUser).thenReturn(user);
      when(() => user.id).thenReturn('user-123');

      expect(repository.currentUserId, 'user-123');
    });

    test('currentUserEmail returns the current email', () {
      final user = MockSupabaseUser();

      when(() => auth.currentUser).thenReturn(user);
      when(() => user.email).thenReturn('test@example.com');

      expect(repository.currentUserEmail, 'test@example.com');
    });

    test('currentUserId returns null when no user exists', () {
      when(() => auth.currentUser).thenReturn(null);

      expect(repository.currentUserId, isNull);
    });
  });

  group('AuthRepository - login', () {
    test('trims email and calls signInWithPassword', () async {
      final response = MockAuthResponse();

      when(
        () => auth.signInWithPassword(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).thenAnswer((_) async => response);

      final result = await repository.login(
        email: ' test@example.com ',
        password: 'password123',
      );

      expect(result, same(response));

      verify(
        () => auth.signInWithPassword(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('propagates authentication errors', () async {
      when(
        () => auth.signInWithPassword(
          email: 'test@example.com',
          password: 'wrong-password',
        ),
      ).thenThrow(Exception('Invalid credentials'));

      expect(
        () => repository.login(
          email: 'test@example.com',
          password: 'wrong-password',
        ),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('AuthRepository - signUp', () {
    test('trims email and sends full name as user metadata', () async {
      final response = MockAuthResponse();

      when(
        () => auth.signUp(
          email: 'new@example.com',
          password: 'password123',
          data: {'full_name': 'New Patient'},
        ),
      ).thenAnswer((_) async => response);

      final result = await repository.signUp(
        email: ' new@example.com ',
        password: 'password123',
        fullName: 'New Patient',
      );

      expect(result, same(response));

      verify(
        () => auth.signUp(
          email: 'new@example.com',
          password: 'password123',
          data: {'full_name': 'New Patient'},
        ),
      ).called(1);
    });

    test('propagates registration errors', () async {
      when(
        () => auth.signUp(
          email: 'new@example.com',
          password: 'password123',
          data: {'full_name': 'New Patient'},
        ),
      ).thenThrow(Exception('Registration failed'));

      expect(
        () => repository.signUp(
          email: 'new@example.com',
          password: 'password123',
          fullName: 'New Patient',
        ),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('AuthRepository - forgotPassword', () {
    test('trims email before requesting a reset', () async {
      when(
        () => auth.resetPasswordForEmail('test@example.com'),
      ).thenAnswer((_) async {});

      await repository.forgotPassword(email: ' test@example.com ');

      verify(() => auth.resetPasswordForEmail('test@example.com')).called(1);
    });

    test('propagates reset request errors', () async {
      when(
        () => auth.resetPasswordForEmail('test@example.com'),
      ).thenThrow(Exception('Network error'));

      expect(
        () => repository.forgotPassword(email: 'test@example.com'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('AuthRepository - verifyRecoveryCode', () {
    test('trims email and code and returns the response', () async {
      final response = MockAuthResponse();

      when(
        () => auth.verifyOTP(
          email: 'test@example.com',
          token: '123456',
          type: OtpType.recovery,
        ),
      ).thenAnswer((_) async => response);

      final result = await repository.verifyRecoveryCode(
        email: ' test@example.com ',
        code: ' 123456 ',
      );

      expect(result, same(response));

      verify(
        () => auth.verifyOTP(
          email: 'test@example.com',
          token: '123456',
          type: OtpType.recovery,
        ),
      ).called(1);
    });

    test('propagates verification errors', () async {
      when(
        () => auth.verifyOTP(
          email: 'test@example.com',
          token: '000000',
          type: OtpType.recovery,
        ),
      ).thenThrow(Exception('Invalid code'));

      expect(
        () => repository.verifyRecoveryCode(
          email: 'test@example.com',
          code: '000000',
        ),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('AuthRepository - resetPassword', () {
    test('updates the password and returns the response', () async {
      final response = MockUserResponse();

      when(
        () => auth.updateUser(any(that: isA<UserAttributes>())),
      ).thenAnswer((_) async => response);

      final result = await repository.resetPassword(password: 'newPassword123');

      expect(result, same(response));

      final captured =
          verify(
                () => auth.updateUser(captureAny(that: isA<UserAttributes>())),
              ).captured.single
              as UserAttributes;

      expect(captured.password, 'newPassword123');
    });

    test('propagates password update errors', () async {
      when(
        () => auth.updateUser(any(that: isA<UserAttributes>())),
      ).thenThrow(Exception('Update failed'));

      expect(
        () => repository.resetPassword(password: 'newPassword123'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('AuthRepository - logOut', () {
    test('calls signOut', () async {
      when(() => auth.signOut()).thenAnswer((_) async {});

      await repository.logOut();

      verify(() => auth.signOut()).called(1);
    });

    test('propagates signOut errors', () async {
      when(() => auth.signOut()).thenThrow(Exception('Sign out failed'));

      expect(() => repository.logOut(), throwsA(isA<Exception>()));
    });
  });

  group('AuthRepository - signInWithGoogle', () {
    test(
      'signInWithGoogle throws when Google web client ID is missing',
      () async {
        final repositoryWithoutGoogleId = AuthRepository(supabase, null, '');

        await expectLater(
          repositoryWithoutGoogleId.signInWithGoogle(),
          throwsA(isA<AuthException>()),
        );

        verifyNever(
          () => auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: any(named: 'idToken'),
            accessToken: any(named: 'accessToken'),
          ),
        );
      },
    );
  });
}
