
import 'package:doctor_hunt/apps/core/widgets/patient_drawer.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late int homeTapCount;
  late int favouritesTapCount;
  late int appointmentsTapCount;
  late int settingsTapCount;
  late int logoutTapCount;

  setUp(() {
    homeTapCount = 0;
    favouritesTapCount = 0;
    appointmentsTapCount = 0;
    settingsTapCount = 0;
    logoutTapCount = 0;
  });

  Widget buildTestWidget({
    String userName = 'Test Patient',
    String? avatarUrl,
    int selectedIndex = 0,
  }) {
    return TranslationProvider(
      child: MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 320,
            height: 700,
            child: PatientDrawer(
              userName: userName,
              avatarUrl: avatarUrl,
              selectedIndex: selectedIndex,
              onHomeTap: () => homeTapCount++,
              onFavouritesTap: () => favouritesTapCount++,
              onAppointmentsTap: () => appointmentsTapCount++,
              onSettingsTap: () => settingsTapCount++,
              onLogoutTap: () => logoutTapCount++,
            ),
          ),
        ),
      ),
    );
  }

  group('PatientDrawer', () {
    testWidgets('displays the user name', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.text('Test Patient'), findsOneWidget);
    });

    testWidgets('shows the default person icon when avatar is absent',
        (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('shows the person icon when avatar URL is empty',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(avatarUrl: '   '),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

  
testWidgets('creates a network image when avatar URL is provided',
    (tester) async {
  final previousErrorBuilder = FlutterError.onError;
  FlutterError.onError = (details) {
    // Ignore image-loading errors in this test only.
    if (details.exception is NetworkImageLoadException) {
      return;
    }
    previousErrorBuilder?.call(details);
  };

  addTearDown(() {
    FlutterError.onError = previousErrorBuilder;
  });

  await tester.pumpWidget(
    buildTestWidget(
      avatarUrl: 'https://example.com/avatar.png',
    ),
  );

  final avatar = tester.widget<CircleAvatar>(
    find.byType(CircleAvatar),
  );

  expect(avatar.backgroundImage, isA<NetworkImage>());

  final imageProvider = avatar.backgroundImage as NetworkImage;

  expect(
    imageProvider.url,
    'https://example.com/avatar.png',
  );

  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
});


    testWidgets('displays all navigation items', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.text(t.home), findsOneWidget);
      expect(find.text(t.favorites), findsOneWidget);
      expect(find.text(t.myappointments), findsOneWidget);
      expect(find.text(t.settings), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);
    });

    testWidgets('calls onHomeTap when Home is tapped', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.tap(find.text(t.home));
      await tester.pump();

      expect(homeTapCount, 1);
      expect(favouritesTapCount, 0);
      expect(appointmentsTapCount, 0);
      expect(settingsTapCount, 0);
      expect(logoutTapCount, 0);
    });

    testWidgets('calls onFavouritesTap when Favorites is tapped',
        (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.tap(find.text(t.favorites));
      await tester.pump();

      expect(favouritesTapCount, 1);
    });

    testWidgets('calls onAppointmentsTap when appointments is tapped',
        (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.tap(find.text(t.myappointments));
      await tester.pump();

      expect(appointmentsTapCount, 1);
    });

    testWidgets('calls onSettingsTap when Settings is tapped',
        (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.tap(find.text(t.settings));
      await tester.pump();

      expect(settingsTapCount, 1);
    });

    testWidgets('calls onLogoutTap when Logout is tapped', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.tap(find.text('Logout'));
      await tester.pump();

      expect(logoutTapCount, 1);
    });

    testWidgets('uses selected icon for Home when selectedIndex is zero',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(selectedIndex: 0),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.home_outlined), findsNothing);
    });

    testWidgets('uses selected icon for Favorites when selectedIndex is one',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(selectedIndex: 1),
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
    });

    testWidgets(
        'uses selected icon for appointments when selectedIndex is two',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(selectedIndex: 2),
      );

      expect(find.byIcon(Icons.menu_book), findsOneWidget);
      expect(find.byIcon(Icons.menu_book_outlined), findsNothing);
    });

    testWidgets('uses selected icon for Settings when selectedIndex is three',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(selectedIndex: 3),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.byIcon(Icons.settings_outlined), findsNothing);
    });

    testWidgets('displays the logout icon', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.byIcon(Icons.logout), findsOneWidget);
    });
  });
}
