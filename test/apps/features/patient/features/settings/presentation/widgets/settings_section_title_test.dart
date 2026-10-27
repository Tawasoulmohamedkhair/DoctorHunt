import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingsSectionTitle', () {
    testWidgets('displays the provided title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SettingsSectionTitle(title: 'Account Settings')),
        ),
      );

      expect(find.text('Account Settings'), findsOneWidget);
    });

    testWidgets('does not display an unrelated title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SettingsSectionTitle(title: 'Account Settings')),
        ),
      );

      expect(find.text('Notification Settings'), findsNothing);
    });
  });
}
