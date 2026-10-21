import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctors_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorsCubit extends Cubit<AdminDoctorsState> {
  final DoctorRepository _repository;

  AdminDoctorsCubit(this._repository) : super(const AdminDoctorsState());

  Future<void> loadDoctors({bool isRefresh = false}) async {
    emit(
      state.copyWith(
        status: isRefresh
            ? AdminDoctorsStatus.refreshing
            : AdminDoctorsStatus.loading,
        clearErrorMessage: true,
        clearOperationError: true,
      ),
    );

    try {
      final results = await Future.wait<Object>([
        _repository.getDoctors(),
        _repository.getSpecialties(),
      ]);

      final doctors = results[0] as List<DoctorModel>;
      final specialties = results[1] as List<SpecialtyModel>;

      emit(
        state.copyWith(
          status: AdminDoctorsStatus.success,
          doctors: doctors,
          specialties: specialties,
          clearErrorMessage: true,
          clearOperationError: true,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('ADMIN DOCTORS LOAD ERROR: $e');
      debugPrint('STACK TRACE: $stackTrace');

      if (isRefresh && state.doctors.isNotEmpty) {
        // Keep the existing data visible when refresh fails.
        emit(
          state.copyWith(
            status: AdminDoctorsStatus.success,
            operationErrorMessage: t.unabletoloaddoctors,
            clearErrorMessage: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AdminDoctorsStatus.failure,
            errorMessage: t.unabletoloaddoctors,
            clearOperationError: true,
          ),
        );
      }
    }
  }

  void searchDoctors(String query) {
      debugPrint('SEARCH INPUT: "$query"');

    emit(
      state.copyWith(
        searchQuery: query.trim().toLowerCase(),
        clearErrorMessage: true,
      ),
    );
    debugPrint('STATE QUERY: "${state.searchQuery}"');
    debugPrint('FILTERED COUNT: ${state.filteredDoctors.length}');
    debugPrint('TOTAL COUNT: ${state.doctors.length}');

  }

  void selectSpecialty(String? specialtyId) {
    emit(
      state.copyWith(
        selectedSpecialtyId: specialtyId,
        clearSelectedSpecialty: specialtyId == null,
        clearErrorMessage: true,
      ),
    );
  }

  Future<void> toggleDoctorStatus({
    required String doctorId,
    required bool isActive,
  }) async {
    emit(state.copyWith(clearOperationError: true));

    try {
      await _repository.updateDoctorStatus(
        doctorId: doctorId,
        isActive: isActive,
      );

      final updatedDoctors = state.doctors.map((doctor) {
        if (doctor.id != doctorId) return doctor;

        return doctor.copyWith(isActive: isActive);
      }).toList();

      emit(
        state.copyWith(
          doctors: updatedDoctors,
          status: AdminDoctorsStatus.success,
          clearErrorMessage: true,
          clearOperationError: true,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('DOCTOR STATUS UPDATE ERROR: $e');
      debugPrint('STACK TRACE: $stackTrace');

      // Preserve the list and the current screen status.
      emit(state.copyWith(operationErrorMessage: t.unableToUpdateDoctorStatus));
    }
  }

  Future<void> deleteDoctor(String doctorId) async {
    emit(state.copyWith(clearOperationError: true));

    try {
      await _repository.deleteDoctor(doctorId);

      final updatedDoctors = state.doctors
          .where((doctor) => doctor.id != doctorId)
          .toList();

      emit(
        state.copyWith(
          doctors: updatedDoctors,
          status: AdminDoctorsStatus.success,
          clearErrorMessage: true,
          clearOperationError: true,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('DOCTOR DELETE ERROR: $e');
      debugPrint('STACK TRACE: $stackTrace');

      // Keep the doctor in the list if deletion fails.
      emit(state.copyWith(operationErrorMessage: t.unableToDeleteDoctorFromList));
    }
  }
}
