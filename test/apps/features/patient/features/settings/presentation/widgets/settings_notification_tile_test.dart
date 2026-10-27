import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_notification_tile.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays notification icon and translated label', (
    tester,
  ) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: const MaterialApp(
          home: Scaffold(body: SettingsNotificationTile()),
        ),
      ),
    );

    expect(find.byIcon(Icons.notifications_none), findsOneWidget);
    expect(find.text(t.notifications), findsOneWidget);
  });
}
