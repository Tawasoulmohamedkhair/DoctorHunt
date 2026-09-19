// doctor_details_state.dart
import 'package:doctor_hunt/apps/Patient/features/doctordetails/data/model/doctor_details_model.dart';
import 'package:equatable/equatable.dart';

abstract class DoctorDetailsState extends Equatable {
  const DoctorDetailsState();
  @override
  List<Object?> get props => [];
}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsLoaded extends DoctorDetailsState {
  final DoctorDetailsModel doctor;
  const DoctorDetailsLoaded(this.doctor);

  @override
  List<Object?> get props => [doctor];
}

class DoctorDetailsError extends DoctorDetailsState {
  final String message;
  const DoctorDetailsError(this.message);
}
