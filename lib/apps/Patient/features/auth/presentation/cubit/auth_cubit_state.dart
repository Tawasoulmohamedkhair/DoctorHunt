// import 'package:equatable/equatable.dart';

// enum AuthStatus {
//   initial,
//   loading,
//   success,
//   failure,
//   forgotPasswordSuccess,
//   verifyCodeSuccess,
//   resetPasswordSuccess,
//   signUpSuccess,
// }

// class AuthCubitState extends Equatable {
//   final AuthStatus status;
//   final String? errorMessage;

//   const AuthCubitState({this.status = AuthStatus.initial, this.errorMessage});

//   AuthCubitState copyWith({AuthStatus? status, String? errorMessage}) {
//     return AuthCubitState(
//       status: status ?? this.status,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }

//   @override
//   List<Object?> get props => [status, errorMessage];
// }

import 'package:doctor_hunt/apps/Patient/features/auth/data/models/user_model.dart';
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
  final UserModel? user;

  const AuthCubitState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.user,
  });

  AuthCubitState copyWith({
    AuthStatus? status,
    String? errorMessage,
    UserModel? user,
  }) {
    return AuthCubitState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, user];
}
