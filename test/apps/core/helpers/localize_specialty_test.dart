import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('localizeSpecialty', () {
    testWidgets('returns the translated name for each supported specialty', (
      tester,
    ) async {
      late Translations translations;

      await tester.pumpWidget(
        TranslationProvider(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Builder(
              builder: (context) {
                translations = Translations.of(context);
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );

      final context = tester.element(find.byType(SizedBox));

      final specialties = <String, String>{
        'cardiology': translations.cardiology,
        'dentistry': translations.dentistry,
        'dermatology': translations.dermatology,
        'general medicine': translations.generalMedicine,
        'internal medicine': translations.internalMedicine,
        'neurology': translations.neurology,
        'ophthalmology': translations.ophthalmology,
        'pediatrics': translations.pediatrics,
      };

      for (final entry in specialties.entries) {
        expect(
          localizeSpecialty(context, entry.key),
          entry.value,
          reason: 'Failed to localize ${entry.key}',
        );
      }
    });

    testWidgets('ignores leading and trailing whitespace', (tester) async {
      await tester.pumpWidget(
        TranslationProvider(
          child: Directionality(
            textDirection: TextDirection.ltr,

            child: Builder(
              builder: (context) =>
                  Text(localizeSpecialty(context, '  cardiology  ')),
            ),
          ),
        ),
      );

      final context = tester.element(find.byType(Text));

      expect(
        localizeSpecialty(context, '  cardiology  '),
        Translations.of(context).cardiology,
      );
    });

    testWidgets('ignores letter case', (tester) async {
      await tester.pumpWidget(
        TranslationProvider(
          child: Directionality(
            textDirection: TextDirection.ltr,

            child: Builder(
              builder: (context) =>
                  Text(localizeSpecialty(context, 'CARDIOLOGY')),
            ),
          ),
        ),
      );

      final context = tester.element(find.byType(Text));

      expect(
        localizeSpecialty(context, 'CARDIOLOGY'),
        Translations.of(context).cardiology,
      );
    });

    testWidgets('returns the original name for an unknown specialty', (
      tester,
    ) async {
      const specialtyName = 'Plastic Surgery';

      await tester.pumpWidget(
        TranslationProvider(
          child:  Directionality(
                        textDirection: TextDirection.ltr,

            child: Builder(
              builder: (context) =>
                  Text(localizeSpecialty(context, specialtyName)),
            ),
          ),
        ),
      );

      final context = tester.element(find.byType(Text));

      expect(localizeSpecialty(context, specialtyName), specialtyName);
    });
  });
}
