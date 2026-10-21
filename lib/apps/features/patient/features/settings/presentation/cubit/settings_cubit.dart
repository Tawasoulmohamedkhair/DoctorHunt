import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';

import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AuthRepository _authRepository;

  SettingsCubit(this._authRepository) : super(const SettingsState());

  Future<void> loadProfile() async {
    emit(
      state.copyWith(
        profileStatus: SettingsProfileStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      final user = await _authRepository.getCurrentUserProfile();

      if (isClosed) return;

      if (user == null) {
        emit(
          state.copyWith(
            profileStatus: SettingsProfileStatus.failure,
            errorMessage: 'Unable to load the current user profile.',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          profileStatus: SettingsProfileStatus.success,
          userName: user.fullName,
          userEmail: user.email,
          avatarUrl: user.avatarUrl,
          clearAvatarUrl: user.avatarUrl == null,
          clearErrorMessage: true,
        ),
      );
    } catch (error) {
      if (isClosed) return;

      emit(
        state.copyWith(
          profileStatus: SettingsProfileStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> logOut() async {
    if (state.isLoggingOut) return;

    emit(
      state.copyWith(
        logoutStatus: SettingsLogoutStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      await _authRepository.logOut();

      if (isClosed) return;

      emit(state.copyWith(logoutStatus: SettingsLogoutStatus.success));
    } catch (error) {
      if (isClosed) return;

      emit(
        state.copyWith(
          logoutStatus: SettingsLogoutStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void resetLogoutStatus() {
    emit(
      state.copyWith(
        logoutStatus: SettingsLogoutStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }
}
