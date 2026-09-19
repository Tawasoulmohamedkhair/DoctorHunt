// cubit/home_state.dart
import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DoctorModel> liveDoctors;
  final List<DoctorModel> popularDoctors;
  final List<DoctorModel> featuredDoctors;

  const HomeLoaded({
    required this.liveDoctors,
    required this.popularDoctors,
    required this.featuredDoctors,
  });

  @override
  List<Object?> get props => [liveDoctors, popularDoctors, featuredDoctors];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}