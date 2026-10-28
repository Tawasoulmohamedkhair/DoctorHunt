
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/data/repository/favorite_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/screen/home_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeCubit extends MockCubit<HomeState>
    implements HomeCubit {}

class MockAuthCubit extends MockCubit<AuthCubitState>
    implements AuthCubit {}

class MockFavoritesCubit extends MockCubit<FavoritesState>
    implements FavoritesCubit {}

class MockFavoriteRepository extends Mock
    implements FavoriteRepository {}

void main() {
  late MockHomeCubit homeCubit;
  late MockAuthCubit authCubit;
  late MockFavoritesCubit favoritesCubit;

  const patient = UserModel(
    id: 'patient-1',
    fullName: 'Test Patient',
    email: 'patient@example.com',
    role: 'patient',
    isActive: true,
  );

  const admin = UserModel(
    id: 'admin-1',
    fullName: 'Test Admin',
    email: 'admin@example.com',
    role: 'admin',
    isActive: true,
  );

  setUp(() {
    homeCubit = MockHomeCubit();
    authCubit = MockAuthCubit();
    favoritesCubit = MockFavoritesCubit();

    when(() => homeCubit.state).thenReturn(const HomeInitial());
    when(() => authCubit.state).thenReturn(const AuthCubitState());
    when(() => favoritesCubit.state).thenReturn(const FavoritesState());

    when(() => homeCubit.loadHomeData()).thenAnswer((_) async {});
    when(
      () => favoritesCubit.loadFavorites(any()),
    ).thenAnswer((_) async {});
  });

  Widget createWidget() {
    return TranslationProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>.value(value: homeCubit),
          BlocProvider<AuthCubit>.value(value: authCubit),
          BlocProvider<FavoritesCubit>.value(value: favoritesCubit),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );
  }

  group('HomeScreen', () {
    testWidgets('shows loading indicator when home is loading',
        (tester) async {
      when(() => homeCubit.state).thenReturn(const HomeLoading());

      await tester.pumpWidget(createWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      verify(() => homeCubit.loadHomeData()).called(1);
    });

    testWidgets('shows error message when home loading fails',
        (tester) async {
      when(() => homeCubit.state).thenReturn(
        const HomeError('Unable to load doctors'),
      );

      await tester.pumpWidget(createWidget());

      expect(find.text('Unable to load doctors'), findsOneWidget);
    });

    testWidgets('loads favorites for a patient after the first frame',
        (tester) async {
      when(() => authCubit.state).thenReturn(
        const AuthCubitState(
          status: AuthStatus.success,
          user: patient,
        ),
      );

      when(() => homeCubit.state).thenReturn(const HomeLoading());

      await tester.pumpWidget(createWidget());
      await tester.pump();

      verify(() => favoritesCubit.loadFavorites(patient.id)).called(1);
    });

    testWidgets('does not load favorites when there is no signed-in user',
        (tester) async {
      when(() => authCubit.state).thenReturn(const AuthCubitState());
      when(() => homeCubit.state).thenReturn(const HomeLoading());

      await tester.pumpWidget(createWidget());
      await tester.pump();

      verifyNever(() => favoritesCubit.loadFavorites(any()));
    });

    testWidgets('does not load favorites for a non-patient user',
        (tester) async {
      when(() => authCubit.state).thenReturn(
        const AuthCubitState(
          status: AuthStatus.success,
          user: admin,
        ),
      );
      when(() => homeCubit.state).thenReturn(const HomeLoading());

      await tester.pumpWidget(createWidget());
      await tester.pump();

      verifyNever(() => favoritesCubit.loadFavorites(any()));
    });
  });
}
