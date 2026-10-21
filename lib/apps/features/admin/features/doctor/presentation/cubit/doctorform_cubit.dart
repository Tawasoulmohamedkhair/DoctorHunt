import 'dart:io';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/foundation.dart';

import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/doctorform_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorFormCubit extends Cubit<DoctorFormState> {
  final DoctorRepository _repository;

  DoctorFormCubit(this._repository) : super(const DoctorFormState());

  bool get isEditMode => state.doctor != null;

  Future<void> initialize({String? doctorId}) async {
    emit(
      state.copyWith(
        status: DoctorFormStatus.loading,
        clearErrorMessage: true,
        clearDoctor: true,
        clearSelectedSpecialtyId: true,
        clearSelectedImageFile: true,
        clearImageExtension: true,
      ),
    );

    try {
      final specialtiesFuture = _repository.getSpecialties();

      final doctorFuture = doctorId != null
          ? _repository.getDoctorById(doctorId)
          : null;

      final specialties = await specialtiesFuture;
      final doctor = doctorFuture != null ? await doctorFuture : null;

      emit(
        state.copyWith(
          status: DoctorFormStatus.ready,
          specialties: specialties,
          doctor: doctor,
          selectedSpecialtyId: doctor?.specialtyId,
          isActive: doctor?.isActive ?? true,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Load doctor form error: $e');
      debugPrintStack(stackTrace: stackTrace);
      emit(
        state.copyWith(
          status: DoctorFormStatus.failure,
          errorMessage: t.unableToLoadDoctorForm,
        ),
      );
    }
  }

  void selectSpecialty(String? specialtyId) {
    if (specialtyId == null) return;

    emit(
      state.copyWith(selectedSpecialtyId: specialtyId, clearErrorMessage: true),
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

    emit(
      state.copyWith(status: DoctorFormStatus.saving, clearErrorMessage: true),
    );

    try {
      if (isEditMode) {
        await _updateDoctor(fullName: fullName, fee: fee);
      } else {
        await _createDoctor(fullName: fullName, fee: fee);
      }

      emit(
        state.copyWith(
          status: DoctorFormStatus.success,
          clearErrorMessage: true,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Save doctor error: $e');
      debugPrintStack(stackTrace: stackTrace);
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

    // احتفظ بالسجل الذي أُنشئ قبل محاولة رفع الصورة.
    emit(state.copyWith(doctor: doctor));

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

      emit(
        state.copyWith(
          status: DoctorFormStatus.success,
          clearErrorMessage: true,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Delete doctor error: $e');
      debugPrintStack(stackTrace: stackTrace);
      emit(
        state.copyWith(
          status: DoctorFormStatus.failure,
          errorMessage: t.unableToDeleteDoctor,
        ),
      );
    }
  }
}
