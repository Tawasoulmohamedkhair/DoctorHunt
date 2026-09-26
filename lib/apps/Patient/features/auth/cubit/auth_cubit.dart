import 'dart:async';

import 'package:doctor_hunt/apps/Patient/features/auth/data/Repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit_state.dart';
class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthCubitState());

  // ---------------- LOGIN ----------------

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final response = await _authRepository.login(
        email: email,
        password: password,
      );

      if (response.user != null) {
        emit(
          state.copyWith(
            status: AuthStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: 'فشل تسجيل الدخول',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ---------------- SIGN UP ----------------

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final response = await _authRepository.signUp(
        email: email,
        password: password,
        fullName: fullName,
      );

      if (response.user != null) {
        emit(
          state.copyWith(
            status: AuthStatus.signUpSuccess,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: 'فشل إنشاء الحساب',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ---------------- GOOGLE ----------------

  Future<void> signInWithGoogle() async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final response = await _authRepository.signInWithGoogle();

      if (response.user != null) {
        emit(
          state.copyWith(
            status: AuthStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: 'Google sign in failed',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ---------------- FORGOT PASSWORD ----------------

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      await _authRepository.forgotPassword(
        email: email.trim(),
      );

      emit(
        state.copyWith(
          status: AuthStatus.forgotPasswordSuccess,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ---------------- VERIFY OTP ----------------

  Future<void> verifyRecoveryCode({
    required String email,
    required String code,
  }) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final response = await _authRepository.verifyRecoveryCode(
        email: email.trim(),
        code: code.trim(),
      );

      

      if (response.session != null) {
        emit(
          state.copyWith(
            status: AuthStatus.verifyCodeSuccess,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage:
                'OTP verified but no recovery session found.',
          ),
        );
      }
    } catch (e) {

      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ---------------- RESET PASSWORD ----------------

  Future<void> resetPassword({
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      await _authRepository.resetPassword(
        password: password,
      );

      emit(
        state.copyWith(
          status: AuthStatus.resetPasswordSuccess,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

