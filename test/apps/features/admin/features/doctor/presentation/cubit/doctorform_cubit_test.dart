
import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/doctorform_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/doctorform_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

class FakeFile extends Fake implements File {}

void main() {
  late MockDoctorRepository repository;

  const specialty = SpecialtyModel(
    id: 'specialty-1',
    name: 'Cardiology',
  );

  const doctor = DoctorModel(
    id: 'doctor-1',
    fullName: 'Dr. Ahmed Ali',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    rating: 4.8,
    reviewsCount: 120,
    fee: 28.0,
    isActive: true,
  );

  setUpAll(() {
    registerFallbackValue(FakeFile());
  });

  setUp(() {
    repository = MockDoctorRepository();
  });

  group('DoctorFormCubit', () {
    late Completer<DoctorModel> createCompleter;

    test('starts with initial state', () async {
      final cubit = DoctorFormCubit(repository);

      expect(cubit.state.status, DoctorFormStatus.initial);
      expect(cubit.state.doctor, isNull);
      expect(cubit.state.specialties, isEmpty);
      expect(cubit.state.selectedSpecialtyId, isNull);
      expect(cubit.state.isActive, isTrue);

      await cubit.close();
    });

    blocTest<DoctorFormCubit, DoctorFormState>(
      'initializes create mode and loads specialties',
      build: () {
        when(() => repository.getSpecialties())
            .thenAnswer((_) async => [specialty]);

        return DoctorFormCubit(repository);
      },
      act: (cubit) => cubit.initialize(),
      expect: () => [
        const DoctorFormState(status: DoctorFormStatus.loading),
        const DoctorFormState(
          status: DoctorFormStatus.ready,
          specialties: [specialty],
          isActive: true,
        ),
      ],
      verify: (_) {
        verify(() => repository.getSpecialties()).called(1);
        verifyNever(() => repository.getDoctorById(any()));
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'initializes edit mode with doctor data',
      build: () {
        when(() => repository.getSpecialties())
            .thenAnswer((_) async => [specialty]);

        when(() => repository.getDoctorById('doctor-1'))
            .thenAnswer((_) async => doctor);

        when(
          () => repository.getMedicalServicesBySpecialty('specialty-1'),
        ).thenAnswer((_) async => []);

        when(
          () => repository.getDoctorMedicalServiceIds('doctor-1'),
        ).thenAnswer((_) async => <String>[]);

        return DoctorFormCubit(repository);
      },
      act: (cubit) => cubit.initialize(doctorId: 'doctor-1'),
      expect: () => [
        const DoctorFormState(status: DoctorFormStatus.loading),
        const DoctorFormState(
          status: DoctorFormStatus.ready,
          doctor: doctor,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          isActive: true,
        ),
      ],
      verify: (cubit) {
        expect(cubit.isEditMode, isTrue);

        verify(() => repository.getSpecialties()).called(1);
        verify(() => repository.getDoctorById('doctor-1')).called(1);

        verify(
          () => repository.getMedicalServicesBySpecialty('specialty-1'),
        ).called(1);

        verify(
          () => repository.getDoctorMedicalServiceIds('doctor-1'),
        ).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when loading doctor in edit mode fails',
      build: () {
        when(() => repository.getSpecialties())
            .thenAnswer((_) async => [specialty]);

        // Delay the error so initialize() can await the specialties first.
        when(() => repository.getDoctorById('doctor-1')).thenAnswer(
          (_) async {
            await Future<void>.delayed(
              const Duration(milliseconds: 10),
            );
            throw Exception('Failed to load doctor');
          },
        );

        return DoctorFormCubit(repository);
      },
      act: (cubit) => cubit.initialize(doctorId: 'doctor-1'),
      expect: () => [
        const DoctorFormState(status: DoctorFormStatus.loading),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
      verify: (_) {
        verify(() => repository.getSpecialties()).called(1);
        verify(() => repository.getDoctorById('doctor-1')).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when loading specialties fails',
      build: () {
        when(() => repository.getSpecialties()).thenAnswer(
          (_) async => throw Exception('Failed to load specialties'),
        );

        return DoctorFormCubit(repository);
      },
      act: (cubit) => cubit.initialize(),
      expect: () => [
        const DoctorFormState(status: DoctorFormStatus.loading),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'selects a specialty',
      build: () {
        when(
          () => repository.getMedicalServicesBySpecialty('specialty-1'),
        ).thenAnswer((_) async => []);

        return DoctorFormCubit(repository);
      },
      act: (cubit) => cubit.selectSpecialty('specialty-1'),
      expect: () => [
        const DoctorFormState(
          selectedSpecialtyId: 'specialty-1',
          isLoadingMedicalServices: true,
        ),
        const DoctorFormState(
          selectedSpecialtyId: 'specialty-1',
          isLoadingMedicalServices: false,
        ),
      ],
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'ignores null specialty selection',
      build: () => DoctorFormCubit(repository),
      act: (cubit) => cubit.selectSpecialty(null),
      expect: () => <DoctorFormState>[],
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'changes active status',
      build: () => DoctorFormCubit(repository),
      act: (cubit) => cubit.setActive(false),
      expect: () => [
        const DoctorFormState(isActive: false),
      ],
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'fails to save when no specialty is selected',
      build: () => DoctorFormCubit(repository),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Ali',
        fee: 28.0,
      ),
      expect: () => [
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
      verify: (_) {
        verifyNever(
          () => repository.createDoctor(
            fullName: any(named: 'fullName'),
            specialtyId: any(named: 'specialtyId'),
            fee: any(named: 'fee'),
            isActive: any(named: 'isActive'),
          ),
        );
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'creates a doctor successfully',
      build: () {
        when(
          () => repository.createDoctor(
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
            isActive: true,
          ),
        ).thenAnswer((_) async => doctor);

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        specialties: [specialty],
        selectedSpecialtyId: 'specialty-1',
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Ali',
        fee: 28.0,
      ),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
        ),
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          doctor: doctor,
        ),
        const DoctorFormState(
          status: DoctorFormStatus.success,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          doctor: doctor,
        ),
      ],
      verify: (_) {
        verify(
          () => repository.createDoctor(
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
            isActive: true,
          ),
        ).called(1);

        verify(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'ignores a duplicate save while the first save is in progress',
      build: () {
        createCompleter = Completer<DoctorModel>();

        when(
          () => repository.createDoctor(
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
            isActive: true,
          ),
        ).thenAnswer((_) => createCompleter.future);

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        specialties: [specialty],
        selectedSpecialtyId: 'specialty-1',
      ),
      act: (cubit) async {
        final firstSave = cubit.save(
          fullName: 'Dr. Ahmed Ali',
          fee: 28.0,
        );

        await cubit.save(
          fullName: 'Dr. Ahmed Ali',
          fee: 28.0,
        );

        createCompleter.complete(doctor);
        await firstSave;
      },
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
        ),
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          doctor: doctor,
        ),
        const DoctorFormState(
          status: DoctorFormStatus.success,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          doctor: doctor,
        ),
      ],
      verify: (_) {
        verify(
          () => repository.createDoctor(
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
            isActive: true,
          ),
        ).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when uploading doctor image during update fails',
      build: () {
        when(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Updated',
            specialtyId: 'specialty-1',
            fee: 35.0,
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.uploadDoctorImage(
            doctorId: 'doctor-1',
            file: any(named: 'file'),
            extension: 'png',
          ),
        ).thenAnswer(
          (_) async => throw Exception('Image upload failed'),
        );

        return DoctorFormCubit(repository);
      },
      seed: () => DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
        specialties: const [specialty],
        selectedSpecialtyId: 'specialty-1',
        selectedImageFile: File('test/assets/updated.png'),
        imageExtension: 'png',
        isActive: true,
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Updated',
        fee: 35.0,
      ),
      expect: () => [
        isA<DoctorFormState>().having(
          (state) => state.status,
          'status',
          DoctorFormStatus.saving,
        ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
      verify: (_) {
        verify(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Updated',
            specialtyId: 'specialty-1',
            fee: 35.0,
          ),
        ).called(1);

        verify(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).called(1);

        verify(
          () => repository.uploadDoctorImage(
            doctorId: 'doctor-1',
            file: any(named: 'file'),
            extension: 'png',
          ),
        ).called(1);

        verifyNever(
          () => repository.updateDoctorStatus(
            doctorId: any(named: 'doctorId'),
            isActive: any(named: 'isActive'),
          ),
        );
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when creating a doctor fails',
      build: () {
        when(
          () => repository.createDoctor(
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
            isActive: true,
          ),
        ).thenAnswer(
          (_) async => throw Exception('Create failed'),
        );

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        selectedSpecialtyId: 'specialty-1',
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Ali',
        fee: 28.0,
      ),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          selectedSpecialtyId: 'specialty-1',
        ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'updates a doctor successfully',
      build: () {
        when(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Updated',
            specialtyId: 'specialty-1',
            fee: 35.0,
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
        specialties: [specialty],
        selectedSpecialtyId: 'specialty-1',
        isActive: true,
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Updated',
        fee: 35.0,
      ),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          doctor: doctor,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          isActive: true,
        ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.saving,
            )
            .having(
              (state) => state.doctor?.fullName,
              'doctor.fullName',
              'Dr. Ahmed Updated',
            ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.success,
            )
            .having(
              (state) => state.doctor?.fullName,
              'doctor.fullName',
              'Dr. Ahmed Updated',
            ),
      ],
      verify: (_) {
        verify(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Updated',
            specialtyId: 'specialty-1',
            fee: 35.0,
          ),
        ).called(1);

        verify(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).called(1);

        verifyNever(
          () => repository.updateDoctorStatus(
            doctorId: any(named: 'doctorId'),
            isActive: any(named: 'isActive'),
          ),
        );
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when updating a doctor fails',
      build: () {
        when(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Updated',
            specialtyId: 'specialty-1',
            fee: 35.0,
          ),
        ).thenAnswer(
          (_) async => throw Exception('Update failed'),
        );

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
        specialties: [specialty],
        selectedSpecialtyId: 'specialty-1',
        isActive: true,
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Updated',
        fee: 35.0,
      ),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          doctor: doctor,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          isActive: true,
        ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
      verify: (_) {
        verify(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Updated',
            specialtyId: 'specialty-1',
            fee: 35.0,
          ),
        ).called(1);

        verifyNever(
          () => repository.updateDoctorStatus(
            doctorId: any(named: 'doctorId'),
            isActive: any(named: 'isActive'),
          ),
        );
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when uploading doctor image during creation fails',
      build: () {
        when(
          () => repository.createDoctor(
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
            isActive: true,
          ),
        ).thenAnswer((_) async => doctor);

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.uploadDoctorImage(
            doctorId: 'doctor-1',
            file: any(named: 'file'),
            extension: 'jpg',
          ),
        ).thenAnswer(
          (_) async => throw Exception('Image upload failed'),
        );

        return DoctorFormCubit(repository);
      },
      seed: () => DoctorFormState(
        status: DoctorFormStatus.ready,
        specialties: const [specialty],
        selectedSpecialtyId: 'specialty-1',
        selectedImageFile: File('test/assets/doctor.png'),
        imageExtension: 'jpg',
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Ali',
        fee: 28.0,
      ),
      expect: () => [
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.saving,
            )
            .having(
              (state) => state.selectedImageFile,
              'selectedImageFile',
              isNotNull,
            ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.saving,
            )
            .having(
              (state) => state.doctor,
              'doctor',
              doctor,
            )
            .having(
              (state) => state.selectedImageFile,
              'selectedImageFile',
              isNotNull,
            ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
      verify: (_) {
        verify(
          () => repository.createDoctor(
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
            isActive: true,
          ),
        ).called(1);

        verify(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).called(1);

        verify(
          () => repository.uploadDoctorImage(
            doctorId: 'doctor-1',
            file: any(named: 'file'),
            extension: 'jpg',
          ),
        ).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'updates active status when it changes during editing',
      build: () {
        when(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.updateDoctorStatus(
            doctorId: 'doctor-1',
            isActive: false,
          ),
        ).thenAnswer((_) async {});

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
        selectedSpecialtyId: 'specialty-1',
        isActive: false,
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Ali',
        fee: 28.0,
      ),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          doctor: doctor,
          selectedSpecialtyId: 'specialty-1',
          isActive: false,
        ),
        isA<DoctorFormState>().having(
          (state) => state.status,
          'status',
          DoctorFormStatus.saving,
        ),
        isA<DoctorFormState>().having(
          (state) => state.status,
          'status',
          DoctorFormStatus.success,
        ),
      ],
      verify: (_) {
        verify(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).called(1);

        verify(
          () => repository.updateDoctorStatus(
            doctorId: 'doctor-1',
            isActive: false,
          ),
        ).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when updating doctor status fails',
      build: () {
        when(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.updateDoctorStatus(
            doctorId: 'doctor-1',
            isActive: false,
          ),
        ).thenAnswer(
          (_) async => throw Exception('Status update failed'),
        );

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
        specialties: [specialty],
        selectedSpecialtyId: 'specialty-1',
        isActive: false,
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Ali',
        fee: 28.0,
      ),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          doctor: doctor,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          isActive: false,
        ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
      verify: (_) {
        verify(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
          ),
        ).called(1);

        verify(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).called(1);

        verify(
          () => repository.updateDoctorStatus(
            doctorId: 'doctor-1',
            isActive: false,
          ),
        ).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'does not update doctor status when it remains unchanged',
      build: () {
        when(
          () => repository.updateDoctor(
            doctorId: 'doctor-1',
            fullName: 'Dr. Ahmed Ali',
            specialtyId: 'specialty-1',
            fee: 28.0,
          ),
        ).thenAnswer((_) async {});

        when(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).thenAnswer((_) async {});

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
        specialties: [specialty],
        selectedSpecialtyId: 'specialty-1',
        isActive: true,
      ),
      act: (cubit) => cubit.save(
        fullName: 'Dr. Ahmed Ali',
        fee: 28.0,
      ),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.saving,
          doctor: doctor,
          specialties: [specialty],
          selectedSpecialtyId: 'specialty-1',
          isActive: true,
        ),
        isA<DoctorFormState>().having(
          (state) => state.status,
          'status',
          DoctorFormStatus.success,
        ),
      ],
      verify: (_) {
        verify(
          () => repository.saveDoctorMedicalServices(
            doctorId: 'doctor-1',
            medicalServiceIds: <String>[],
          ),
        ).called(1);

        verifyNever(
          () => repository.updateDoctorStatus(
            doctorId: any(named: 'doctorId'),
            isActive: any(named: 'isActive'),
          ),
        );
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'does nothing when deleting without a loaded doctor',
      build: () => DoctorFormCubit(repository),
      act: (cubit) => cubit.deleteDoctor(),
      expect: () => <DoctorFormState>[],
      verify: (_) {
        verifyNever(() => repository.deleteDoctor(any()));
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'deletes a loaded doctor successfully',
      build: () {
        when(
          () => repository.deleteDoctor('doctor-1'),
        ).thenAnswer((_) async {});

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
      ),
      act: (cubit) => cubit.deleteDoctor(),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.deleting,
          doctor: doctor,
        ),
        const DoctorFormState(
          status: DoctorFormStatus.success,
          doctor: doctor,
        ),
      ],
      verify: (_) {
        verify(() => repository.deleteDoctor('doctor-1')).called(1);
      },
    );

    blocTest<DoctorFormCubit, DoctorFormState>(
      'emits failure when deleting a doctor fails',
      build: () {
        when(() => repository.deleteDoctor('doctor-1')).thenAnswer(
          (_) async => throw Exception('Delete failed'),
        );

        return DoctorFormCubit(repository);
      },
      seed: () => const DoctorFormState(
        status: DoctorFormStatus.ready,
        doctor: doctor,
      ),
      act: (cubit) => cubit.deleteDoctor(),
      expect: () => [
        const DoctorFormState(
          status: DoctorFormStatus.deleting,
          doctor: doctor,
        ),
        isA<DoctorFormState>()
            .having(
              (state) => state.status,
              'status',
              DoctorFormStatus.failure,
            )
            .having(
              (state) => state.errorMessage,
              'errorMessage',
              isNotNull,
            ),
      ],
    );
  });
}
