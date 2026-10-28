import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/top_rated_doctors_section.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DoctorModel doctor1;
  late DoctorModel doctor2;

  setUp(() {
    doctor1 = DoctorModel(
      id: 'doctor-1',
      fullName: 'Mohamed Ahmed',
      imageUrl: '',
      specialtyName: 'Cardiology',
      rating: 4.5,
      reviewsCount: 10,
      fee: 100,
      isActive: true,
      specialtyId: 'specialty-1',
    );

    doctor2 = DoctorModel(
      id: 'doctor-2',
      fullName: 'Sara Ali',
      imageUrl: '',
      specialtyName: 'Dermatology',
      rating: 3.0,
      reviewsCount: 5,
      fee: 80,
      isActive: true,
      specialtyId: 'specialty-2',
    );
  });

  Widget createWidget({
    required List<DoctorModel> doctors,
    void Function(DoctorModel doctor)? onDoctorTap,
    VoidCallback? onSeeAllTap,
    bool Function(DoctorModel doctor)? isFavorite,
    void Function(DoctorModel doctor)? onFavoriteTap,
  }) {
    return TranslationProvider(
      child: MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(400, 900)),
          child: Scaffold(
            body: TopRatedDoctorsSection(
              doctors: doctors,
              onDoctorTap: onDoctorTap,
              onSeeAllTap: onSeeAllTap,
              isFavorite: isFavorite,
              onFavoriteTap: onFavoriteTap,
            ),
          ),
        ),
      ),
    );
  }

  group('TopRatedDoctorsSection', () {
    testWidgets('displays the section heading and see-all button', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget(doctors: [doctor1]));

      final t = Translations.of(
        tester.element(find.byType(TopRatedDoctorsSection)),
      );

      expect(find.text(t.topRatedDoctors), findsOneWidget);
      expect(find.text(t.seeAll), findsOneWidget);
    });

    testWidgets('displays all supplied doctors', (tester) async {
      await tester.pumpWidget(createWidget(doctors: [doctor1, doctor2]));

      expect(find.text('Mohamed Ahmed'), findsOneWidget);
      expect(find.text('Sara Ali'), findsOneWidget);
    });

    testWidgets('shows empty-state message when there are no doctors', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget(doctors: []));

      expect(find.text('Mohamed Ahmed'), findsNothing);
      expect(find.text('Sara Ali'), findsNothing);
    });

    testWidgets('uses a horizontal list for doctors', (tester) async {
      await tester.pumpWidget(createWidget(doctors: [doctor1, doctor2]));

      final listView = tester.widget<ListView>(find.byType(ListView));

      expect(listView.scrollDirection, Axis.horizontal);
      expect(find.text('Mohamed Ahmed'), findsOneWidget);
      expect(find.text('Sara Ali'), findsOneWidget);
    });

    testWidgets('calls onDoctorTap with the tapped doctor', (tester) async {
      DoctorModel? tappedDoctor;

      await tester.pumpWidget(
        createWidget(
          doctors: [doctor1],
          onDoctorTap: (doctor) => tappedDoctor = doctor,
        ),
      );

      await tester.tap(find.text('Mohamed Ahmed'), warnIfMissed: false);

      expect(tappedDoctor, same(doctor1));
    });

    testWidgets('calls onSeeAllTap when see-all is tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        createWidget(doctors: [doctor1], onSeeAllTap: () => tapped = true),
      );

      final t = Translations.of(
        tester.element(find.byType(TopRatedDoctorsSection)),
      );

      await tester.tap(find.text(t.seeAll));

      expect(tapped, isTrue);
    });

    testWidgets('shows a filled heart for a favorite doctor', (tester) async {
      await tester.pumpWidget(
        createWidget(doctors: [doctor1], isFavorite: (_) => true),
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
    });

    testWidgets('shows an outlined heart for a non-favorite doctor', (
      tester,
    ) async {
      await tester.pumpWidget(
        createWidget(doctors: [doctor1], isFavorite: (_) => false),
      );

      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });

    testWidgets('calls onFavoriteTap with the correct doctor', (tester) async {
      DoctorModel? favoriteTappedDoctor;

      await tester.pumpWidget(
        createWidget(
          doctors: [doctor1],
          onFavoriteTap: (doctor) {
            favoriteTappedDoctor = doctor;
          },
        ),
      );

      await tester.tap(find.byIcon(Icons.favorite_border));

      expect(favoriteTappedDoctor, same(doctor1));
    });

    testWidgets('displays the doctor rating', (tester) async {
      await tester.pumpWidget(createWidget(doctors: [doctor1]));

      expect(find.text('4.5'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('does not throw when optional callbacks are omitted', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget(doctors: [doctor1]));

      expect(tester.takeException(), isNull);
    });
  });
}
