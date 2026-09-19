import 'package:doctor_hunt/apps/Patient/features/finddoctor/data/find_doctor_model.dart';
import 'package:equatable/equatable.dart';

abstract class FindDoctorsState extends Equatable {
  const FindDoctorsState();
  @override
  List<Object?> get props => [];
}

class FindDoctorsInitial extends FindDoctorsState {}

class FindDoctorsLoading extends FindDoctorsState {}

class FindDoctorsLoaded extends FindDoctorsState {
final List<FindDoctorModel> doctors;  final String query;

  const FindDoctorsLoaded({
    required this.doctors,
    required this.query,
  });

  @override
  List<Object?> get props => [doctors, query];
}

class FindDoctorsError extends FindDoctorsState {
  final String message;
  const FindDoctorsError(this.message);

  @override
  List<Object?> get props => [message];
}