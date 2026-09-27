// import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_data.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());

//   Future<void> loadHomeData() async {
//     emit(HomeLoading());

//     try {
//       await Future.delayed(const Duration(milliseconds: 600));

//       emit(
//         HomeLoaded(
//           liveDoctors: DoctorsData.liveDoctors,
//           popularDoctors: DoctorsData.popularDoctors,
//           featuredDoctors: DoctorsData.featuredDoctors,
//         ),
//       );
//     } catch (e) {
//       emit(HomeError(e.toString()));
//     }
//   }
// }

import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_data.dart';
import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    try {
      await Future.delayed(const Duration(milliseconds: 600));

      emit(
        HomeLoaded(
          liveDoctors: DoctorsData.liveDoctors,
          popularDoctors: DoctorsData.popularDoctors,
          featuredDoctors: DoctorsData.featuredDoctors,
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void toggleFavorite(String doctorId) {
    if (state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;

    emit(
      HomeLoaded(
        liveDoctors: _toggleFavorite(currentState.liveDoctors, doctorId),
        popularDoctors: _toggleFavorite(currentState.popularDoctors, doctorId),
        featuredDoctors: _toggleFavorite(
          currentState.featuredDoctors,
          doctorId,
        ),
      ),
    );
  }

  List<DoctorModel> _toggleFavorite(
    List<DoctorModel> doctors,
    String doctorId,
  ) {
    return doctors.map((doctor) {
      if (doctor.id == doctorId) {
        return doctor.copyWith(isFavorite: !doctor.isFavorite);
      }

      return doctor;
    }).toList();
  }
}
