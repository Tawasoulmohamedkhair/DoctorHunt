import 'dart:async';
import 'package:doctor_hunt/apps/Patient/features/auth/data/Repository/auth_repo.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthCubitState());

  // ---------------- LOGIN ----------------

  Future<void> login({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      final response = await _authRepository.login(
        email: email,
        password: password,
      );

      if (response.user == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: t.failedLogin,
          ),
        );
        return;
      }

      final userProfile = await _authRepository.getCurrentUserProfile();

      if (userProfile == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: 'User profile not found.',
          ),
        );
        return;
      }

      // Verify that the account belongs to the selected role.
      if (userProfile.role != role.name) {
        await _authRepository.logOut();

        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: role == UserRole.admin
                ? 'This account is not registered as an admin.'
                : 'This account is not registered as a patient.',
          ),
        );
        return;
      }

      emit(state.copyWith(status: AuthStatus.success, user: userProfile));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  // ---------------- SIGN UP ----------------

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      final response = await _authRepository.signUp(
        email: email,
        password: password,
        fullName: fullName,
      );

      if (response.user != null) {
        emit(state.copyWith(status: AuthStatus.signUpSuccess));
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: t.failedSignup,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  // ---------------- GOOGLE ----------------

  Future<void> signInWithGoogle({required UserRole role}) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      final response = await _authRepository.signInWithGoogle();

      if (response.user == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: t.googleSigninFailed,
          ),
        );
        return;
      }

      final userProfile = await _authRepository.getCurrentUserProfile();

      if (userProfile == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: 'User profile not found.',
          ),
        );
        return;
      }

      // Verify that the Google account belongs to the selected role.
      if (userProfile.role != role.name) {
        await _authRepository.logOut();

        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: role == UserRole.admin
                ? 'This account is not registered as an admin.'
                : 'This account is not registered as a patient.',
          ),
        );
        return;
      }

      emit(state.copyWith(status: AuthStatus.success, user: userProfile));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  // ---------------- FORGOT PASSWORD ----------------

  Future<void> forgotPassword({required String email}) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      await _authRepository.forgotPassword(email: email.trim());

      emit(state.copyWith(status: AuthStatus.forgotPasswordSuccess));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  // ---------------- VERIFY OTP ----------------

  Future<void> verifyRecoveryCode({
    required String email,
    required String code,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      final response = await _authRepository.verifyRecoveryCode(
        email: email.trim(),
        code: code.trim(),
      );

      if (response.session != null) {
        emit(state.copyWith(status: AuthStatus.verifyCodeSuccess));
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: t.otpnorecovery,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  // ---------------- RESET PASSWORD ----------------

  Future<void> resetPassword({required String password}) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    try {
      await _authRepository.resetPassword(password: password);

      emit(state.copyWith(status: AuthStatus.resetPasswordSuccess));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }
}
