
import 'package:equatable/equatable.dart';

class FavoritesState extends Equatable {
  final Set<String> doctorIds;
  final bool isLoading;
  final String? errorMessage;

  const FavoritesState({
    this.doctorIds = const {},
    this.isLoading = false,
    this.errorMessage,
  });

  bool isFavorite(String doctorId) => doctorIds.contains(doctorId);

  FavoritesState copyWith({
    Set<String>? doctorIds,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return FavoritesState(
      doctorIds: doctorIds ?? this.doctorIds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [doctorIds, isLoading, errorMessage];
}
