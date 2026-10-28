import 'dart:async';

import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/models/clinic_location_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/widget/clinic_location_section.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

void main() {
  late MockDoctorRepository repository;

  setUp(() async {
    await getIt.reset();
    repository = MockDoctorRepository();

    getIt.registerSingleton<DoctorRepository>(repository);
  });

  tearDown(() async {
    await getIt.reset();
  });

  Widget createWidget() {
    return TranslationProvider(
      child: const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: ClinicLocationSection()),
        ),
      ),
    );
  }

  group('ClinicLocationSection', () {
    testWidgets('shows a loading indicator while clinic location is loading', (
      tester,
    ) async {
      final completer = Completer<ClinicLocationModel?>();

      when(
        () => repository.getClinicLocation(),
      ).thenAnswer((_) => completer.future);

      await tester.pumpWidget(createWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      completer.complete(null);
      await tester.pumpAndSettle();
    });

    testWidgets('shows the unavailable message when clinic location is null', (
      tester,
    ) async {
      when(() => repository.getClinicLocation()).thenAnswer((_) async => null);

      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      expect(
        find.text(
          Translations.of(
            tester.element(find.byType(ClinicLocationSection)),
          ).clinicLocationUnavailable,
        ),
        findsOneWidget,
      );

      expect(find.byType(FlutterMap), findsNothing);
    });

    testWidgets('shows an error message when loading clinic location fails', (
      tester,
    ) async {
      when(() => repository.getClinicLocation()).thenAnswer(
        (_) => Future<ClinicLocationModel?>.error(Exception('Database error')),
      );

      await tester.pumpWidget(createWidget());
      await tester.pump();
      await tester.pump();

      final context = tester.element(find.byType(ClinicLocationSection));

      expect(
        find.text(Translations.of(context).unableToLoadClinicLocation),
        findsOneWidget,
      );

      expect(find.byType(FlutterMap), findsNothing);
    });

    testWidgets(
      'shows the address and map when valid coordinates are available',
      (tester) async {
        const location = ClinicLocationModel(
          location: 'Muscat, Oman',
          latitude: 23.5880,
          longitude: 58.3829,
        );

        when(
          () => repository.getClinicLocation(),
        ).thenAnswer((_) async => location);

        await tester.pumpWidget(createWidget());
        await tester.pump();

        expect(find.text('Muscat, Oman'), findsOneWidget);
        expect(find.byType(FlutterMap), findsOneWidget);
        expect(find.byType(MarkerLayer), findsOneWidget);
      },
    );

    testWidgets('shows a message when coordinates are unavailable', (
      tester,
    ) async {
      const location = ClinicLocationModel(location: 'Muscat, Oman');

      when(
        () => repository.getClinicLocation(),
      ).thenAnswer((_) async => location);

      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      expect(find.text('Muscat, Oman'), findsOneWidget);
      expect(find.text('Map coordinates are not available.'), findsOneWidget);
      expect(find.byType(FlutterMap), findsNothing);
    });

    testWidgets('shows a fallback when the address is empty', (tester) async {
      const location = ClinicLocationModel(location: '   ');

      when(
        () => repository.getClinicLocation(),
      ).thenAnswer((_) async => location);

      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      expect(find.text('Clinic address not provided.'), findsOneWidget);
      expect(find.text('Map coordinates are not available.'), findsOneWidget);
    });

    testWidgets(
      'does not show the map when coordinates are outside valid ranges',
      (tester) async {
        const location = ClinicLocationModel(
          location: 'Muscat, Oman',
          latitude: 100,
          longitude: 58.3829,
        );

        when(
          () => repository.getClinicLocation(),
        ).thenAnswer((_) async => location);

        await tester.pumpWidget(createWidget());
        await tester.pumpAndSettle();

        expect(find.text('Muscat, Oman'), findsOneWidget);
        expect(find.text('Map coordinates are not available.'), findsOneWidget);
        expect(find.byType(FlutterMap), findsNothing);
      },
    );
  });
}
