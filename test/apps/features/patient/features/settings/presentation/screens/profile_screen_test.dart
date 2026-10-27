import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/screens/profile_screen.dart';
import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class TestAuthCubit extends AuthCubit {
  TestAuthCubit(super.authRepository);

  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
  }
}

void main() {
  late MockAuthRepository repository;
  late TestAuthCubit authCubit;
  late UserModel user;

  setUp(() async {
    await getIt.reset();

    repository = MockAuthRepository();

    getIt.registerSingleton<AuthRepository>(repository);

    user = const UserModel(
      id: 'patient-123',
      fullName: 'Test Patient',
      email: 'patient@example.com',
      phone: '12345678',
      avatarUrl: null,
      role: 'patient',
      isActive: true,
    );

    authCubit = TestAuthCubit(repository)..setUser(user);

    when(() => repository.hasCurrentUser).thenReturn(true);
    when(() => repository.currentUserId).thenReturn(user.id);
  });

  tearDown(() async {
    await authCubit.close();
    await getIt.reset();
  });

  Future<void> openProfile(WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      TranslationProvider(
        child: BlocProvider<AuthCubit>.value(
          value: authCubit,
          child: MaterialApp(
            home: Builder(
              builder: (context) => Scaffold(
                body: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: const Text('Open profile'),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open profile'));
    await tester.pumpAndSettle();
  }

  group('ProfileScreen', () {
    testWidgets('displays the current user profile', (tester) async {
      await openProfile(tester);

      expect(find.text('Test Patient'), findsOneWidget);
      expect(find.text('12345678'), findsOneWidget);

      verifyNever(
        () => repository.getCurrentUserProfile(
          throwIfMissing: any(named: 'throwIfMissing'),
        ),
      );
    });

    testWidgets('shows validation message when name is empty', (tester) async {
      await openProfile(tester);

      final fields = find.byType(TextFormField);
      expect(fields, findsNWidgets(2));

      await tester.enterText(fields.at(0), '');
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();

      expect(
        find.text(
          Translations.of(
            tester.element(find.byType(ProfileScreen)),
          ).enterYourFullName,
        ),
        findsWidgets,
      );

      verifyNever(
        () => repository.updateCurrentUserProfile(
          fullName: any(named: 'fullName'),
          phone: any(named: 'phone'),
          currentAvatarUrl: any(named: 'currentAvatarUrl'),
          newAvatar: any(named: 'newAvatar'),
        ),
      );
    });

    testWidgets('shows validation message when phone is empty', (tester) async {
      await openProfile(tester);

      final fields = find.byType(TextFormField);
      expect(fields, findsNWidgets(2));

      await tester.enterText(fields.at(1), '');
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();

      expect(
        find.text(
          Translations.of(
            tester.element(find.byType(ProfileScreen)),
          ).enterYourPhoneNumber,
        ),
        findsWidgets,
      );

      verifyNever(
        () => repository.updateCurrentUserProfile(
          fullName: any(named: 'fullName'),
          phone: any(named: 'phone'),
          currentAvatarUrl: any(named: 'currentAvatarUrl'),
          newAvatar: any(named: 'newAvatar'),
        ),
      );
    });

    testWidgets('saves profile and updates AuthCubit on success', (
      tester,
    ) async {
      when(
        () => repository.updateCurrentUserProfile(
          fullName: 'Updated Patient',
          phone: '87654321',
          currentAvatarUrl: null,
          newAvatar: null,
        ),
      ).thenAnswer((_) async => null);

      await openProfile(tester);

      final fields = find.byType(TextFormField);
      expect(fields, findsNWidgets(2));

      await tester.enterText(fields.at(0), 'Updated Patient');
      await tester.enterText(fields.at(1), '87654321');
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();

      verify(
        () => repository.updateCurrentUserProfile(
          fullName: 'Updated Patient',
          phone: '87654321',
          currentAvatarUrl: null,
          newAvatar: null,
        ),
      ).called(1);

      expect(authCubit.state.user?.fullName, 'Updated Patient');
      expect(authCubit.state.user?.phone, '87654321');
    });

    testWidgets('shows an error message when saving fails', (tester) async {
      when(
        () => repository.updateCurrentUserProfile(
          fullName: 'Updated Patient',
          phone: '87654321',
          currentAvatarUrl: null,
          newAvatar: null,
        ),
      ).thenThrow(Exception('Database error'));

      await openProfile(tester);

      final fields = find.byType(TextFormField);

      await tester.enterText(fields.at(0), 'Updated Patient');
      await tester.enterText(fields.at(1), '87654321');
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();

      expect(
        find.text(
          Translations.of(
            tester.element(find.byType(ProfileScreen)),
          ).unableToSaveProfile,
        ),
        findsOneWidget,
      );

      expect(authCubit.state.user?.fullName, 'Test Patient');
    });
  });
}
