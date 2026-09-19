
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          status: AuthStatus.success,
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

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));

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

  Future<void> verifyCode({
    required String code,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          status: AuthStatus.verifyCodeSuccess,
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

  Future<void> resetPassword({
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));

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
