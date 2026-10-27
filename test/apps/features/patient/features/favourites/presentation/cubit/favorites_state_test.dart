
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FavoritesState', () {
    group('initial state', () {
      test('has the expected default values', () {
        const state = FavoritesState();

        expect(state.doctorIds, isEmpty);
        expect(state.isLoading, isFalse);
        expect(state.errorMessage, isNull);
      });
    });

    group('isFavorite', () {
      test('returns true when the doctor is in favorites', () {
        const state = FavoritesState(
          doctorIds: {'doctor-1', 'doctor-2'},
        );

        expect(state.isFavorite('doctor-1'), isTrue);
      });

      test('returns false when the doctor is not in favorites', () {
        const state = FavoritesState(
          doctorIds: {'doctor-1'},
        );

        expect(state.isFavorite('doctor-2'), isFalse);
      });
    });

    group('copyWith', () {
      test('updates doctor IDs while preserving other values', () {
        const state = FavoritesState(
          doctorIds: {'doctor-1'},
          isLoading: true,
          errorMessage: 'Previous error',
        );

        final updatedState = state.copyWith(
          doctorIds: {'doctor-2'},
        );

        expect(updatedState.doctorIds, {'doctor-2'});
        expect(updatedState.isLoading, isTrue);
        expect(updatedState.errorMessage, 'Previous error');
      });

      test('updates loading status', () {
        const state = FavoritesState();

        final updatedState = state.copyWith(isLoading: true);

        expect(updatedState.isLoading, isTrue);
        expect(updatedState.doctorIds, isEmpty);
        expect(updatedState.errorMessage, isNull);
      });

      test('preserves the previous error when clearError is false', () {
        const state = FavoritesState(
          errorMessage: 'Something went wrong',
        );

        final updatedState = state.copyWith(isLoading: true);

        expect(updatedState.errorMessage, 'Something went wrong');
      });

      test('clears the error when clearError is true', () {
        const state = FavoritesState(
          errorMessage: 'Something went wrong',
        );

        final updatedState = state.copyWith(clearError: true);

        expect(updatedState.errorMessage, isNull);
      });

      test('does not clear the error when clearError is omitted', () {
        const state = FavoritesState(
          errorMessage: 'Something went wrong',
        );

        final updatedState = state.copyWith(
          doctorIds: {'doctor-2'},
        );

        expect(updatedState.errorMessage, 'Something went wrong');
      });
    });

    group('Equatable', () {
      test('states with the same values are equal', () {
        const first = FavoritesState(
          doctorIds: {'doctor-1', 'doctor-2'},
          isLoading: true,
          errorMessage: 'Error',
        );

        const second = FavoritesState(
          doctorIds: {'doctor-1', 'doctor-2'},
          isLoading: true,
          errorMessage: 'Error',
        );

        expect(first, equals(second));
      });

      test('states with different values are not equal', () {
        const first = FavoritesState(
          doctorIds: {'doctor-1'},
        );

        const second = FavoritesState(
          doctorIds: {'doctor-2'},
        );

        expect(first, isNot(equals(second)));
      });
    });
  });
}
