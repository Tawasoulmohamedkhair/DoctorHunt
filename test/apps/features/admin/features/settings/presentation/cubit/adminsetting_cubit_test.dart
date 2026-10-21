import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:doctor_hunt/apps/features/admin/core/repository/admin_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/settings/presentation/cubit/adminsetting_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/settings/presentation/cubit/adminsetting_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdminRepository extends Mock implements AdminRepository {}

void main() {
  late MockAdminRepository repository;
  const admin = AdminModel(
    fullName: 'Admin',
    email: 'admin@example.com',
    clinicLocation: 'Muscat',
  );

  setUp(() => repository = MockAdminRepository());

  blocTest<AdminSettingsCubit, AdminSettingsState>(
    'loads admin settings through loading and success with data',
    build: () {
      when(() => repository.getAdmin()).thenAnswer((_) async => admin);
      return AdminSettingsCubit(repository);
    },
    act: (cubit) => cubit.loadAdminSettings(),
    expect: () => [
      const AdminSettingsState(status: AdminSettingsStatus.loading),
      const AdminSettingsState(status: AdminSettingsStatus.success, admin: admin),
    ],
    verify: (_) => verify(() => repository.getAdmin()).called(1),
  );

  blocTest<AdminSettingsCubit, AdminSettingsState>(
    'emits failure when settings load throws',
    build: () {
      when(() => repository.getAdmin()).thenThrow(Exception('load failed'));
      return AdminSettingsCubit(repository);
    },
    act: (cubit) => cubit.loadAdminSettings(),
    expect: () => [
      const AdminSettingsState(status: AdminSettingsStatus.loading),
      isA<AdminSettingsState>().having(
        (state) => state.status, 'status', AdminSettingsStatus.failure,
      ),
    ],
  );
}
