import 'package:doctor_hunt/apps/core/error/app_error.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DoctorRepository _doctorRepository;

  HomeCubit(this._doctorRepository) : super(const HomeInitial());

  Future<void> loadHomeData() async {
    if (isClosed) return;
    emit(const HomeLoading());

    final result = await _doctorRepository.getActiveDoctorsResult();
    if (isClosed) return;

    switch (result) {
      case AppSuccess<List<DoctorModel>>(:final value):
        final doctors = value;
        final popularDoctors = [...doctors]
          ..sort((a, b) => b.reviewsCount.compareTo(a.reviewsCount));

        final topRatedDoctors = [...doctors]
          ..sort((a, b) => b.rating.compareTo(a.rating));

        emit(
          HomeLoaded(
            popularDoctors: popularDoctors.take(5).toList(),
            topRatedDoctors: topRatedDoctors.take(5).toList(),
          ),
        );
      case AppError<List<DoctorModel>>(:final failure):
        failure.logDiagnostic('Load patient home doctors');
        emit(HomeError(failure.userMessage));
    }
  }
}
