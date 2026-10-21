import 'package:doctor_hunt/apps/features/patient/features/appointments/data/model/appointment_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object?> get props => [];
}

class AppointmentInitial extends AppointmentState {
  const AppointmentInitial();
}

class AppointmentLoading extends AppointmentState {
  const AppointmentLoading();
}

class AppointmentLoaded extends AppointmentState {
  const AppointmentLoaded(this.appointments);

  final List<AppointmentModel> appointments;

  @override
  List<Object?> get props => [appointments];
}

class AppointmentError extends AppointmentState {
  const AppointmentError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
