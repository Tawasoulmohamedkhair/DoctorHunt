
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/widgets/app_image.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/doctor_info_card.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const doctor = DoctorModel(
    id: 'doctor-1',
    fullName: 'Mohamed Ahmed',
    specialtyId: 'specialty-1',
    specialtyName: 'Cardiology',
    imageUrl: null,
    rating: 4.5,
    reviewsCount: 20,
    fee: 15.0,
    isActive: true,
  );

  Future<void> pumpDoctorInfoCard(WidgetTester tester) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          home: Scaffold(
            body: DoctorInfoCard(doctor: doctor),
          ),
        ),
      ),
    );
  }

  group('DoctorInfoCard', () {
    testWidgets('displays the doctor name', (tester) async {
      await pumpDoctorInfoCard(tester);

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
    });

    testWidgets('displays the doctor specialty', (tester) async {
      await pumpDoctorInfoCard(tester);

      expect(find.text('Cardiology'), findsOneWidget);
    });

    testWidgets('displays the consultation fee', (tester) async {
      await pumpDoctorInfoCard(tester);

      final context = tester.element(find.byType(DoctorInfoCard));
      final feeLabel = Translations.of(context).fee;

      expect(find.text('$feeLabel: 15.0'), findsOneWidget);
    });

    testWidgets('renders AppImage when the doctor has no image', (
      tester,
    ) async {
      await pumpDoctorInfoCard(tester);

      expect(find.byType(AppImage), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('renders without throwing an exception', (tester) async {
      await pumpDoctorInfoCard(tester);

      expect(tester.takeException(), isNull);
    });
  });
}
