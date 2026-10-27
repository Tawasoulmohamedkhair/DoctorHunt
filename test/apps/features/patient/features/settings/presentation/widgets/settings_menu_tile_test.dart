import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingsMenuTile', () {
    testWidgets('displays title and subtitle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SettingsMenuTile(
              icon: Icons.person,
              iconColor: Colors.blue,
              title: 'Profile',
              subtitle: 'Manage your profile',
            ),
          ),
        ),
      );

      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Manage your profile'), findsOneWidget);
    });

    testWidgets('does not display subtitle when it is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SettingsMenuTile(
              icon: Icons.person,
              iconColor: Colors.blue,
              title: 'Profile',
            ),
          ),
        ),
      );

      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Manage your profile'), findsNothing);
    });

    testWidgets('displays trailing arrow when enabled and tappable', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsMenuTile(
              icon: Icons.person,
              iconColor: Colors.blue,
              title: 'Profile',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('hides trailing arrow when showArrow is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsMenuTile(
              icon: Icons.person,
              iconColor: Colors.blue,
              title: 'Profile',
              onTap: () {},
              showArrow: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_right), findsNothing);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsMenuTile(
              icon: Icons.person,
              iconColor: Colors.blue,
              title: 'Profile',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Profile'));
      expect(tapped, isTrue);
    });

    testWidgets('does not display arrow when onTap is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SettingsMenuTile(
              icon: Icons.person,
              iconColor: Colors.blue,
              title: 'Profile',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_right), findsNothing);
    });
  });
}
