
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/widgets/app_image.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/core/widgets/doctor_card.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoctorCard', () {
    late DoctorModel doctor;

    setUp(() {
      doctor = createDoctor();
    });

    Future<void> pumpDoctorCard(
      WidgetTester tester, {
      required DoctorModel doctor,
      bool isFavorite = false,
      bool showFee = false,
      bool showButton = false,
      String buttonLabel = 'Book Now',
      VoidCallback? onTap,
      VoidCallback? onFavoriteTap,
      VoidCallback? onButtonTap,
    }) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1;

      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        TranslationProvider(
          child: MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: DoctorCard(
                  doctor: doctor,
                  isFavorite: isFavorite,
                  showFee: showFee,
                  showButton: showButton,
                  buttonLabel: buttonLabel,
                  onTap: onTap,
                  onFavoriteTap: onFavoriteTap,
                  onButtonTap: onButtonTap,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
    }

    testWidgets('renders doctor name and specialty', (tester) async {
      await pumpDoctorCard(tester, doctor: doctor);

      expect(find.text(doctor.fullName), findsOneWidget);
      expect(find.byType(DoctorCard), findsOneWidget);
    });

    testWidgets('renders doctor image widget', (tester) async {
      await pumpDoctorCard(tester, doctor: doctor);

      expect(find.byType(AppImage), findsOneWidget);
    });

    testWidgets('shows an outlined favorite icon by default', (
      tester,
    ) async {
      await pumpDoctorCard(tester, doctor: doctor);

      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });

    testWidgets('shows a filled favorite icon when isFavorite is true', (
      tester,
    ) async {
      await pumpDoctorCard(
        tester,
        doctor: doctor,
        isFavorite: true,
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
    });

    testWidgets('calls onTap when the card is tapped', (tester) async {
      var tapped = false;

      await pumpDoctorCard(
        tester,
        doctor: doctor,
        onTap: () => tapped = true,
      );

      await tester.tap(find.byType(DoctorCard));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('calls onFavoriteTap when favorite icon is tapped', (
      tester,
    ) async {
      var favoriteTapped = false;

      await pumpDoctorCard(
        tester,
        doctor: doctor,
        onFavoriteTap: () => favoriteTapped = true,
      );

      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      expect(favoriteTapped, isTrue);
    });

    testWidgets('renders five rating icons in list mode', (tester) async {
      await pumpDoctorCard(tester, doctor: doctor);

      final ratingIcons = find.byWidgetPredicate(
        (widget) =>
            widget is Icon &&
            {
              Icons.star,
              Icons.star_half,
              Icons.star_border,
            }.contains(widget.icon),
      );

      expect(ratingIcons, findsNWidgets(5));
    });

    testWidgets('renders the details button when showButton is true', (
      tester,
    ) async {
      await pumpDoctorCard(
        tester,
        doctor: doctor,
        showButton: true,
      );

      expect(find.byType(CustomElevatedButton), findsOneWidget);
      expect(find.text('Book Now'), findsOneWidget);
    });

    testWidgets('uses the provided button label', (tester) async {
      await pumpDoctorCard(
        tester,
        doctor: doctor,
        showButton: true,
        buttonLabel: 'View Profile',
      );

      expect(find.text('View Profile'), findsOneWidget);
    });

    testWidgets('calls onButtonTap when the details button is tapped', (
      tester,
    ) async {
      var buttonTapped = false;

      await pumpDoctorCard(
        tester,
        doctor: doctor,
        showButton: true,
        onButtonTap: () => buttonTapped = true,
      );

      final buttonFinder = find.byType(CustomElevatedButton);

      await tester.ensureVisible(buttonFinder);
      await tester.tap(buttonFinder);
      await tester.pump();

      expect(buttonTapped, isTrue);
    });

    testWidgets('does not show the details button in list mode', (
      tester,
    ) async {
      await pumpDoctorCard(tester, doctor: doctor);

      expect(find.byType(CustomElevatedButton), findsNothing);
    });

    testWidgets('shows the fee when showFee is true', (tester) async {
      await pumpDoctorCard(
        tester,
        doctor: doctor,
        showButton: true,
        showFee: true,
      );

      final hours = Translations.of(
        tester.element(find.byType(DoctorCard)),
      ).hours;

      expect(
        find.text('\$${doctor.fee.toStringAsFixed(3)}/$hours'),
        findsOneWidget,
      );
    });

    testWidgets('hides the fee when showFee is false', (tester) async {
      await pumpDoctorCard(
        tester,
        doctor: doctor,
        showButton: true,
        showFee: false,
      );

      expect(
        find.text('\$${doctor.fee.toStringAsFixed(3)}'),
        findsNothing,
      );
    });

    testWidgets('shows half-star for a fractional rating', (tester) async {
      await pumpDoctorCard(tester, doctor: doctor);

      expect(find.byIcon(Icons.star_half), findsOneWidget);
    });

    testWidgets('clamps ratings above five stars', (tester) async {
      final highRatingDoctor = createDoctor(rating: 6);

      await pumpDoctorCard(
        tester,
        doctor: highRatingDoctor,
      );

      expect(find.byIcon(Icons.star), findsNWidgets(5));
      expect(find.byIcon(Icons.star_half), findsNothing);
      expect(find.byIcon(Icons.star_border), findsNothing);
    });

    testWidgets('clamps negative ratings to zero stars', (tester) async {
      final negativeRatingDoctor = createDoctor(rating: -1);

      await pumpDoctorCard(
        tester,
        doctor: negativeRatingDoctor,
      );

      expect(find.byIcon(Icons.star_border), findsNWidgets(5));
      expect(find.byIcon(Icons.star), findsNothing);
      expect(find.byIcon(Icons.star_half), findsNothing);
    });
  });
}

DoctorModel createDoctor({double rating = 4.5}) {
  return DoctorModel(
    id: 'doctor-1',
    fullName: 'Dr. Mohamed Ahmed',
    specialtyName: 'Cardiology',
    imageUrl: '',
    rating: rating,
    reviewsCount: 20,
    fee: 25,
    isActive: true,
    specialtyId: 'specialty-1',
  );
}