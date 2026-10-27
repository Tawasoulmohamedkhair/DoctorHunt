import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_profile_card.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidget(SettingsState state) {
    return TranslationProvider(
      child: MaterialApp(
        home: Scaffold(body: SettingsProfileCard(state: state)),
      ),
    );
  }

  group('SettingsProfileCard', () {
    testWidgets('displays user name and email', (tester) async {
      const state = SettingsState(
        profileStatus: SettingsProfileStatus.success,
        userName: 'Mohamed Ahmed',
        userEmail: 'mohamed@example.com',
      );

      await tester.pumpWidget(createWidget(state));

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
      expect(find.text('mohamed@example.com'), findsOneWidget);
    });

    testWidgets('displays loading text while profile is loading', (
      tester,
    ) async {
      const state = SettingsState(
        profileStatus: SettingsProfileStatus.loading,
        userName: 'Mohamed Ahmed',
        userEmail: 'mohamed@example.com',
      );

      await tester.pumpWidget(createWidget(state));

      expect(find.text(t.loading), findsOneWidget);
      expect(find.text('mohamed@example.com'), findsOneWidget);
    });

    testWidgets('uses fallback name when user name is empty', (tester) async {
      const state = SettingsState(
        userName: '',
        userEmail: 'mohamed@example.com',
      );

      await tester.pumpWidget(createWidget(state));

      expect(find.text(t.patientUser), findsOneWidget);
    });

    testWidgets('renders avatar image widget', (tester) async {
      const state = SettingsState(
        userName: 'Mohamed Ahmed',
        userEmail: 'mohamed@example.com',
        avatarUrl: null,
      );

      await tester.pumpWidget(createWidget(state));

      expect(find.byIcon(Icons.person), findsOneWidget);
    });
  });
}
