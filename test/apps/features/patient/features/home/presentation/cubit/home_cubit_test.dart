
import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/error/app_error.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

void main() {
  late MockDoctorRepository repository;

  DoctorModel createDoctor({
    required String id,
    required double rating,
    required int reviewsCount,
  }) {
    return DoctorModel(
      id: id,
      fullName: 'Doctor $id',
      specialtyId: 'specialty-1',
      specialtyName: 'General',
      rating: rating,
      reviewsCount: reviewsCount,
      fee: 20,
      isActive: true,
    );
  }

  final doctors = [
    createDoctor(id: '1', rating: 3.5, reviewsCount: 10),
    createDoctor(id: '2', rating: 4.9, reviewsCount: 5),
    createDoctor(id: '3', rating: 4.2, reviewsCount: 30),
    createDoctor(id: '4', rating: 3.8, reviewsCount: 15),
    createDoctor(id: '5', rating: 5.0, reviewsCount: 20),
    createDoctor(id: '6', rating: 4.6, reviewsCount: 25),
    createDoctor(id: '7', rating: 4.0, reviewsCount: 8),
  ];

  setUp(() {
    repository = MockDoctorRepository();
  });

  group('HomeCubit', () {
    test('has HomeInitial as its initial state', () {
      final cubit = HomeCubit(repository);

      expect(cubit.state, const HomeInitial());

      cubit.close();
    });

    blocTest<HomeCubit, HomeState>(
      'emits HomeLoading then HomeLoaded with correctly sorted doctors',
      build: () {
        when(
          () => repository.getActiveDoctorsResult(),
        ).thenAnswer(
          (_) async => AppSuccess<List<DoctorModel>>(doctors),
        );

        return HomeCubit(repository);
      },
      act: (cubit) => cubit.loadHomeData(),
      expect: () => [
        const HomeLoading(),
        HomeLoaded(
          popularDoctors: [
            doctors[2], // 30 reviews
            doctors[5], // 25 reviews
            doctors[4], // 20 reviews
            doctors[3], // 15 reviews
            doctors[0], // 10 reviews
          ],
          topRatedDoctors: [
            doctors[4], // 5.0
            doctors[1], // 4.9
            doctors[5], // 4.6
            doctors[2], // 4.2
            doctors[6], // 4.0
          ],
        ),
      ],
      verify: (_) {
        verify(
          () => repository.getActiveDoctorsResult(),
        ).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeLoaded with empty lists when no doctors are returned',
      build: () {
        when(
          () => repository.getActiveDoctorsResult(),
        ).thenAnswer(
          (_) async => AppSuccess<List<DoctorModel>>(<DoctorModel>[]),
        );

        return HomeCubit(repository);
      },
      act: (cubit) => cubit.loadHomeData(),
      expect: () => [
        const HomeLoading(),
        const HomeLoaded(
          popularDoctors: [],
          topRatedDoctors: [],
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'returns all doctors when fewer than five are available',
      build: () {
        when(
          () => repository.getActiveDoctorsResult(),
        ).thenAnswer(
          (_) async => AppSuccess<List<DoctorModel>>(
            doctors.take(3).toList(),
          ),
        );

        return HomeCubit(repository);
      },
      act: (cubit) => cubit.loadHomeData(),
      expect: () => [
        const HomeLoading(),
        HomeLoaded(
          popularDoctors: [
            doctors[2],
            doctors[0],
            doctors[1],
          ],
          topRatedDoctors: [
            doctors[1],
            doctors[2],
            doctors[0],
          ],
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeError when the repository returns AppError',
      build: () {
        when(
          () => repository.getActiveDoctorsResult(),
        ).thenAnswer(
          (_) async => AppError<List<DoctorModel>>(
            AppFailure(
              code: AppErrorCode.unexpected,
              cause: Exception('Database error'),
              stackTrace: StackTrace.current,
            ),
          ),
        );

        return HomeCubit(repository);
      },
      act: (cubit) => cubit.loadHomeData(),
      expect: () => [
        const HomeLoading(),
        const HomeError('Something went wrong. Please try again.'),
      ],
    );

    test('does not load doctors after the cubit is closed', () async {
      final cubit = HomeCubit(repository);

      await cubit.close();
      await cubit.loadHomeData();

      verifyNever(
        () => repository.getActiveDoctorsResult(),
      );
    });

    test('does not emit HomeLoaded if closed while loading', () async {
      final completer = Completer<AppResult<List<DoctorModel>>>();

      when(
        () => repository.getActiveDoctorsResult(),
      ).thenAnswer((_) => completer.future);

      final cubit = HomeCubit(repository);
      final emittedStates = <HomeState>[];
      final subscription = cubit.stream.listen(emittedStates.add);

      final loadingFuture = cubit.loadHomeData();

      await Future<void>.delayed(Duration.zero);

      expect(cubit.state, const HomeLoading());

      await cubit.close();

      completer.complete(
        AppSuccess<List<DoctorModel>>(doctors),
      );

      await loadingFuture;
      await subscription.cancel();

      expect(
        emittedStates,
        isNot(contains(isA<HomeLoaded>())),
      );
    });
  });
}
