import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository authRepository;

  const testUser = UserModel(
    id: 'user-1',
    fullName: 'Mohamed Ahmed',
    email: 'mohamed@example.com',
    phone: '12345678',
    avatarUrl: 'https://example.com/avatar.png',
    role: 'patient',
    isActive: true,
  );

  setUp(() {
    authRepository = MockAuthRepository();
  });

  group('SettingsCubit - loadProfile', () {
    blocTest<SettingsCubit, SettingsState>(
      'emits loading then success when profile loads successfully',
      build: () {
        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => testUser);

        return SettingsCubit(authRepository);
      },
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        isA<SettingsState>()
            .having(
              (state) => state.profileStatus,
              'profileStatus',
              SettingsProfileStatus.loading,
            )
            .having((state) => state.errorMessage, 'errorMessage', isNull),
        isA<SettingsState>()
            .having(
              (state) => state.profileStatus,
              'profileStatus',
              SettingsProfileStatus.success,
            )
            .having((state) => state.userName, 'userName', 'Mohamed Ahmed')
            .having(
              (state) => state.userEmail,
              'userEmail',
              'mohamed@example.com',
            )
            .having(
              (state) => state.avatarUrl,
              'avatarUrl',
              'https://example.com/avatar.png',
            )
            .having((state) => state.errorMessage, 'errorMessage', isNull),
      ],
      verify: (_) {
        verify(() => authRepository.getCurrentUserProfile()).called(1);
      },
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits failure when profile is null',
      build: () {
        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenAnswer((_) async => null);

        return SettingsCubit(authRepository);
      },
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.profileStatus,
          'profileStatus',
          SettingsProfileStatus.loading,
        ),
        isA<SettingsState>()
            .having(
              (state) => state.profileStatus,
              'profileStatus',
              SettingsProfileStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Unable to load the current user profile.',
            ),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits failure when loading profile throws an exception',
      build: () {
        when(
          () => authRepository.getCurrentUserProfile(),
        ).thenThrow(Exception('Profile loading failed'));

        return SettingsCubit(authRepository);
      },
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.profileStatus,
          'profileStatus',
          SettingsProfileStatus.loading,
        ),
        isA<SettingsState>()
            .having(
              (state) => state.profileStatus,
              'profileStatus',
              SettingsProfileStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Profile loading failed',
            ),
      ],
    );
  });

  group('SettingsCubit - logOut', () {
    blocTest<SettingsCubit, SettingsState>(
      'emits loading then success when logout succeeds',
      build: () {
        when(() => authRepository.logOut()).thenAnswer((_) async {});

        return SettingsCubit(authRepository);
      },
      act: (cubit) => cubit.logOut(),
      expect: () => [
        isA<SettingsState>()
            .having(
              (state) => state.logoutStatus,
              'logoutStatus',
              SettingsLogoutStatus.loading,
            )
            .having((state) => state.errorMessage, 'errorMessage', isNull),
        isA<SettingsState>().having(
          (state) => state.logoutStatus,
          'logoutStatus',
          SettingsLogoutStatus.success,
        ),
      ],
      verify: (_) {
        verify(() => authRepository.logOut()).called(1);
      },
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits failure when logout throws an exception',
      build: () {
        when(
          () => authRepository.logOut(),
        ).thenThrow(Exception('Logout failed'));

        return SettingsCubit(authRepository);
      },
      act: (cubit) => cubit.logOut(),
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.logoutStatus,
          'logoutStatus',
          SettingsLogoutStatus.loading,
        ),
        isA<SettingsState>()
            .having(
              (state) => state.logoutStatus,
              'logoutStatus',
              SettingsLogoutStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Logout failed',
            ),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'resets logout status and clears error after failure',
      build: () {
        when(
          () => authRepository.logOut(),
        ).thenThrow(Exception('Logout failed'));

        return SettingsCubit(authRepository);
      },
      act: (cubit) async {
        await cubit.logOut();
        cubit.resetLogoutStatus();
      },
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.logoutStatus,
          'logoutStatus',
          SettingsLogoutStatus.loading,
        ),
        isA<SettingsState>()
            .having(
              (state) => state.logoutStatus,
              'logoutStatus',
              SettingsLogoutStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              'Exception: Logout failed',
            ),
        isA<SettingsState>()
            .having(
              (state) => state.logoutStatus,
              'logoutStatus',
              SettingsLogoutStatus.initial,
            )
            .having((state) => state.errorMessage, 'errorMessage', isNull),
      ],
    );

    test('does not call logout again while logout is in progress', () async {
      final completer = Completer<void>();

      when(() => authRepository.logOut()).thenAnswer((_) => completer.future);

      final cubit = SettingsCubit(authRepository);

      final firstLogout = cubit.logOut();
      await Future<void>.delayed(Duration.zero);

      await cubit.logOut();

      verify(() => authRepository.logOut()).called(1);

      completer.complete();
      await firstLogout;

      expect(cubit.state.logoutStatus, SettingsLogoutStatus.success);

      await cubit.close();
    });
  });
}
