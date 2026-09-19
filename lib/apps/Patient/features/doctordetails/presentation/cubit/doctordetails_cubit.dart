// doctor_details_cubit.dart
import 'package:doctor_hunt/apps/Patient/features/doctordetails/data/model/doctor_details_data.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit() : super(DoctorDetailsInitial());

  Future<void> loadDoctorDetails(String doctorId) async {
    emit(DoctorDetailsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      final doctor = DoctorDetailsData.sampleDoctor;
      emit(DoctorDetailsLoaded(doctor));
    } catch (e) {
      emit(DoctorDetailsError(e.toString()));
    }
  }

  void toggleFavorite() {
    final current = state;
    if (current is DoctorDetailsLoaded) {
      emit(
        DoctorDetailsLoaded(
          current.doctor.copyWith(isFavorite: !current.doctor.isFavorite),
        ),
      );
    }
  }
}
