import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';

import 'admin_appointment_details_state.dart';

class AdminAppointmentDetailsCubit extends Cubit<AdminAppointmentDetailsState> {
  AdminAppointmentDetailsCubit(this._repository)
    : super(const AdminAppointmentDetailsInitial());

  final AppointmentRepository _repository;

  Future<void> loadAppointment(String appointmentId) async {
    emit(const AdminAppointmentDetailsLoading());

    try {
      final appointment = await _repository.getAdminAppointmentById(
        appointmentId,
      );

      if (appointment == null) {
        emit(AdminAppointmentDetailsError(t.appointmentNotFound));
        return;
      }

      emit(AdminAppointmentDetailsLoaded(appointment));
    } catch (e, stackTrace) {
      debugPrint('Load admin appointment details error: $e');
      debugPrintStack(stackTrace: stackTrace);
      emit(AdminAppointmentDetailsError(t.unableToLoadAppointmentDetails));
    }
  }

  Future<void> cancelAppointment(String appointmentId) async {
    await _performAction(
      appointmentId,
      () => _repository.cancelAdminAppointment(appointmentId),
    );
  }

  Future<void> completeAppointment(String appointmentId) async {
    await _performAction(
      appointmentId,
      () => _repository.completeAdminAppointment(appointmentId),
    );
  }

  Future<void> _performAction(
    String appointmentId,
    Future<void> Function() action,
  ) async {
    final currentState = state;

    if (currentState is! AdminAppointmentDetailsLoaded) return;

    if (currentState.appointment['status'] != 'upcoming') return;

    emit(AdminAppointmentDetailsActionLoading(currentState.appointment));

    try {
      await action();
      await loadAppointment(appointmentId);
    } catch (e, stackTrace) {
      debugPrint('Admin appointment action error: $e');
      debugPrintStack(stackTrace: stackTrace);
      emit(AdminAppointmentDetailsError(t.operationfailed));
    }
  }
}
