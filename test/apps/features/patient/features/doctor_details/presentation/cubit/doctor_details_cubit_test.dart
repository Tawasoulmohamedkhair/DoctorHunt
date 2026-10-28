
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/cubit/doctordetails_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

void main() {
  late MockDoctorRepository repository;

  const doctorId = 'doctor-1';

  final doctor = DoctorModel(
    id: doctorId,
    fullName: 'Mohamed Ahmed',
    imageUrl: '',
    specialtyName: 'Cardiology',
    rating: 4.5,
    reviewsCount: 10,
    fee: 100,
    isActive: true,
    specialtyId: 'specialty-1',
  );

  final services = <String>[
    'Consultation',
    'Follow-up',
  ];

  final reviews = <Map<String, dynamic>>[
    {
      'id': 'review-1',
      'rating': 5,
      'comment': 'Excellent doctor',
    },
  ];

  setUp(() {
    repository = MockDoctorRepository();
  });

  group('DoctorDetailsCubit', () {
    blocTest<DoctorDetailsCubit, DoctorDetailsState>(
      'emits loading then loaded when doctor details load successfully',
      build: () {
        when(() => repository.getDoctorById(doctorId))
            .thenAnswer((_) async => doctor);

        when(() => repository.getDoctorServices(doctorId))
            .thenAnswer((_) async => services);

        when(() => repository.getDoctorReviews(doctorId))
            .thenAnswer((_) async => reviews);

        return DoctorDetailsCubit(repository);
      },
      act: (cubit) => cubit.loadDoctorDetails(doctorId),
      expect: () => [
        const DoctorDetailsLoading(),
        DoctorDetailsLoaded(
          doctor: doctor,
          services: services,
          reviews: reviews,
        ),
      ],
      verify: (_) {
        verify(() => repository.getDoctorById(doctorId)).called(1);
        verify(() => repository.getDoctorServices(doctorId)).called(1);
        verify(() => repository.getDoctorReviews(doctorId)).called(1);
      },
    );

    blocTest<DoctorDetailsCubit, DoctorDetailsState>(
      'emits an error state when loading doctor details fails',
      build: () {
        when(() => repository.getDoctorById(doctorId))
            .thenThrow(Exception('Database error'));

        when(() => repository.getDoctorServices(doctorId))
            .thenAnswer((_) async => services);

        when(() => repository.getDoctorReviews(doctorId))
            .thenAnswer((_) async => reviews);

        return DoctorDetailsCubit(repository);
      },
      act: (cubit) => cubit.loadDoctorDetails(doctorId),
      expect: () => [
        const DoctorDetailsLoading(),
        isA<DoctorDetailsError>().having(
          (state) => state.message,
          'message',
          isNotEmpty,
        ),
      ],
    );
  });
}
