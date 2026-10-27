
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/cubit/finddoctor_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

void main() {
  late MockDoctorRepository doctorRepository;

  final doctors = [
    const DoctorModel(
      id: 'doctor-1',
      fullName: 'Mohamed Ahmed',
      specialtyId: 'specialty-1',
      specialtyName: 'Cardiology',
      rating: 4.5,
      reviewsCount: 20,
      fee: 10,
      isActive: true,
    ),
    const DoctorModel(
      id: 'doctor-2',
      fullName: 'Ahmed Ali',
      specialtyId: 'specialty-2',
      specialtyName: 'Neurology',
      rating: 4.9,
      reviewsCount: 35,
      fee: 15,
      isActive: true,
    ),
    const DoctorModel(
      id: 'doctor-3',
      fullName: 'Sara Mohamed',
      specialtyId: 'specialty-1',
      specialtyName: 'Cardiology',
      rating: 4.2,
      reviewsCount: 12,
      fee: 8,
      isActive: true,
    ),
  ];

  setUp(() {
    doctorRepository = MockDoctorRepository();

    when(() => doctorRepository.getActiveDoctors())
        .thenAnswer((_) async => doctors);
  });

  group('FindDoctorsCubit', () {
    blocTest<FindDoctorsCubit, FindDoctorsState>(
      'loads doctors successfully',
      build: () => FindDoctorsCubit(doctorRepository),
      act: (cubit) => cubit.loadDoctors(),
      expect: () => [
        isA<FindDoctorsLoading>(),
        isA<FindDoctorsLoaded>()
            .having(
              (state) => state.doctors.length,
              'number of doctors',
              3,
            )
            .having(
              (state) => state.query,
              'query',
              '',
            ),
      ],
      verify: (_) {
        verify(() => doctorRepository.getActiveDoctors()).called(1);
      },
    );

    blocTest<FindDoctorsCubit, FindDoctorsState>(
      'emits an error when loading doctors fails',
      setUp: () {
        when(() => doctorRepository.getActiveDoctors())
            .thenThrow(Exception('Database error'));
      },
      build: () => FindDoctorsCubit(doctorRepository),
      act: (cubit) => cubit.loadDoctors(),
      expect: () => [
        isA<FindDoctorsLoading>(),
        isA<FindDoctorsError>(),
      ],
    );

    blocTest<FindDoctorsCubit, FindDoctorsState>(
      'filters doctors by first name',
      build: () => FindDoctorsCubit(doctorRepository),
      act: (cubit) => cubit.loadDoctors(query: 'moh'),
      expect: () => [
        isA<FindDoctorsLoading>(),
        isA<FindDoctorsLoaded>().having(
          (state) => state.doctors.map((doctor) => doctor.id).toList(),
          'matching doctors',
          ['doctor-1'],
        ),
      ],
    );

    blocTest<FindDoctorsCubit, FindDoctorsState>(
      'filters doctors by specialty',
      build: () => FindDoctorsCubit(doctorRepository),
      act: (cubit) => cubit.loadDoctors(query: 'neurology'),
      expect: () => [
        isA<FindDoctorsLoading>(),
        isA<FindDoctorsLoaded>().having(
          (state) => state.doctors.map((doctor) => doctor.id).toList(),
          'matching doctors',
          ['doctor-2'],
        ),
      ],
    );

    blocTest<FindDoctorsCubit, FindDoctorsState>(
      'does not match a doctor by last name alone',
      build: () => FindDoctorsCubit(doctorRepository),
      act: (cubit) => cubit.loadDoctors(query: 'ahmed'),
      expect: () => [
        isA<FindDoctorsLoading>(),
        isA<FindDoctorsLoaded>().having(
          (state) => state.doctors.map((doctor) => doctor.id).toList(),
          'matching doctors',
          ['doctor-2'],
        ),
      ],
    );

    blocTest<FindDoctorsCubit, FindDoctorsState>(
      'sorts doctors by rating in descending order',
      build: () => FindDoctorsCubit(doctorRepository),
      act: (cubit) => cubit.loadDoctors(sortByRating: true),
      expect: () => [
        isA<FindDoctorsLoading>(),
        isA<FindDoctorsLoaded>().having(
          (state) => state.doctors.map((doctor) => doctor.id).toList(),
          'sorted doctor IDs',
          ['doctor-2', 'doctor-1', 'doctor-3'],
        ),
      ],
    );

    blocTest<FindDoctorsCubit, FindDoctorsState>(
      'debounces consecutive search requests',
      build: () => FindDoctorsCubit(doctorRepository),
      act: (cubit) async {
        await cubit.loadDoctors();

        cubit.search('m');

        await Future<void>.delayed(
          const Duration(milliseconds: 200),
        );

        cubit.search('mo');

        await Future<void>.delayed(
          const Duration(milliseconds: 600),
        );
      },
      expect: () => [
        isA<FindDoctorsLoading>(),
        isA<FindDoctorsLoaded>().having(
          (state) => state.query,
          'initial query',
          '',
        ),
        isA<FindDoctorsLoaded>()
            .having(
              (state) => state.query,
              'final query',
              'mo',
            )
            .having(
              (state) => state.doctors.map((doctor) => doctor.id).toList(),
              'matching doctors',
              ['doctor-1'],
            ),
      ],
    );
  });
}
