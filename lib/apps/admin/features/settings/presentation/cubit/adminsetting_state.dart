import 'package:doctor_hunt/apps/admin/data/model/admin_model.dart';
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
  }) {
    return AdminSettingsState(
      status: status ?? this.status,
      admin: admin ?? this.admin,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, admin, errorMessage];
}
