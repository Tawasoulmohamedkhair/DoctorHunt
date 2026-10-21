import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:equatable/equatable.dart';

enum AdminSettingsStatus { initial, loading, success, failure }

class AdminSettingsState extends Equatable {
  final AdminSettingsStatus status;
  final AdminModel? admin;
  final String? errorMessage;

  const AdminSettingsState({
    this.status = AdminSettingsStatus.initial,
    this.admin,
    this.errorMessage,
  });

  AdminSettingsState copyWith({
    AdminSettingsStatus? status,
    AdminModel? admin,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return AdminSettingsState(
      status: status ?? this.status,
      admin: admin ?? this.admin,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, admin, errorMessage];
}
