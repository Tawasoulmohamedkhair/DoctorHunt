import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/data/Repository/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthCubit cubit;
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    cubit = AuthCubit(repository);
  });

  tearDown(() async {
    await cubit.close();
  });

  group('signUp', () {
    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, signUpSuccess] when signUp succeeds',
      build: () {
        final user = User(
          id: 'test-user-id',
          aud: 'authenticated',
          role: 'authenticated',
          email: 'a@test.com',
          appMetadata: {},
          userMetadata: {},
          createdAt: DateTime.now().toIso8601String(),
        );

        when(
          () => repository.signUp(
            fullName: any(named: 'fullName'),
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => AuthResponse(user: user));

        return cubit;
      },
      act: (cubit) => cubit.signUp(
        fullName: 'Ahmed',
        email: 'a@test.com',
        password: 'Aa@12345',
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
    );

    blocTest<AuthCubit, AuthCubitState>(
      'emits [loading, failure] when signUp fails',
      build: () {
        when(
          () => repository.signUp(
            fullName: any(named: 'fullName'),
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception('error'));

        return cubit;
      },
      act: (cubit) => cubit.signUp(
        fullName: 'Ahmed',
        email: 'a@test.com',
        password: 'Aa@12345',
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
          AuthStatus.failure,
        ),
      ],
    );
  });
}
