import 'package:equatable/equatable.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  failure,
  forgotPasswordSuccess,
  verifyCodeSuccess,
  resetPasswordSuccess,
  signUpSuccess,
}

class AuthCubitState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;

  const AuthCubitState({this.status = AuthStatus.initial, this.errorMessage});

  AuthCubitState copyWith({AuthStatus? status, String? errorMessage}) {
    return AuthCubitState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
