import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';

import 'finddoctor_state.dart';

class FindDoctorsCubit extends Cubit<FindDoctorsState> {
  final DoctorRepository _doctorRepository;

  FindDoctorsCubit(this._doctorRepository) : super(FindDoctorsInitial());

  List<DoctorModel> _allDoctors = [];

  bool _sortByRating = false;

  Future<void> loadDoctors({
    String query = '',
    bool sortByRating = false,
  }) async {
    emit(FindDoctorsLoading());

    try {
      _sortByRating = sortByRating;

      _allDoctors = await _doctorRepository.getActiveDoctors();

      _filterDoctors(query);
    } catch (e) {
      emit(FindDoctorsError(t.unabletoloaddoctors));
    }
  }

  void search(String query) {
    _filterDoctors(query);
  }


  void _filterDoctors(String query) {
    final normalizedQuery = query.trim().toLowerCase();

    final filteredDoctors = _allDoctors.where((doctor) {
      final firstName = doctor.fullName
          .trim()
          .split(RegExp(r'\s+'))
          .first
          .toLowerCase();

      final specialtyName = doctor.specialtyName.toLowerCase();

      return firstName.contains(normalizedQuery) ||
          specialtyName.contains(normalizedQuery);
    }).toList();

    if (_sortByRating) {
      filteredDoctors.sort((a, b) => b.rating.compareTo(a.rating));
    }

    emit(FindDoctorsLoaded(doctors: filteredDoctors, query: query));
  }
}
