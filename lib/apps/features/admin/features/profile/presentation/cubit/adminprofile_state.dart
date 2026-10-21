import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:equatable/equatable.dart';

enum AdminProfileStatus { initial, loading, success, saving, saved, failure }

class AdminProfileState extends Equatable {
  final AdminProfileStatus status;
  final AdminModel? profile;
  final String? errorMessage;

  const AdminProfileState({
    this.status = AdminProfileStatus.initial,
    this.profile,
    this.errorMessage,
  });

  AdminProfileState copyWith({
    AdminProfileStatus? status,
    AdminModel? profile,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return AdminProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, profile, errorMessage];
}
