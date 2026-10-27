
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctordetails_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorDetailsCubit extends Cubit<AdminDoctorDetailsState> {
  final DoctorRepository _repository;

  String? _doctorId;

  AdminDoctorDetailsCubit(this._repository)
      : super(const AdminDoctorDetailsState());

  Future<void> loadDoctor(String doctorId) async {
    _doctorId = doctorId;

    emit(
      state.copyWith(
        status: AdminDoctorDetailsStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      final doctor = await _repository.getDoctorById(doctorId);

      emit(
        state.copyWith(
          status: AdminDoctorDetailsStatus.success,
          doctor: doctor,
          clearErrorMessage: true,
        ),
      );
    } catch (e) {
      

      emit(
        state.copyWith(
          status: AdminDoctorDetailsStatus.failure,
          errorMessage: t.unableToLoadDoctorDetails,
        ),
      );
    }
  }

  Future<void> refreshDoctor() async {
    final doctorId = _doctorId;

    if (doctorId == null) return;

    await loadDoctor(doctorId);
  }
}
