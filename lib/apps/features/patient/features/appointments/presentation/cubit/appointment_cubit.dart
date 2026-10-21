import 'package:doctor_hunt/apps/core/error/app_error.dart';
import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this._repository) : super(const AppointmentInitial());

  final AppointmentRepository _repository;

  Future<void> getMyAppointments() async {
    if (isClosed) return;
    emit(const AppointmentLoading());

    try {
      final appointments = await _repository.getMyAppointments();
      if (isClosed) return;
      emit(AppointmentLoaded(appointments));
    } catch (e, stackTrace) {
      if (isClosed) return;
      final failure = mapAppFailure(e, stackTrace);
      failure.logDiagnostic('Load appointments');
      emit(AppointmentError(failure.userMessage));
    }
  }

  Future<void> cancelAppointment(String appointmentId) async {
    if (isClosed) return;
    try {
      await _repository.cancelPatientAppointment(appointmentId);
      if (isClosed) return;
      await getMyAppointments();
    } catch (e, stackTrace) {
      if (isClosed) return;
      final failure = mapAppFailure(e, stackTrace);
      failure.logDiagnostic('Cancel appointment');
      emit(AppointmentError(failure.userMessage));
    }
  }

  Future<void> submitReview({
    required String appointmentId,
    required String doctorId,
    required int rating,
    String? comment,
  }) async {
    if (isClosed) return;
    try {
      await _repository.submitReview(
        appointmentId: appointmentId,
        doctorId: doctorId,
        rating: rating,
        comment: comment,
      );
    } catch (e, stackTrace) {
      if (isClosed) return;
      final failure = mapAppFailure(e, stackTrace);
      failure.logDiagnostic('Submit appointment review');
      emit(AppointmentError(failure.userMessage));
    }
  }

  Future<void> rateAppointment({
    required String appointmentId,
    required String doctorId,
    required int rating,
    String? comment,
  }) async {
    if (isClosed) return;
    try {
      await _repository.submitReview(
        appointmentId: appointmentId,
        doctorId: doctorId,
        rating: rating,
        comment: comment,
      );

      if (isClosed) return;
      await getMyAppointments();
    } catch (e, stackTrace) {
      if (isClosed) return;
      final failure = mapAppFailure(e, stackTrace);
      failure.logDiagnostic('Submit appointment review');
      emit(AppointmentError(failure.userMessage));
    }
  }
}
