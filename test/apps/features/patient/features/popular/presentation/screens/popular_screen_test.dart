import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/popular/presentation/screens/popular_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class MockFavoritesCubit extends MockCubit<FavoritesState>
    implements FavoritesCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockHomeCubit homeCubit;
  late MockFavoritesCubit favoritesCubit;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});

    await Supabase.initialize(
      url: 'https://example.supabase.co',
      publishableKey: 'test-publishable-key',
    );
  });

  setUp(() {
    homeCubit = MockHomeCubit();
    favoritesCubit = MockFavoritesCubit();

    when(() => homeCubit.state).thenReturn(const HomeInitial());
    when(() => favoritesCubit.state).thenReturn(const FavoritesState());
  });

  Widget createWidget() {
    return TranslationProvider(
      child: MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>.value(value: homeCubit),
            BlocProvider<FavoritesCubit>.value(value: favoritesCubit),
          ],
          child: const PopularScreen(),
        ),
      ),
    );
  }

  group('PopularScreen', () {
    testWidgets('shows loading indicator initially', (tester) async {
      when(() => homeCubit.state).thenReturn(const HomeInitial());

      await tester.pumpWidget(createWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows loading indicator while loading', (tester) async {
      when(() => homeCubit.state).thenReturn(const HomeLoading());

      await tester.pumpWidget(createWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when loading fails', (tester) async {
      when(
        () => homeCubit.state,
      ).thenReturn(const HomeError('Unable to load doctors'));

      await tester.pumpWidget(createWidget());

      expect(find.text('Unable to load doctors'), findsOneWidget);
    });

    testWidgets('shows empty state when there are no popular doctors', (
      tester,
    ) async {
      when(
        () => homeCubit.state,
      ).thenReturn(const HomeLoaded(popularDoctors: [], topRatedDoctors: []));

      await tester.pumpWidget(createWidget());

      expect(find.byType(PopularScreen), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('shows popular doctor when loaded', (tester) async {
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

      when(() => homeCubit.state).thenReturn(
        const HomeLoaded(popularDoctors: [doctor], topRatedDoctors: []),
      );

      await tester.pumpWidget(createWidget());

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
    });
  });
}
