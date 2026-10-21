import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:equatable/equatable.dart';

enum AdminDoctorsStatus { initial, loading, refreshing, success, failure }

class AdminDoctorsState extends Equatable {
  final AdminDoctorsStatus status;
  final List<DoctorModel> doctors;
  final List<SpecialtyModel> specialties;
  final String? selectedSpecialtyId;
  final String searchQuery;
  final String? errorMessage;
  final String? operationErrorMessage;

  const AdminDoctorsState({
    this.status = AdminDoctorsStatus.initial,
    this.doctors = const [],
    this.specialties = const [],
    this.selectedSpecialtyId,
    this.searchQuery = '',
    this.errorMessage,
    this.operationErrorMessage,
  });
  // List<DoctorModel> get filteredDoctors {
  //   var result = doctors;

  //   if (selectedSpecialtyId != null) {
  //     result = result
  //         .where((doctor) => doctor.specialtyId == selectedSpecialtyId)
  //         .toList();
  //   }

  //   final query = searchQuery.trim().toLowerCase();

  //   if (query.isNotEmpty) {
  //     result = result.where((doctor) {
  //       final name = doctor.fullName.toLowerCase();
  //       final specialty = doctor.specialtyName.toLowerCase();

  //       return name.contains(query) || specialty.contains(query);
  //     }).toList();
  //   }

  //   return result;
  // }

  List<DoctorModel> get filteredDoctors {
    var result = doctors;

    if (selectedSpecialtyId != null) {
      result = result
          .where((doctor) => doctor.specialtyId == selectedSpecialtyId)
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      result = result.where((doctor) {
        final name = doctor.fullName.toLowerCase();
        final specialty = doctor.specialtyName.toLowerCase();

        return name.startsWith(searchQuery) || specialty.contains(searchQuery);
      }).toList();
    }

    return result;
  }

  int get activeDoctorsCount =>
      doctors.where((doctor) => doctor.isActive).length;

  AdminDoctorsState copyWith({
    AdminDoctorsStatus? status,
    List<DoctorModel>? doctors,
    List<SpecialtyModel>? specialties,
    String? selectedSpecialtyId,
    String? searchQuery,
    String? errorMessage,
    String? operationErrorMessage,
    bool clearSelectedSpecialty = false,
    bool clearSearchQuery = false,
    bool clearErrorMessage = false,
    bool clearOperationError = false,
  }) {
    return AdminDoctorsState(
      status: status ?? this.status,
      doctors: doctors ?? this.doctors,
      specialties: specialties ?? this.specialties,
      selectedSpecialtyId: clearSelectedSpecialty
          ? null
          : selectedSpecialtyId ?? this.selectedSpecialtyId,
      searchQuery: clearSearchQuery ? '' : searchQuery ?? this.searchQuery,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
      operationErrorMessage: clearOperationError
          ? null
          : operationErrorMessage ?? this.operationErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    doctors,
    specialties,
    selectedSpecialtyId,
    searchQuery,
    errorMessage,
    operationErrorMessage,
  ];
}
