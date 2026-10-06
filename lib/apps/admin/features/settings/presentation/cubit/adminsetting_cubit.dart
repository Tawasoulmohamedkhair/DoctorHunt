import 'package:doctor_hunt/apps/admin/data/repository/admin_repository.dart';
import 'package:doctor_hunt/apps/admin/features/settings/presentation/cubit/adminsetting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSettingsCubit extends Cubit<AdminSettingsState> {
  final AdminRepository _repository;

  AdminSettingsCubit(this._repository) : super(const AdminSettingsState());

  Future<void> loadAdminSettings() async {
    emit(
      state.copyWith(status: AdminSettingsStatus.loading, errorMessage: null),
    );

    try {
      final admin = await _repository.getAdmin();

      emit(state.copyWith(status: AdminSettingsStatus.success, admin: admin));
    } catch (e) {
      emit(
        state.copyWith(
          status: AdminSettingsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
