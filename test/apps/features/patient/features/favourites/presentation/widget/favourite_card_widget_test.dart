import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/widget/favourite_card_widget.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DoctorModel doctor;
  var favoriteTapCount = 0;

  setUp(() {
    doctor = const DoctorModel(
      id: 'doctor-1',
      fullName: 'Mohamed Ahmed',
      specialtyId: 'specialty-1',
      specialtyName: 'Cardiology',
      imageUrl: null,
      rating: 4.8,
      reviewsCount: 25,
      fee: 15.0,
      isActive: true,
    );

    favoriteTapCount = 0;
  });

  Widget createWidget() {
    return TranslationProvider(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: FavoriteDoctorCard(
              doctor: doctor,
              onFavoriteTap: () {
                favoriteTapCount++;
              },
            ),
          ),
        ),
      ),
    );
  }

  group('FavoriteDoctorCard', () {
    testWidgets('displays the doctor name', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
    });

    testWidgets('displays the doctor specialty', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.text('Cardiology'), findsOneWidget);
    });

    testWidgets('displays the favorite icon', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('calls onFavoriteTap when favorite icon is tapped', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget());

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();

      expect(favoriteTapCount, 1);
    });

    testWidgets('renders the card with the expected dimensions', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget());

      final sizedBoxFinder = find.byWidgetPredicate(
        (widget) =>
            widget is SizedBox && widget.width == 160 && widget.height == 180,
      );

      expect(sizedBoxFinder, findsOneWidget);

      final size = tester.getSize(sizedBoxFinder);

      expect(size.width, 160);
      expect(size.height, 180);
    });
  });
}
