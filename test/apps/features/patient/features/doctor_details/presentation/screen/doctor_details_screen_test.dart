import 'dart:async';

import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/cubit/doctordetails_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/screen/doctor_details_screen.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/data/repository/favorite_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

void main() {
  late MockDoctorRepository doctorRepository;
  late MockFavoriteRepository favoriteRepository;
  late DoctorDetailsCubit doctorDetailsCubit;
  late FavoritesCubit favoritesCubit;

  const doctorId = 'doctor-1';

  const doctor = DoctorModel(
    id: doctorId,
    fullName: 'Dr. Mohamed Ahmed',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    imageUrl: null,
    rating: 4.8,
    reviewsCount: 12,
    fee: 25,
    isActive: true,
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    SharedPreferences.setMockInitialValues({});
    // Initialize Supabase locally for tests.
    // No real backend request is made by this initialization.
    await Supabase.initialize(
      url: 'http://localhost:54321',
      publishableKey: 'test-publishable-key',
    );
  });

  setUp(() async {
    await getIt.reset();

    doctorRepository = MockDoctorRepository();
    favoriteRepository = MockFavoriteRepository();

    getIt.registerSingleton<DoctorRepository>(doctorRepository);

    doctorDetailsCubit = DoctorDetailsCubit(doctorRepository);
    favoritesCubit = FavoritesCubit(favoriteRepository);

    when(
      () => doctorRepository.getClinicLocation(),
    ).thenAnswer((_) async => null);

    when(
      () => favoriteRepository.getFavoriteDoctorIds(any()),
    ).thenAnswer((_) async => <String>{});
  });

  tearDown(() async {
    await doctorDetailsCubit.close();
    await favoritesCubit.close();
    await getIt.reset();
  });

  Widget createScreen() {
    return TranslationProvider(
      child: MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<DoctorDetailsCubit>.value(value: doctorDetailsCubit),
            BlocProvider<FavoritesCubit>.value(value: favoritesCubit),
          ],
          child: const DoctorDetailsScreen(doctorId: doctorId),
        ),
      ),
    );
  }

  group('DoctorDetailsScreen', () {
    testWidgets('shows loading indicator while doctor details are loading', (
      tester,
    ) async {
      final completer = Completer<DoctorModel>();

      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenAnswer((_) => completer.future);

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>[]);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => <Map<String, dynamic>>[]);

      await tester.pumpWidget(createScreen());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      completer.complete(doctor);
      await tester.pumpAndSettle();
    });

    testWidgets('shows doctor details after successful loading', (
      tester,
    ) async {
      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenAnswer((_) async => doctor);

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>['Heart examination', 'ECG']);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => <Map<String, dynamic>>[]);

      await tester.pumpWidget(createScreen());
      await tester.pumpAndSettle();

      expect(find.text('Dr. Mohamed Ahmed'), findsOneWidget);

      expect(find.text('Cardiology'), findsOneWidget);

      verify(() => doctorRepository.getDoctorById(doctorId)).called(1);

      verify(() => doctorRepository.getDoctorServices(doctorId)).called(1);

      verify(() => doctorRepository.getDoctorReviews(doctorId)).called(1);
    });

    testWidgets('shows error state when loading doctor details fails', (
      tester,
    ) async {
      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenThrow(Exception('Database error'));

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>[]);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => <Map<String, dynamic>>[]);

      await tester.pumpWidget(createScreen());
      await tester.pumpAndSettle();

      expect(doctorDetailsCubit.state, isA<DoctorDetailsError>());

      expect(
        find.text(
          Translations.of(
            tester.element(find.byType(DoctorDetailsScreen)),
          ).unableToLoadDoctorDetails,
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows doctor services when services are available', (
      tester,
    ) async {
      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenAnswer((_) async => doctor);

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>['Heart examination', 'ECG']);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => <Map<String, dynamic>>[]);

      await tester.pumpWidget(createScreen());
      await tester.pumpAndSettle();

      expect(find.text('Heart examination'), findsOneWidget);
      expect(find.text('ECG'), findsOneWidget);
    });

    testWidgets('shows empty services message when doctor has no services', (
      tester,
    ) async {
      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenAnswer((_) async => doctor);

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>[]);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => <Map<String, dynamic>>[]);

      await tester.pumpWidget(createScreen());
      await tester.pumpAndSettle();

      expect(
        find.text(
          Translations.of(
            tester.element(find.byType(DoctorDetailsScreen)),
          ).noServicesAvailableForDoctor,
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows empty reviews message when doctor has no reviews', (
      tester,
    ) async {
      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenAnswer((_) async => doctor);

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>[]);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => <Map<String, dynamic>>[]);

      await tester.pumpWidget(createScreen());
      await tester.pumpAndSettle();

      expect(
        find.text(
          Translations.of(
            tester.element(find.byType(DoctorDetailsScreen)),
          ).noReviewsYet,
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows review content when doctor has reviews', (tester) async {
      final reviews = <Map<String, dynamic>>[
        {
          'id': 'review-1',
          'rating': 5,
          'comment': 'Very professional doctor.',
          'created_at': '2026-01-15T10:00:00Z',
          'patients': {
            'users': {'full_name': 'Ahmed Ali', 'avatar_url': null},
          },
        },
      ];

      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenAnswer((_) async => doctor);

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>[]);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => reviews);

      await tester.pumpWidget(createScreen());
      await tester.pumpAndSettle();

      expect(find.text('Very professional doctor.'), findsOneWidget);

      expect(find.text('Ahmed Ali'), findsOneWidget);
    });

    testWidgets('shows clinic location section', (tester) async {
      when(
        () => doctorRepository.getDoctorById(doctorId),
      ).thenAnswer((_) async => doctor);

      when(
        () => doctorRepository.getDoctorServices(doctorId),
      ).thenAnswer((_) async => <String>[]);

      when(
        () => doctorRepository.getDoctorReviews(doctorId),
      ).thenAnswer((_) async => <Map<String, dynamic>>[]);

      await tester.pumpWidget(createScreen());
      await tester.pumpAndSettle();
      final translations = Translations.of(
        tester.element(find.byType(DoctorDetailsScreen)),
      );

      expect(find.text(translations.clinicLocation), findsOneWidget);

      expect(find.text(translations.clinicLocationUnavailable), findsOneWidget);
    });
  });
}
