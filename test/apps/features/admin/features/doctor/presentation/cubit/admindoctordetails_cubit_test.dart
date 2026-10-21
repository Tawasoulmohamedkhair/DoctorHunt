import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctordetails_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctordetails_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}


void main() {
  late MockDoctorRepository repository;

  const doctor = DoctorModel(
    id: 'doctor-1',
    fullName: 'Dr. Ahmed Ali',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    imageUrl: null,
    rating: 4.8,
    reviewsCount: 120,
    fee: 28.0,
    isActive: true,
  );

  setUp(() {
    repository = MockDoctorRepository();
  });

  group('AdminDoctorDetailsCubit', () {
    test('initial state is correct', () {
      final cubit = AdminDoctorDetailsCubit(repository);

      expect(cubit.state.status, AdminDoctorDetailsStatus.initial);
      expect(cubit.state.doctor, isNull);
      expect(cubit.state.errorMessage, isNull);

      cubit.close();
    });

    blocTest<AdminDoctorDetailsCubit, AdminDoctorDetailsState>(
      'emits loading then success when doctor loads successfully',
      build: () {
        when(() => repository.getDoctorById('doctor-1'))
            .thenAnswer((_) async => doctor);

        return AdminDoctorDetailsCubit(repository);
      },
      act: (cubit) => cubit.loadDoctor('doctor-1'),
      expect: () => [
        const AdminDoctorDetailsState(
          status: AdminDoctorDetailsStatus.loading,
        ),
        const AdminDoctorDetailsState(
          status: AdminDoctorDetailsStatus.success,
          doctor: doctor,
        ),
      ],
      verify: (_) {
        verify(() => repository.getDoctorById('doctor-1')).called(1);
      },
    );

    blocTest<AdminDoctorDetailsCubit, AdminDoctorDetailsState>(
      'emits loading then failure when loading doctor throws',
      build: () {
        when(() => repository.getDoctorById('doctor-1'))
            .thenThrow(Exception('Failed to load doctor'));

        return AdminDoctorDetailsCubit(repository);
      },
      act: (cubit) => cubit.loadDoctor('doctor-1'),
      expect: () => [
        const AdminDoctorDetailsState(
          status: AdminDoctorDetailsStatus.loading,
        ),
        isA<AdminDoctorDetailsState>()
            .having(
              (state) => state.status,
              'status',
              AdminDoctorDetailsStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              contains('Failed to load doctor'),
            ),
      ],
      verify: (_) {
        verify(() => repository.getDoctorById('doctor-1')).called(1);
      },
    );

    blocTest<AdminDoctorDetailsCubit, AdminDoctorDetailsState>(
      'refreshDoctor does nothing before a doctor ID is set',
      build: () => AdminDoctorDetailsCubit(repository),
      act: (cubit) => cubit.refreshDoctor(),
      expect: () => <AdminDoctorDetailsState>[],
      verify: (_) {
        verifyNever(() => repository.getDoctorById(any()));
      },
    );

    blocTest<AdminDoctorDetailsCubit, AdminDoctorDetailsState>(
      'refreshDoctor reloads the previously requested doctor',
      build: () {
        when(() => repository.getDoctorById('doctor-1'))
            .thenAnswer((_) async => doctor);

        return AdminDoctorDetailsCubit(repository);
      },
      act: (cubit) async {
        await cubit.loadDoctor('doctor-1');
        await cubit.refreshDoctor();
      },
      expect: () => [
        const AdminDoctorDetailsState(
          status: AdminDoctorDetailsStatus.loading,
        ),
        const AdminDoctorDetailsState(
          status: AdminDoctorDetailsStatus.success,
          doctor: doctor,
        ),
        const AdminDoctorDetailsState(
          status: AdminDoctorDetailsStatus.loading,
          doctor: doctor,
        ),
        const AdminDoctorDetailsState(
          status: AdminDoctorDetailsStatus.success,
          doctor: doctor,
        ),
      ],
      verify: (_) {
        verify(() => repository.getDoctorById('doctor-1')).called(2);
      },
    );
  });
}
