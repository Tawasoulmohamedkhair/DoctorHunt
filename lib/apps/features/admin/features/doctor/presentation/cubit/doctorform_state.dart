import 'dart:io';

import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
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

  const DoctorFormState({
    this.status = DoctorFormStatus.initial,
    this.doctor,
    this.specialties = const [],
    this.selectedSpecialtyId,
    this.selectedImageFile,
    this.imageExtension,
    this.isActive = true,
    this.errorMessage,
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
    bool clearErrorMessage = false,
    bool clearDoctor = false,
    bool clearSelectedSpecialtyId = false,
    bool clearSelectedImageFile = false,
    bool clearImageExtension = false,
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
  ];
}
