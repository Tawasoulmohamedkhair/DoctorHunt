import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/cubit/finddoctor_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/screens/find_doctors_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockFindDoctorsCubit extends MockCubit<FindDoctorsState>
    implements FindDoctorsCubit {}

class MockFavoritesCubit extends MockCubit<FavoritesState>
    implements FavoritesCubit {}

void main() {
    TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
        SharedPreferences.setMockInitialValues({});

    await Supabase.initialize(
      url: 'https://example.supabase.co',
      publishableKey: 'test-publishable-key',
    );
  });
  late MockFindDoctorsCubit findDoctorsCubit;
  late MockFavoritesCubit favoritesCubit;

  const doctor = DoctorModel(
    id: 'doctor-1',
    fullName: 'Mohamed Ahmed',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    rating: 4.5,
    reviewsCount: 20,
    fee: 10,
    isActive: true,
  );

  setUp(() {
    findDoctorsCubit = MockFindDoctorsCubit();
    favoritesCubit = MockFavoritesCubit();

    when(() => findDoctorsCubit.state).thenReturn(FindDoctorsInitial());
    when(() => favoritesCubit.state).thenReturn(const FavoritesState());
  });

  Widget createWidget({String? initialQuery}) {
    return TranslationProvider(
      child: MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<FindDoctorsCubit>.value(value: findDoctorsCubit),
            BlocProvider<FavoritesCubit>.value(value: favoritesCubit),
          ],
          child: FindDoctorsScreen(initialQuery: initialQuery),
        ),
      ),
    );
  }

  group('FindDoctorsScreen', () {
    testWidgets('shows loading indicator', (tester) async {
      when(() => findDoctorsCubit.state).thenReturn(FindDoctorsLoading());

      await tester.pumpWidget(createWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message', (tester) async {
      when(
        () => findDoctorsCubit.state,
      ).thenReturn(const FindDoctorsError('Unable to load doctors'));

      await tester.pumpWidget(createWidget());

      expect(find.text('Unable to load doctors'), findsOneWidget);
    });

    testWidgets('shows empty state when no doctors are found', (tester) async {
      when(
        () => findDoctorsCubit.state,
      ).thenReturn(const FindDoctorsLoaded(doctors: [], query: 'unknown'));

      await tester.pumpWidget(createWidget());

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('initial query appears in the search field', (tester) async {
      when(() => findDoctorsCubit.state).thenReturn(FindDoctorsInitial());

      await tester.pumpWidget(createWidget(initialQuery: 'Mohamed'));

      expect(find.text('Mohamed'), findsOneWidget);
    });

    testWidgets('shows doctor when loaded', (tester) async {
      when(
        () => findDoctorsCubit.state,
      ).thenReturn(const FindDoctorsLoaded(doctors: [doctor], query: ''));

      await tester.pumpWidget(createWidget());

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
    });
  });
}
