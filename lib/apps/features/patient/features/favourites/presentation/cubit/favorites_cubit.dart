import 'package:doctor_hunt/apps/core/error/app_error.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/data/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoriteRepository _repository;

  FavoritesCubit(this._repository) : super(const FavoritesState());

  Future<void> loadFavorites(String patientId) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, clearError: true));

    try {
      final doctorIds = await _repository.getFavoriteDoctorIds(patientId);
      if (isClosed) return;

      emit(
        state.copyWith(
          doctorIds: doctorIds,
          isLoading: false,
          clearError: true,
        ),
      );
    } catch (error, stackTrace) {
      if (isClosed) return;
      final failure = mapAppFailure(error, stackTrace);
      failure.logDiagnostic('Load favorite doctors');
      emit(state.copyWith(isLoading: false, errorMessage: failure.userMessage));
    }
  }

  Future<void> toggleFavorite({
    required String patientId,
    required String doctorId,
  }) async {
    if (isClosed) return;

    final previousIds = Set<String>.from(state.doctorIds);
    final wasFavorite = previousIds.contains(doctorId);
    final updatedIds = Set<String>.from(previousIds);

    if (wasFavorite) {
      updatedIds.remove(doctorId);
    } else {
      updatedIds.add(doctorId);
    }

    emit(state.copyWith(doctorIds: updatedIds, clearError: true));

    try {
      if (wasFavorite) {
        await _repository.removeFavorite(
          patientId: patientId,
          doctorId: doctorId,
        );
      } else {
        await _repository.addFavorite(patientId: patientId, doctorId: doctorId);
      }
      if (isClosed) return;
    } catch (error, stackTrace) {
      if (isClosed) return;
      final failure = mapAppFailure(error, stackTrace);
      failure.logDiagnostic('Update favorite doctor');
      emit(
        state.copyWith(
          doctorIds: previousIds,
          errorMessage: failure.userMessage,
        ),
      );
    }
  }
}
