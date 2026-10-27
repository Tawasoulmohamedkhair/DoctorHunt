import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctordetails_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final DoctorRepository _doctorRepository;

  DoctorDetailsCubit(this._doctorRepository)
    : super(const DoctorDetailsInitial());

  Future<void> loadDoctorDetails(String doctorId) async {
    emit(const DoctorDetailsLoading());

    try {
      final results = await Future.wait<dynamic>([
        _doctorRepository.getDoctorById(doctorId),
        _doctorRepository.getDoctorServices(doctorId),
        _doctorRepository.getDoctorReviews(doctorId),
      ]);

      final doctor = results[0] as DoctorModel;
      final services = List<String>.from(results[1] as List);
      final reviews = List<Map<String, dynamic>>.from(results[2] as List);

      emit(
        DoctorDetailsLoaded(
          doctor: doctor,
          services: services,
          reviews: reviews,
        ),
      );
    } catch (e) {
      
      emit(DoctorDetailsError(t.unableToLoadDoctorDetails));
    }
  }
}
