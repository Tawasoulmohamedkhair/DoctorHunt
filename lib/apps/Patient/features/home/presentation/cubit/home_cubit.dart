import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_data.dart';
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
}
