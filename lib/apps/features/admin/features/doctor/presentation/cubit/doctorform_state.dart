import 'dart:io';

import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/data/models/medical_service_model.dart';
import 'package:equatable/equatable.dart';

enum DoctorFormStatus {
  initial,
  loading,
  ready,
  saving,
  deleting,
  success,
  failure,
}

class DoctorFormState extends Equatable {
  final DoctorFormStatus status;
  final DoctorModel? doctor;
  final List<SpecialtyModel> specialties;
  final String? selectedSpecialtyId;
  final File? selectedImageFile;
  final String? imageExtension;
  final bool isActive;
  final String? errorMessage;

  // Medical services
  final List<MedicalServiceModel> medicalServices;
  final List<String> selectedMedicalServiceIds;
  final bool isLoadingMedicalServices;

  const DoctorFormState({
    this.status = DoctorFormStatus.initial,
    this.doctor,
    this.specialties = const [],
    this.selectedSpecialtyId,
    this.selectedImageFile,
    this.imageExtension,
    this.isActive = true,
    this.errorMessage,
    this.medicalServices = const [],
    this.selectedMedicalServiceIds = const [],
    this.isLoadingMedicalServices = false,
  });

  DoctorFormState copyWith({
    DoctorFormStatus? status,
    DoctorModel? doctor,
    List<SpecialtyModel>? specialties,
    String? selectedSpecialtyId,
    File? selectedImageFile,
    String? imageExtension,
    bool? isActive,
    String? errorMessage,
    List<MedicalServiceModel>? medicalServices,
    List<String>? selectedMedicalServiceIds,
    bool? isLoadingMedicalServices,
    bool clearErrorMessage = false,
    bool clearDoctor = false,
    bool clearSelectedSpecialtyId = false,
    bool clearSelectedImageFile = false,
    bool clearImageExtension = false,
    bool clearMedicalServices = false,
    bool clearSelectedMedicalServiceIds = false,
  }) {
    return DoctorFormState(
      status: status ?? this.status,
      doctor: clearDoctor ? null : doctor ?? this.doctor,
      specialties: specialties ?? this.specialties,
      selectedSpecialtyId: clearSelectedSpecialtyId
          ? null
          : selectedSpecialtyId ?? this.selectedSpecialtyId,
      selectedImageFile: clearSelectedImageFile
          ? null
          : selectedImageFile ?? this.selectedImageFile,
      imageExtension: clearImageExtension
          ? null
          : imageExtension ?? this.imageExtension,
      isActive: isActive ?? this.isActive,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
      medicalServices: clearMedicalServices
          ? const []
          : medicalServices ?? this.medicalServices,
      selectedMedicalServiceIds: clearSelectedMedicalServiceIds
          ? const []
          : selectedMedicalServiceIds ?? this.selectedMedicalServiceIds,
      isLoadingMedicalServices:
          isLoadingMedicalServices ?? this.isLoadingMedicalServices,
    );
  }

  @override
  List<Object?> get props => [
    status,
    doctor,
    specialties,
    selectedSpecialtyId,
    selectedImageFile,
    imageExtension,
    isActive,
    errorMessage,
    medicalServices,
    selectedMedicalServiceIds,
    isLoadingMedicalServices,
  ];
}
