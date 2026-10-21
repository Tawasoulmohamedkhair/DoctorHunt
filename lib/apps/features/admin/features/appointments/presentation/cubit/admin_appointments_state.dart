import 'package:equatable/equatable.dart';

abstract class AdminAppointmentsState extends Equatable {
  const AdminAppointmentsState();

  @override
  List<Object?> get props => [];
}

class AdminAppointmentsInitial extends AdminAppointmentsState {
  const AdminAppointmentsInitial();
}

class AdminAppointmentsLoading extends AdminAppointmentsState {
  const AdminAppointmentsLoading();
}

class AdminAppointmentsLoaded extends AdminAppointmentsState {
  const AdminAppointmentsLoaded(this.appointments);

  final List<Map<String, dynamic>> appointments;

  @override
  List<Object?> get props => [appointments];
}

class AdminAppointmentsError extends AdminAppointmentsState {
  const AdminAppointmentsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
