
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/header_widget.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/search_bar.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    LocaleSettings.setLocale(AppLocale.en);
  });

  Widget createWidget({
    String userName = 'Mohamed',
    String? avatarUrl,
    VoidCallback? onMenuPressed,
    VoidCallback? onSearchTap,
  }) {
    return TranslationProvider(
      child: MaterialApp(
        home: Scaffold(
          body: HeaderWidget(
            userName: userName,
            avatarUrl: avatarUrl,
            onMenuPressed: onMenuPressed,
            onSearchTap: onSearchTap,
          ),
        ),
      ),
    );
  }

  group('HeaderWidget', () {
    testWidgets('displays the user greeting and doctor heading', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget());

      expect(find.textContaining('Mohamed'), findsOneWidget);
      expect(find.textContaining('Doctor'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('displays the menu button', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onMenuPressed when menu is tapped', (
      tester,
    ) async {
      var wasPressed = false;

      await tester.pumpWidget(
        createWidget(
          onMenuPressed: () => wasPressed = true,
        ),
      );

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('renders the search bar', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(CustomSearchBar), findsOneWidget);
    });

    testWidgets('calls onSearchTap when the search bar is tapped', (
      tester,
    ) async {
      var wasPressed = false;

      await tester.pumpWidget(
        createWidget(
          onSearchTap: () => wasPressed = true,
        ),
      );

      final searchBar = find.byType(CustomSearchBar);

      await tester.tap(searchBar);
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('renders the profile avatar container', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('handles a long user name without layout errors', (
      tester,
    ) async {
      await tester.pumpWidget(
        createWidget(
          userName:
              'Mohamed Ahmed Abdulrahman Al Balushi Long Username',
        ),
      );

      await tester.pump();

      expect(find.byType(HeaderWidget), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
