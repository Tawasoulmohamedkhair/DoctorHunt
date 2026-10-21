import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/widgets.dart';

String localizeSpecialty(BuildContext context, String specialtyName) {
  final translations = Translations.of(context);

  return switch (specialtyName.trim().toLowerCase()) {
    'cardiology' => translations.cardiology,
    'dentistry' => translations.dentistry,
    'dermatology' => translations.dermatology,
    'general medicine' => translations.generalMedicine,
    'internal medicine' => translations.internalMedicine,
    'neurology' => translations.neurology,
    'ophthalmology' => translations.ophthalmology,
    'pediatrics' => translations.pediatrics,
    _ => specialtyName,
  };
}
