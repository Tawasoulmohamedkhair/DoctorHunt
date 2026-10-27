import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/screens/setting_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository authRepository;
  late UserModel user;
  late GoRouter router;

  setUp(() async {
    await getIt.reset();

    authRepository = MockAuthRepository();

    user = const UserModel(
      id: 'patient-123',
      fullName: 'Test Patient',
      email: 'patient@example.com',
      phone: '12345678',
      avatarUrl: null,
      role: 'patient',
      isActive: true,
    );

    getIt.registerSingleton<AuthRepository>(authRepository);
    getIt.registerFactory<SettingsCubit>(() => SettingsCubit(authRepository));

    when(
      () => authRepository.getCurrentUserProfile(),
    ).thenAnswer((_) async => user);

    when(() => authRepository.currentUserEmail).thenReturn(user.email);

    router = GoRouter(
      initialLocation: '/settings',
      routes: [
        GoRoute(path: '/settings', builder: (_, _) => const SettingScreen()),
        GoRoute(
          path: '/choose-role',
          builder: (_, _) => const Scaffold(body: Text('Choose Role Page')),
        ),
      ],
    );
  });

  tearDown(() async {
    router.dispose();
    await getIt.reset();
  });

  Future<void> openSettings(WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      TranslationProvider(child: MaterialApp.router(routerConfig: router)),
    );

    await tester.pumpAndSettle();
  }

  group('SettingScreen', () {
    testWidgets('displays settings and the loaded user profile', (
      tester,
    ) async {
      await openSettings(tester);

      final t = Translations.of(tester.element(find.byType(SettingScreen)));

      expect(find.text(t.settings), findsOneWidget);
      expect(find.text('Test Patient'), findsOneWidget);
      expect(find.text('patient@example.com'), findsOneWidget);
      expect(find.text(t.accountSettings), findsOneWidget);
      expect(find.text(t.privacyPolicy), findsOneWidget);
      expect(find.text(t.languages), findsOneWidget);
      expect(find.text(t.logout), findsOneWidget);

      verify(() => authRepository.getCurrentUserProfile()).called(1);
    });

    testWidgets('shows an error when loading the profile fails', (
      tester,
    ) async {
      when(
        () => authRepository.getCurrentUserProfile(),
      ).thenThrow(Exception('Profile loading failed'));

      await openSettings(tester);

      final t = Translations.of(tester.element(find.byType(SettingScreen)));

      expect(find.text(t.settings), findsOneWidget);
      expect(find.text(t.accountSettings), findsOneWidget);
    });

    testWidgets('opens the language selection dialog', (tester) async {
      await openSettings(tester);

      final t = Translations.of(tester.element(find.byType(SettingScreen)));

      await tester.tap(find.text(t.languages));
      await tester.pumpAndSettle();

      expect(find.text(t.chooseLanguage), findsNWidgets(2));
      expect(find.text(t.english), findsOneWidget);
      expect(find.text(t.arabic), findsOneWidget);
    });
  });
}
