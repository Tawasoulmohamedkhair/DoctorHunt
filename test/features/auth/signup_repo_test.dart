
import 'package:doctor_hunt/apps/Patient/features/auth/data/Repository/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

void main() {
  late MockSupabaseClient supabase;
  late MockGoTrueClient auth;
  late AuthRepository repository;

  setUp(() {
    supabase = MockSupabaseClient();
    auth = MockGoTrueClient();

    repository = AuthRepository(supabase);

    when(() => supabase.auth).thenReturn(auth);
  });

  group('AuthRepository - signUp', () {
    test('returns AuthResponse when signUp succeeds', () async {
      final user = User(
        id: 'test-user-id',
        aud: 'authenticated',
        role: 'authenticated',
        email: 'ahmed@test.com',
        appMetadata: {},
        userMetadata: {
          'full_name': 'Ahmed Ali',
        },
        createdAt: DateTime.now().toIso8601String(),
      );

      final response = AuthResponse(
        user: user,
      );

      when(
        () => auth.signUp(
          email: 'ahmed@test.com',
          password: 'Aa@12345',
          data: {
            'full_name': 'Ahmed Ali',
          },
        ),
      ).thenAnswer(
        (_) async => response,
      );

      final result = await repository.signUp(
        email: 'ahmed@test.com',
        password: 'Aa@12345',
        fullName: 'Ahmed Ali',
      );

      expect(result.user, isNotNull);
      expect(result.user!.email, 'ahmed@test.com');

      verify(
        () => auth.signUp(
          email: 'ahmed@test.com',
          password: 'Aa@12345',
          data: {
            'full_name': 'Ahmed Ali',
          },
        ),
      ).called(1);
    });

    test('trims email before calling Supabase', () async {
      final user = User(
        id: 'test-user-id',
        aud: 'authenticated',
        role: 'authenticated',
        email: 'ahmed@test.com',
        appMetadata: {},
        userMetadata: {},
        createdAt: DateTime.now().toIso8601String(),
      );

      when(
        () => auth.signUp(
          email: 'ahmed@test.com',
          password: 'Aa@12345',
          data: {
            'full_name': 'Ahmed Ali',
          },
        ),
      ).thenAnswer(
        (_) async => AuthResponse(user: user),
      );

      await repository.signUp(
        email: '  ahmed@test.com  ',
        password: 'Aa@12345',
        fullName: 'Ahmed Ali',
      );

      verify(
        () => auth.signUp(
          email: 'ahmed@test.com',
          password: 'Aa@12345',
          data: {
            'full_name': 'Ahmed Ali',
          },
        ),
      ).called(1);
    });

    test('throws exception when signUp fails', () async {
      when(
        () => auth.signUp(
          email: 'ahmed@test.com',
          password: 'Aa@12345',
          data: {
            'full_name': 'Ahmed Ali',
          },
        ),
      ).thenThrow(
        Exception('Sign up failed'),
      );

      expect(
        () => repository.signUp(
          email: 'ahmed@test.com',
          password: 'Aa@12345',
          fullName: 'Ahmed Ali',
        ),
        throwsException,
      );
    });
  });
}
