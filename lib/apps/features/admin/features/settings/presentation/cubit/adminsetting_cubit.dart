import 'package:doctor_hunt/apps/features/admin/core/repository/admin_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/settings/presentation/cubit/adminsetting_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSettingsCubit extends Cubit<AdminSettingsState> {
  final AdminRepository _repository;

  AdminSettingsCubit(this._repository) : super(const AdminSettingsState());

  Future<void> loadAdminSettings() async {
    if (isClosed) return;

    emit(
      state.copyWith(
        status: AdminSettingsStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      final admin = await _repository.getAdmin();

      if (isClosed) return;

      emit(state.copyWith(status: AdminSettingsStatus.success, admin: admin));
    } catch (e) {
      if (isClosed) return;

      

      emit(
        state.copyWith(
          status: AdminSettingsStatus.failure,
          errorMessage: t.unableToLoadAdminInformation,
        ),
      );
    }
  }
}
