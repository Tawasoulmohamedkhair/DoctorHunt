import 'package:doctor_hunt/apps/Patient/features/finddoctor/data/find_doctor_data.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/data/find_doctor_model.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindDoctorsCubit extends Cubit<FindDoctorsState> {
  FindDoctorsCubit() : super(FindDoctorsInitial());

  Future<void> loadDoctors({String? query}) async {
    emit(FindDoctorsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final List<FindDoctorModel> allDoctors = FindDoctorData.getDoctors();

      final q = (query ?? '').toLowerCase().trim();

      final List<FindDoctorModel> filtered = q.isEmpty
          ? allDoctors
          : allDoctors
                .where(
                  (d) =>
                      d.nameKey.toLowerCase().contains(q) ||
                      d.specialtyKey.toLowerCase().contains(q),
                )
                .toList();

      emit(FindDoctorsLoaded(doctors: filtered, query: query ?? ''));
    } catch (e) {
      emit(FindDoctorsError(e.toString()));
    }
  }

  Future<void> search(String query) async {
    await loadDoctors(query: query);
  }
}
