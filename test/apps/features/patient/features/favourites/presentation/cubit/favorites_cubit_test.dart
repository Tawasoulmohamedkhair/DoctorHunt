
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/data/repository/favorite_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteRepository extends Mock
    implements FavoriteRepository {}

void main() {
  late MockFavoriteRepository repository;

  const patientId = 'patient-1';
  const doctorId = 'doctor-1';
  const otherDoctorId = 'doctor-2';

  setUp(() {
    repository = MockFavoriteRepository();
  });

  group('FavoritesCubit', () {
    group('loadFavorites', () {
      blocTest<FavoritesCubit, FavoritesState>(
        'emits loading then loaded favorite doctor IDs',
        build: () {
          when(() => repository.getFavoriteDoctorIds(patientId))
              .thenAnswer((_) async => {doctorId, otherDoctorId});

          return FavoritesCubit(repository);
        },
        act: (cubit) => cubit.loadFavorites(patientId),
        expect: () => [
          const FavoritesState(isLoading: true),
          const FavoritesState(
            doctorIds: {doctorId, otherDoctorId},
          ),
        ],
        verify: (_) {
          verify(
            () => repository.getFavoriteDoctorIds(patientId),
          ).called(1);
        },
      );

      blocTest<FavoritesCubit, FavoritesState>(
        'emits an empty set when the patient has no favorites',
        build: () {
          when(() => repository.getFavoriteDoctorIds(patientId))
              .thenAnswer((_) async => <String>{});

          return FavoritesCubit(repository);
        },
        act: (cubit) => cubit.loadFavorites(patientId),
        expect: () => [
          const FavoritesState(isLoading: true),
          const FavoritesState(),
        ],
      );

      blocTest<FavoritesCubit, FavoritesState>(
        'emits an error state when loading favorites fails',
        build: () {
          when(() => repository.getFavoriteDoctorIds(patientId))
              .thenThrow(Exception('Database error'));

          return FavoritesCubit(repository);
        },
        act: (cubit) => cubit.loadFavorites(patientId),
        expect: () => [
          const FavoritesState(isLoading: true),
          isA<FavoritesState>()
              .having(
                (state) => state.isLoading,
                'isLoading',
                false,
              )
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                isNotNull,
              ),
        ],
      );
    });

    group('toggleFavorite', () {
      blocTest<FavoritesCubit, FavoritesState>(
        'adds a doctor to favorites successfully',
        build: () {
          when(
            () => repository.addFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          ).thenAnswer((_) async {});

          return FavoritesCubit(repository);
        },
        act: (cubit) => cubit.toggleFavorite(
          patientId: patientId,
          doctorId: doctorId,
        ),
        expect: () => [
          const FavoritesState(doctorIds: {doctorId}),
        ],
        verify: (_) {
          verify(
            () => repository.addFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          ).called(1);

          verifyNever(
            () => repository.removeFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          );
        },
      );

      blocTest<FavoritesCubit, FavoritesState>(
        'restores the previous state when adding a favorite fails',
        build: () {
          when(
            () => repository.addFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          ).thenThrow(Exception('Database error'));

          return FavoritesCubit(repository);
        },
        act: (cubit) => cubit.toggleFavorite(
          patientId: patientId,
          doctorId: doctorId,
        ),
        expect: () => [
          const FavoritesState(doctorIds: {doctorId}),
          isA<FavoritesState>()
              .having(
                (state) => state.doctorIds,
                'doctorIds',
                isEmpty,
              )
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                isNotNull,
              ),
        ],
      );

      blocTest<FavoritesCubit, FavoritesState>(
        'removes a doctor from favorites successfully',
        build: () {
          when(
            () => repository.removeFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          ).thenAnswer((_) async {});

          return FavoritesCubit(repository);
        },
        seed: () => const FavoritesState(
          doctorIds: {doctorId, otherDoctorId},
        ),
        act: (cubit) => cubit.toggleFavorite(
          patientId: patientId,
          doctorId: doctorId,
        ),
        expect: () => [
          const FavoritesState(
            doctorIds: {otherDoctorId},
          ),
        ],
        verify: (_) {
          verify(
            () => repository.removeFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          ).called(1);

          verifyNever(
            () => repository.addFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          );
        },
      );

      blocTest<FavoritesCubit, FavoritesState>(
        'restores the previous state when removing a favorite fails',
        build: () {
          when(
            () => repository.removeFavorite(
              patientId: patientId,
              doctorId: doctorId,
            ),
          ).thenThrow(Exception('Database error'));

          return FavoritesCubit(repository);
        },
        seed: () => const FavoritesState(
          doctorIds: {doctorId, otherDoctorId},
        ),
        act: (cubit) => cubit.toggleFavorite(
          patientId: patientId,
          doctorId: doctorId,
        ),
        expect: () => [
          const FavoritesState(
            doctorIds: {otherDoctorId},
          ),
          isA<FavoritesState>()
              .having(
                (state) => state.doctorIds,
                'doctorIds',
                {doctorId, otherDoctorId},
              )
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                isNotNull,
              ),
        ],
      );
    });
  });
}
