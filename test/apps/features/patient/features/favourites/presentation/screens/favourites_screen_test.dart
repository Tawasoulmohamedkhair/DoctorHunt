import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/screens/favourites_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoritesCubit extends MockCubit<FavoritesState>
    implements FavoritesCubit {}

class MockDoctorRepository extends Mock implements DoctorRepository {}

void main() {
  late MockFavoritesCubit cubit;
  late MockDoctorRepository repository;

  const patientId = 'patient-1';

  const doctor1 = DoctorModel(
    id: 'doctor-1',
    fullName: 'Mohamed Ahmed',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    imageUrl: null,
    rating: 4.8,
    reviewsCount: 20,
    fee: 10,
    isActive: true,
  );

  const doctor2 = DoctorModel(
    id: 'doctor-2',
    fullName: 'Sara Ali',
    specialtyId: 'specialty-2',
    specialtyName: 'Neurology',
    imageUrl: null,
    rating: 4.5,
    reviewsCount: 15,
    fee: 12,
    isActive: true,
  );

  setUp(() async {
    cubit = MockFavoritesCubit();
    repository = MockDoctorRepository();

    if (getIt.isRegistered<DoctorRepository>()) {
      await getIt.unregister<DoctorRepository>();
    }

    getIt.registerSingleton<DoctorRepository>(repository);

    when(() => cubit.loadFavorites(any())).thenAnswer((_) async {});
  });

  tearDown(() async {
    if (getIt.isRegistered<DoctorRepository>()) {
      await getIt.unregister<DoctorRepository>();
    }
  });

  Future<void> pumpScreen(
    WidgetTester tester, {
    required FavoritesState state,
    required List<DoctorModel> doctors,
  }) async {
    whenListen(
      cubit,
      const Stream<FavoritesState>.empty(),
      initialState: state,
    );

    when(() => repository.getActiveDoctors()).thenAnswer((_) async => doctors);

    await tester.pumpWidget(
      TranslationProvider(
        child: BlocProvider<FavoritesCubit>.value(
          value: cubit,
          child: const MaterialApp(
            home: FavouritesScreen(patientId: patientId),
          ),
        ),
      ),
    );

    await tester.pump();
  }

  group('FavouritesScreen', () {
    testWidgets('shows loading indicator while favorites are loading', (
      tester,
    ) async {
      await pumpScreen(
        tester,
        state: const FavoritesState(isLoading: true),
        doctors: const [],
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when favorites loading fails', (
      tester,
    ) async {
      await pumpScreen(
        tester,
        state: const FavoritesState(errorMessage: 'Unable to load favorites'),
        doctors: const [],
      );

      expect(find.text('Unable to load favorites'), findsOneWidget);
    });

    testWidgets('shows empty favorites message when no doctors are favorite', (
      tester,
    ) async {
      await pumpScreen(
        tester,
        state: const FavoritesState(),
        doctors: const [doctor1, doctor2],
      );

      await tester.pumpAndSettle();

      expect(find.text('No favorite doctors yet.'), findsOneWidget);
    });

    testWidgets('shows only doctors included in favorite IDs', (tester) async {
      await pumpScreen(
        tester,
        state: const FavoritesState(doctorIds: {'doctor-1'}),
        doctors: const [doctor1, doctor2],
      );

      await tester.pumpAndSettle();

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
      expect(find.text('Sara Ali'), findsNothing);
    });

    testWidgets('filters favorite doctors by name', (tester) async {
      await pumpScreen(
        tester,
        state: const FavoritesState(doctorIds: {'doctor-1', 'doctor-2'}),
        doctors: const [doctor1, doctor2],
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'sara');
      await tester.pumpAndSettle();

      expect(find.text('Sara Ali'), findsOneWidget);
      expect(find.text('Mohamed Ahmed'), findsNothing);
    });

    testWidgets('shows no matching message when search has no results', (
      tester,
    ) async {
      await pumpScreen(
        tester,
        state: const FavoritesState(doctorIds: {'doctor-1'}),
        doctors: const [doctor1],
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Doctor Not Found');
      await tester.pumpAndSettle();

      expect(find.text('No matching favorite doctors.'), findsOneWidget);
    });
  });
}
