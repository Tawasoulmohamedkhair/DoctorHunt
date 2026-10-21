import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:equatable/equatable.dart';

abstract class DoctorDetailsState extends Equatable {
  const DoctorDetailsState();

  @override
  List<Object?> get props => [];
}

class DoctorDetailsInitial extends DoctorDetailsState {
  const DoctorDetailsInitial();
}

class DoctorDetailsLoading extends DoctorDetailsState {
  const DoctorDetailsLoading();
}

class DoctorDetailsLoaded extends DoctorDetailsState {
  final DoctorModel doctor;
  final List<String> services;
  final bool isFavorite;
  final List<Map<String, dynamic>> reviews;

  const DoctorDetailsLoaded({
    required this.doctor,
    required this.services,
    this.isFavorite = false,
    this.reviews = const [],
  });

  @override
  List<Object?> get props => [doctor, services, isFavorite, reviews];
}

class DoctorDetailsError extends DoctorDetailsState {
  final String message;

  const DoctorDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
