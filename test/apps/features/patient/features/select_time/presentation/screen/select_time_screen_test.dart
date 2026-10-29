
import 'dart:async';

import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/screen/select_time_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

class MockAppointmentRepository extends Mock
    implements AppointmentRepository {}

void main() {
  late MockDoctorRepository doctorRepository;
  late MockAppointmentRepository appointmentRepository;

  const doctorId = 'doctor-1';

  final doctor = DoctorModel(
    id: doctorId,
    fullName: 'Dr. Mohamed Ahmed',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    rating: 4.8,
    reviewsCount: 20,
    fee: 15.0,
    isActive: true,
  );

  setUp(() {
    getIt.reset();

    doctorRepository = MockDoctorRepository();
    appointmentRepository = MockAppointmentRepository();

    getIt.registerSingleton<DoctorRepository>(doctorRepository);
    getIt.registerFactory<SelectTimeCubit>(
      () => SelectTimeCubit(
        getIt<DoctorRepository>(),
        getIt<AppointmentRepository>(),
      ),
    );
    getIt.registerSingleton<AppointmentRepository>(
      appointmentRepository,
    );

    when(
      () => doctorRepository.getDoctorAvailabilityForMonth(
        doctorId: doctorId,
        month: any(named: 'month'),
      ),
    ).thenAnswer((_) async => <Map<String, dynamic>>[]);
  });

  tearDown(() async {
    await getIt.reset();
  });

  Widget buildTestWidget() {
    return TranslationProvider(
      child: MaterialApp(
        home: SelectTimeScreen(doctorId: doctorId),
      ),
    );
  }

  group('SelectTimeScreen', () {
    testWidgets(
      'shows a loading indicator while doctor details are pending',
      (tester) async {
        final completer = Completer<DoctorModel>();

        when(
          () => doctorRepository.getDoctorById(doctorId),
        ).thenAnswer((_) => completer.future);

        await tester.pumpWidget(buildTestWidget());

        expect(
          find.byType(CircularProgressIndicator),
          findsOneWidget,
        );

        completer.complete(doctor);
        await tester.pumpAndSettle();
      },
    );

  
testWidgets(
  'shows an error message when loading doctor details fails',
  (tester) async {
    when(
      () => doctorRepository.getDoctorById(doctorId),
    ).thenAnswer(
      (_) => Future<DoctorModel>.error(
        Exception('Doctor not found'),
      ),
    );

    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    expect(
      find.text(Translations.of(
        tester.element(find.byType(Scaffold).first),
      ).unableToLoadDoctorDetails),
      findsOneWidget,
    );

    verify(
      () => doctorRepository.getDoctorById(doctorId),
    ).called(1);
  },
);


    testWidgets(
      'shows doctor details after successful loading',
      (tester) async {
        when(
          () => doctorRepository.getDoctorById(doctorId),
        ).thenAnswer((_) async => doctor);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        expect(find.text(doctor.fullName), findsOneWidget);

        verify(
          () => doctorRepository.getDoctorById(doctorId),
        ).called(1);

        verify(
          () => doctorRepository.getDoctorAvailabilityForMonth(
            doctorId: doctorId,
            month: any(named: 'month'),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'disables the confirm button when no time slot is selected',
      (tester) async {
        when(
          () => doctorRepository.getDoctorById(doctorId),
        ).thenAnswer((_) async => doctor);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final context = tester.element(find.byType(Scaffold).first);
        final confirmLabel = Translations.of(context).confirm;

        final button = tester.widget<ElevatedButton>(
          find.widgetWithText(ElevatedButton, confirmLabel),
        );

        expect(button.onPressed, isNull);
      },
    );
  });
}
