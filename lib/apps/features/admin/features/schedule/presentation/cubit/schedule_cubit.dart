import 'package:doctor_hunt/apps/features/admin/features/schedule/data/repository/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit(this._repository) : super(const ScheduleState());

  final ScheduleRepository _repository;

  Future<void> loadMonth({
    required String doctorId,
    required DateTime month,
  }) async {
    final selectedMonth = DateTime(month.year, month.month, 1);

    emit(
      state.copyWith(
        status: ScheduleStatus.loading,
        selectedMonth: selectedMonth,
        clearError: true,
        clearSchedule: true,
        availability: [],
      ),
    );

    try {
      final results = await Future.wait([
        _repository.getDoctorServices(doctorId),
        _repository.getScheduleForMonth(
          doctorId: doctorId,
          month: selectedMonth,
        ),
        _repository.getClinicOperatingHours(),
      ]);

      final services = List<Map<String, dynamic>>.from(results[0] as List);

      final schedule = results[1] as Map<String, dynamic>?;

      final operatingHours = List<Map<String, dynamic>>.from(
        results[2] as List,
      );

      List<Map<String, dynamic>> availability = [];

      if (schedule != null) {
        availability = await _repository.getAvailabilityForSchedule(
          schedule['id'] as String,
        );
      }

      emit(
        state.copyWith(
          status: ScheduleStatus.loaded,
          selectedMonth: selectedMonth,
          services: services,
          schedule: schedule,
          availability: availability,
          operatingHours: operatingHours,
          clearSchedule: schedule == null,
          clearError: true,
        ),
      );
    } catch (error, stackTrace) {
      debugPrint('Load schedule error: $error');
      debugPrintStack(stackTrace: stackTrace);
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.unableToLoadSchedule,
        ),
      );
    }
  }

  Future<void> saveDraft({
    required String doctorId,
    required DateTime month,
    required List<Map<String, dynamic>> availabilityRows,
  }) async {
    if (state.isPublished) {
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage:
              t.publishedScheduleRevisionRequired,
        ),
      );
      return;
    }

    emit(state.copyWith(status: ScheduleStatus.saving, clearError: true));

    try {
      final monthStart = DateTime(month.year, month.month, 1);

      // Prepare a clean payload for the database.
      final rowsToSave = availabilityRows.map((row) {
        return <String, dynamic>{
          'medical_service_id': row['medical_service_id'],
          'work_date': row['work_date'].toString().substring(0, 10),
          'shift': row['shift'],
          'start_time': row['start_time'].toString(),
          'end_time': row['end_time'].toString(),
          'slot_duration_minutes': row['slot_duration_minutes'] ?? 30,
        };
      }).toList();

      // Prevent accidental duplicate dates before calling the database.
      final dates = rowsToSave
          .map((row) => row['work_date'] as String)
          .toList();

      if (dates.toSet().length != dates.length) {
        emit(
          state.copyWith(
            status: ScheduleStatus.failure,
            errorMessage:
                t.onlyOneAvailabilityPerDate,
          ),
        );
        return;
      }

     
      final scheduleId = await _repository.saveDraft(
        doctorId: doctorId,
        month: monthStart,
        availabilityRows: rowsToSave,
      );


      await loadMonth(doctorId: doctorId, month: monthStart);

      if (state.status == ScheduleStatus.failure) {
        return;
      }



      emit(
        state.copyWith(
          status: ScheduleStatus.success,
          schedule: {...?state.schedule, 'id': scheduleId, 'status': 'draft'},
          clearError: true,
        ),
      );
    } catch (error, stackTrace) {
      debugPrint('Save draft error: $error');
      debugPrintStack(stackTrace: stackTrace);

      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.unableToSaveScheduleDraft,
        ),
      );
    }
  }

  Future<void> publishSchedule({
    required String doctorId,
    required DateTime month,
  }) async {
    final schedule = state.schedule;

    if (schedule == null || schedule['status'] != 'draft') {
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.loadSavedDraftBeforePublishing,
        ),
      );
      return;
    }

    if (state.availability.isEmpty) {
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.addWorkingDayBeforePublishing,
        ),
      );
      return;
    }

    emit(state.copyWith(status: ScheduleStatus.publishing, clearError: true));

    try {
      await _repository.publishSchedule(schedule['id'] as String);

      await loadMonth(doctorId: doctorId, month: month);

      if (state.status == ScheduleStatus.failure) return;

      emit(state.copyWith(status: ScheduleStatus.success, clearError: true));
    } catch (error, stackTrace) {
      debugPrint('Publish schedule error: $error');
      debugPrintStack(stackTrace: stackTrace);
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.unableToPublishSchedule,
        ),
      );
    }
  }

  Future<void> updatePublishedAvailability({
    required String doctorId,
    required String availabilityId,
    required String medicalServiceId,
    required DateTime workDate,
    required String shift,
    required String startTime,
    required String endTime,
    int slotDurationMinutes = 30,
  }) async {
    if (!state.isPublished) {
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.onlyPublishedScheduleCanBeEdited,
        ),
      );
      return;
    }

    final month = state.selectedMonth;

    if (month == null) {
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.noSelectedMonthAvailable,
        ),
      );
      return;
    }

    emit(state.copyWith(status: ScheduleStatus.saving, clearError: true));


    try {
      await _repository.updatePublishedAvailability(
        availabilityId: availabilityId,
        medicalServiceId: medicalServiceId,
        workDate: workDate,
        shift: shift,
        startTime: startTime,
        endTime: endTime,
        slotDurationMinutes: slotDurationMinutes,
      );

     


      await loadMonth(doctorId: doctorId, month: month);


      if (state.status == ScheduleStatus.failure) return;

      emit(state.copyWith(status: ScheduleStatus.success, clearError: true));
    } catch (error) {
     

      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.unableToUpdateAvailability,
        ),
      );
    } 
  }
  
Future<void> addPublishedAvailability({
    required String doctorId,
    required String medicalServiceId,
    required DateTime workDate,
    required String shift,
    required String startTime,
    required String endTime,
    int slotDurationMinutes = 30,
  }) async {
    final schedule = state.schedule;
    final month = state.selectedMonth;

    if (!state.isPublished || schedule == null) {
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.onlyPublishedScheduleCanBeUpdated,
        ),
      );
      return;
    }

    if (month == null) {
      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.noSelectedMonthAvailable,
        ),
      );
      return;
    }

    emit(state.copyWith(status: ScheduleStatus.saving, clearError: true));

    try {
      await _repository.addPublishedAvailability(
        scheduleId: schedule['id'] as String,
        doctorId: doctorId,
        medicalServiceId: medicalServiceId,
        workDate: workDate,
        shift: shift,
        startTime: startTime,
        endTime: endTime,
        slotDurationMinutes: slotDurationMinutes,
      );

      await loadMonth(doctorId: doctorId, month: month);

      if (state.status == ScheduleStatus.failure) return;

      emit(state.copyWith(status: ScheduleStatus.success, clearError: true));
    } catch (error, stackTrace) {
      debugPrint('Add published availability error: $error');
      debugPrintStack(stackTrace: stackTrace);

      emit(
        state.copyWith(
          status: ScheduleStatus.failure,
          errorMessage: t.unableToAddAvailability,
        ),
      );
    }
  }

}
