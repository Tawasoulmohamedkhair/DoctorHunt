import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';

import 'admin_appointments_state.dart';

class AdminAppointmentsCubit extends Cubit<AdminAppointmentsState> {
  AdminAppointmentsCubit(this._repository)
    : super(const AdminAppointmentsInitial());

  final AppointmentRepository _repository;

  Future<void> getAdminAppointments() async {
    emit(const AdminAppointmentsLoading());

    try {
      final appointments = await _repository.getAdminAppointments();
      emit(AdminAppointmentsLoaded(appointments));
    } catch (e) {
      
      emit(AdminAppointmentsError(t.unableToLoadAppointments));
    }
  }
  
Future<void> cancelAppointment(String appointmentId) async {
    try {
      await _repository.cancelAdminAppointment(appointmentId);
      await getAdminAppointments();
    } catch (e) {
     
      emit(AdminAppointmentsError(t.unableToCancelAppointment));
    }
  }

  Future<void> completeAppointment(String appointmentId) async {
    try {
      await _repository.completeAdminAppointment(appointmentId);
      await getAdminAppointments();
    } catch (e) {

      emit(AdminAppointmentsError(t.unableToCompleteAppointment));
    }
  }

}
