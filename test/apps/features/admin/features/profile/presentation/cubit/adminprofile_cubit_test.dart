import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:doctor_hunt/apps/features/admin/core/repository/admin_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/cubit/adminprofile_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/cubit/adminprofile_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:mocktail/mocktail.dart';

class MockAdminRepository extends Mock implements AdminRepository {}

void main() {
  late MockAdminRepository repository;
  late Completer<AdminModel> loadCompleter;
  const profile = AdminModel(
    fullName: 'Admin',
    email: 'admin@example.com',
    clinicLocation: 'Muscat',
  );
  setUpAll(() {
    registerFallbackValue(File('fallback_file.png'));
  });

  setUp(() {
    repository = MockAdminRepository();
    loadCompleter = Completer<AdminModel>();
  });

  blocTest<AdminProfileCubit, AdminProfileState>(
    'loads profile through loading and success with data',
    build: () {
      when(() => repository.getAdmin()).thenAnswer((_) async => profile);
      return AdminProfileCubit(repository);
    },
    act: (cubit) => cubit.loadProfile(),
    expect: () => [
      const AdminProfileState(status: AdminProfileStatus.loading),
      const AdminProfileState(status: AdminProfileStatus.success, profile: profile),
    ],
    verify: (_) => verify(() => repository.getAdmin()).called(1),
  );

  blocTest<AdminProfileCubit, AdminProfileState>(
    'emits failure when profile loading throws',
    build: () {
      when(() => repository.getAdmin()).thenThrow(Exception('load failed'));
      return AdminProfileCubit(repository);
    },
    act: (cubit) => cubit.loadProfile(),
    expect: () => [
      const AdminProfileState(status: AdminProfileStatus.loading),
      isA<AdminProfileState>().having(
        (state) => state.status, 'status', AdminProfileStatus.failure,
      ).having((state) => state.errorMessage, 'errorMessage', t.unableToLoadAdminProfile),
    ],
  );

  blocTest<AdminProfileCubit, AdminProfileState>(
    'saves profile and reloads the resulting data',
    build: () {
      when(() => repository.updateProfile(
        fullName: 'Updated', clinicLocation: 'Salalah', latitude: 17.0,
        longitude: 54.0,
      )).thenAnswer((_) async {});
      when(() => repository.getAdmin()).thenAnswer((_) async => profile);
      return AdminProfileCubit(repository);
    },
    act: (cubit) => cubit.updateProfile(
      fullName: 'Updated', clinicLocation: 'Salalah', latitude: 17.0,
      longitude: 54.0,
    ),
    expect: () => [
      const AdminProfileState(status: AdminProfileStatus.saving),
      const AdminProfileState(status: AdminProfileStatus.saved, profile: profile),
    ],
    verify: (_) {
      verify(() => repository.updateProfile(
        fullName: 'Updated', clinicLocation: 'Salalah', latitude: 17.0,
        longitude: 54.0,
      )).called(1);
      verify(() => repository.getAdmin()).called(1);
    },
  );

  blocTest<AdminProfileCubit, AdminProfileState>(
    'uploads an optional image before updating and reports save failure',
    build: () {
      when(() => repository.uploadProfileImage(
        file: any(named: 'file'), extension: 'png',
      )).thenAnswer((_) async => 'https://example.com/avatar.png');
      when(() => repository.updateProfile(
        fullName: 'Updated', clinicLocation: 'Salalah', latitude: null,
        longitude: null,
      )).thenThrow(Exception('save failed'));
      return AdminProfileCubit(repository);
    },
    act: (cubit) => cubit.updateProfile(
      fullName: 'Updated', clinicLocation: 'Salalah',
      imageFile: File('unused-test-image.png'), extension: 'png',
    ),
    expect: () => [
      const AdminProfileState(status: AdminProfileStatus.saving),
      isA<AdminProfileState>().having(
        (state) => state.status, 'status', AdminProfileStatus.failure,
      ).having((state) => state.errorMessage, 'errorMessage', t.unableToSaveAdminProfile),
    ],
    verify: (_) => verify(() => repository.uploadProfileImage(
      file: any(named: 'file'), extension: 'png',
    )).called(1),
  );

  blocTest<AdminProfileCubit, AdminProfileState>(
    'ignores a concurrent load while a load is in progress',
    build: () {
      when(() => repository.getAdmin()).thenAnswer((_) => loadCompleter.future);
      return AdminProfileCubit(repository);
    },
    act: (cubit) async {
      final firstLoad = cubit.loadProfile();
      await Future<void>.delayed(Duration.zero);
      await cubit.loadProfile();
      loadCompleter.complete(profile);
      await firstLoad;
    },
    expect: () => [
      const AdminProfileState(status: AdminProfileStatus.loading),
      const AdminProfileState(status: AdminProfileStatus.success, profile: profile),
    ],
    verify: (_) => verify(() => repository.getAdmin()).called(1),
  );

  test('does not emit a completion state after being closed during load', () async {
    final pendingLoad = Completer<AdminModel>();
    when(() => repository.getAdmin()).thenAnswer((_) => pendingLoad.future);
    final cubit = AdminProfileCubit(repository);
    final emitted = <AdminProfileState>[];
    final subscription = cubit.stream.listen(emitted.add);

    final loading = cubit.loadProfile();
    await Future<void>.delayed(Duration.zero);
    await cubit.close();
    pendingLoad.complete(profile);
    await loading;
    await subscription.cancel();

    expect(emitted, [const AdminProfileState(status: AdminProfileStatus.loading)]);
  });
}
