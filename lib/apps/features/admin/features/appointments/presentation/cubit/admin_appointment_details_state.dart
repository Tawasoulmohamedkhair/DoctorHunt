import 'package:equatable/equatable.dart';

abstract class AdminAppointmentDetailsState extends Equatable {
  const AdminAppointmentDetailsState();

  @override
  List<Object?> get props => [];
}

class AdminAppointmentDetailsInitial extends AdminAppointmentDetailsState {
  const AdminAppointmentDetailsInitial();
}

class AdminAppointmentDetailsLoading extends AdminAppointmentDetailsState {
  const AdminAppointmentDetailsLoading();
}

class AdminAppointmentDetailsLoaded extends AdminAppointmentDetailsState {
  const AdminAppointmentDetailsLoaded(this.appointment);

  final Map<String, dynamic> appointment;

  @override
  List<Object?> get props => [appointment];
}

class AdminAppointmentDetailsActionLoading
    extends AdminAppointmentDetailsState {
  const AdminAppointmentDetailsActionLoading(this.appointment);

  final Map<String, dynamic> appointment;

  @override
  List<Object?> get props => [appointment];
}

class AdminAppointmentDetailsError extends AdminAppointmentDetailsState {
  const AdminAppointmentDetailsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
