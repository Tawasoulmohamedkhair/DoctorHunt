import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/widgets.dart';

String localizeMedicalService(BuildContext context, String serviceName) {
  final translations = Translations.of(context);
  final normalized = serviceName
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'[_-]+'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ');

  final translationKey = switch (normalized) {
    'consultation' || 'medical consultation' => 'medicalConsultation',
    'follow up' || 'followup' => 'followUp',
    'checkup' || 'general checkup' || 'general examination' =>
      'generalCheckup',
    'dental checkup' || 'dental examination' => 'dentalCheckup',
    'cleaning' || 'dental cleaning' || 'teeth cleaning' => 'teethCleaning',
    'root canal' || 'root canal treatment' => 'rootCanalTreatment',
    'tooth extraction' || 'dental extraction' => 'toothExtraction',
    _ => null,
  };

  if (translationKey != null) {
    return translations[translationKey] as String;
  }

  return translations[serviceName] as String? ?? serviceName;
}
