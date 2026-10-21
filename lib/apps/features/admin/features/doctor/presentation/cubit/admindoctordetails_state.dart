
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:equatable/equatable.dart';

enum AdminDoctorDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class AdminDoctorDetailsState extends Equatable {
  final AdminDoctorDetailsStatus status;
  final DoctorModel? doctor;
  final String? errorMessage;

  const AdminDoctorDetailsState({
    this.status = AdminDoctorDetailsStatus.initial,
    this.doctor,
    this.errorMessage,
  });

  AdminDoctorDetailsState copyWith({
    AdminDoctorDetailsStatus? status,
    DoctorModel? doctor,
    String? errorMessage,
    bool clearDoctor = false,
    bool clearErrorMessage = false,
  }) {
    return AdminDoctorDetailsState(
      status: status ?? this.status,
      doctor: clearDoctor ? null : doctor ?? this.doctor,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        doctor,
        errorMessage,
      ];
}
