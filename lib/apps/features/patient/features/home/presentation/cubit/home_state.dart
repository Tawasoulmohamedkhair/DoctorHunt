
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<DoctorModel> popularDoctors;
  final List<DoctorModel> topRatedDoctors;

  const HomeLoaded({
    required this.popularDoctors,
    required this.topRatedDoctors,
  });

  @override
  List<Object?> get props => [popularDoctors, topRatedDoctors];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}