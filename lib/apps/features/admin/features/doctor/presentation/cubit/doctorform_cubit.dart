import 'dart:io';

import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/doctorform_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorFormCubit extends Cubit<DoctorFormState> {
  final DoctorRepository _repository;

  int _medicalServicesRequestId = 0;

  DoctorFormCubit(this._repository) : super(const DoctorFormState());

  bool get isEditMode => state.doctor != null;

  Future<void> initialize({String? doctorId}) async {
    // Invalidate any service request started by a previous form state.
    final requestId = ++_medicalServicesRequestId;

    emit(
      state.copyWith(
        status: DoctorFormStatus.loading,
        clearErrorMessage: true,
        clearDoctor: true,
        clearSelectedSpecialtyId: true,
        clearSelectedImageFile: true,
        clearImageExtension: true,
        clearMedicalServices: true,
        clearSelectedMedicalServiceIds: true,
        isLoadingMedicalServices: false,
      ),
    );

    try {
      final specialtiesFuture = _repository.getSpecialties();
      final doctorFuture = doctorId != null
          ? _repository.getDoctorById(doctorId)
          : null;

      final specialties = await specialtiesFuture;
      final doctor = doctorFuture != null ? await doctorFuture : null;

      List<dynamic> services = [];
      List<String> selectedServiceIds = [];

      if (doctor != null) {
        final results = await Future.wait([
          _repository.getMedicalServicesBySpecialty(doctor.specialtyId),
          _repository.getDoctorMedicalServiceIds(doctor.id),
        ]);

        services = results[0] as List;
        final existingIds = results[1] as List<String>;

        final availableIds = services
            .map((service) => service.id as String)
            .toSet();

        selectedServiceIds = existingIds
            .where((id) => availableIds.contains(id))
            .toSet()
            .toList();
      }

      if (isClosed || requestId != _medicalServicesRequestId) return;

      emit(
        state.copyWith(
          status: DoctorFormStatus.ready,
          specialties: specialties,
          doctor: doctor,
          selectedSpecialtyId: doctor?.specialtyId,
          isActive: doctor?.isActive ?? true,
          medicalServices: services.cast(),
          selectedMedicalServiceIds: selectedServiceIds,
        ),
      );
    } catch (e) {
      if (isClosed || requestId != _medicalServicesRequestId) return;

      

      emit(
        state.copyWith(
          status: DoctorFormStatus.failure,
          errorMessage: t.unableToLoadDoctorForm,
        ),
      );
    }
  }

  Future<void> selectSpecialty(String? specialtyId) async {
    if (specialtyId == null || specialtyId == state.selectedSpecialtyId) {
      return;
    }

    final requestId = ++_medicalServicesRequestId;

    emit(
      state.copyWith(
        selectedSpecialtyId: specialtyId,
        clearMedicalServices: true,
        clearSelectedMedicalServiceIds: true,
        clearErrorMessage: true,
        isLoadingMedicalServices: true,
      ),
    );

    try {
      final services = await _repository.getMedicalServicesBySpecialty(
        specialtyId,
      );

      // Ignore outdated results if another specialty was selected meanwhile.
      if (isClosed ||
          requestId != _medicalServicesRequestId ||
          state.selectedSpecialtyId != specialtyId) {
        return;
      }

      emit(
        state.copyWith(
          medicalServices: services,
          isLoadingMedicalServices: false,
        ),
      );
    } catch (e) {
      if (isClosed || requestId != _medicalServicesRequestId) return;

      

      emit(
        state.copyWith(
          clearMedicalServices: true,
          clearSelectedMedicalServiceIds: true,
          isLoadingMedicalServices: false,
          errorMessage: t.unableToLoadDoctorForm,
        ),
      );
    }
  }

  void toggleMedicalService(String serviceId) {
    if (state.isLoadingMedicalServices ||
        !state.medicalServices.any((service) => service.id == serviceId)) {
      return;
    }

    final selectedIds = List<String>.from(state.selectedMedicalServiceIds);

    if (selectedIds.contains(serviceId)) {
      selectedIds.remove(serviceId);
    } else {
      selectedIds.add(serviceId);
    }

    emit(
      state.copyWith(
        selectedMedicalServiceIds: selectedIds,
        clearErrorMessage: true,
      ),
    );
  }

  void setImage({required File file, required String extension}) {
    emit(
      state.copyWith(
        selectedImageFile: file,
        imageExtension: extension,
        clearErrorMessage: true,
      ),
    );
  }

  void setActive(bool value) {
    emit(state.copyWith(isActive: value, clearErrorMessage: true));
  }

  Future<void> save({required String fullName, required double fee}) async {
    if (state.status == DoctorFormStatus.saving ||
        state.status == DoctorFormStatus.deleting) {
      return;
    }

    if (state.selectedSpecialtyId == null) {
      emit(
        state.copyWith(
          status: DoctorFormStatus.failure,
          errorMessage: t.pleaseSelectSpecialty,
        ),
      );
      return;
    }

    if (state.isLoadingMedicalServices) return;

    emit(
      state.copyWith(status: DoctorFormStatus.saving, clearErrorMessage: true),
    );

    try {
      if (isEditMode) {
        await _updateDoctor(fullName: fullName, fee: fee);
      } else {
        await _createDoctor(fullName: fullName, fee: fee);
      }

      if (isClosed) return;

      emit(
        state.copyWith(
          status: DoctorFormStatus.success,
          clearErrorMessage: true,
        ),
      );
    } catch (e) {
      if (isClosed) return;


      emit(
        state.copyWith(
          status: DoctorFormStatus.failure,
          errorMessage: t.unableToSaveDoctor,
        ),
      );
    }
  }

  Future<void> _createDoctor({
    required String fullName,
    required double fee,
  }) async {
    final doctor = await _repository.createDoctor(
      fullName: fullName,
      specialtyId: state.selectedSpecialtyId!,
      fee: fee,
      isActive: state.isActive,
    );

    // Keep the created record if a subsequent operation fails.
    emit(state.copyWith(doctor: doctor));

    await _repository.saveDoctorMedicalServices(
      doctorId: doctor.id,
      medicalServiceIds: state.selectedMedicalServiceIds,
    );

    final imageFile = state.selectedImageFile;

    if (imageFile != null) {
      await _repository.uploadDoctorImage(
        doctorId: doctor.id,
        file: imageFile,
        extension: state.imageExtension ?? 'jpg',
      );
    }
  }

  Future<void> _updateDoctor({
    required String fullName,
    required double fee,
  }) async {
    final doctor = state.doctor!;

    await _repository.updateDoctor(
      doctorId: doctor.id,
      fullName: fullName,
      specialtyId: state.selectedSpecialtyId!,
      fee: fee,
    );

    await _repository.saveDoctorMedicalServices(
      doctorId: doctor.id,
      medicalServiceIds: state.selectedMedicalServiceIds,
    );

    final imageFile = state.selectedImageFile;
    String? updatedImageUrl;

    if (imageFile != null) {
      updatedImageUrl = await _repository.uploadDoctorImage(
        doctorId: doctor.id,
        file: imageFile,
        extension: state.imageExtension ?? 'jpg',
      );
    }

    if (state.isActive != doctor.isActive) {
      await _repository.updateDoctorStatus(
        doctorId: doctor.id,
        isActive: state.isActive,
      );
    }

    final updatedDoctor = doctor.copyWith(
      fullName: fullName,
      specialtyId: state.selectedSpecialtyId!,
      fee: fee,
      isActive: state.isActive,
      imageUrl: updatedImageUrl ?? doctor.imageUrl,
    );

    emit(state.copyWith(doctor: updatedDoctor));
  }

  Future<void> deleteDoctor() async {
    if (state.status == DoctorFormStatus.saving ||
        state.status == DoctorFormStatus.deleting) {
      return;
    }

    final doctor = state.doctor;

    if (doctor == null) return;

    emit(
      state.copyWith(
        status: DoctorFormStatus.deleting,
        clearErrorMessage: true,
      ),
    );

    try {
      await _repository.deleteDoctor(doctor.id);

      if (isClosed) return;

      emit(
        state.copyWith(
          status: DoctorFormStatus.success,
          clearErrorMessage: true,
        ),
      );
    } catch (e) {
      if (isClosed) return;

     

      emit(
        state.copyWith(
          status: DoctorFormStatus.failure,
          errorMessage: t.unableToDeleteDoctor,
        ),
      );
    }
  }
}
