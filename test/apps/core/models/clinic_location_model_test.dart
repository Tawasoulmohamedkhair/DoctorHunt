import 'package:doctor_hunt/apps/core/models/clinic_location_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClinicLocationModel.fromMap', () {
    test('converts string and numeric coordinates', () {
      final location = ClinicLocationModel.fromMap({
        'location': '  Muscat Clinic  ',
        'latitude': 23.6,
        'longitude': '58.4',
      });

      expect(location.location, '  Muscat Clinic  ');
      expect(location.latitude, 23.6);
      expect(location.longitude, 58.4);
    });

    test('keeps absent or invalid values nullable', () {
      final location = ClinicLocationModel.fromMap({
        'latitude': 'not-a-number',
      });

      expect(location.location, isNull);
      expect(location.latitude, isNull);
      expect(location.longitude, isNull);
    });

    test('converts numeric and numeric string coordinates', () {
      final location = ClinicLocationModel.fromMap({
        'latitude': 23,
        'longitude': '58.4',
      });

      expect(location.latitude, 23.0);
      expect(location.longitude, 58.4);
    });

    test('returns null for non-finite coordinates', () {
      final location = ClinicLocationModel.fromMap({
        'latitude': double.nan,
        'longitude': double.infinity,
      });
      final negativeInfinity = ClinicLocationModel.fromMap({
        'latitude': double.negativeInfinity,
      });

      expect(location.latitude, isNull);
      expect(location.longitude, isNull);
      expect(negativeInfinity.latitude, isNull);
    });

    test('returns null for non-finite numeric strings', () {
      final location = ClinicLocationModel.fromMap({
        'latitude': 'NaN',
        'longitude': 'Infinity',
      });
      final negativeInfinity = ClinicLocationModel.fromMap({
        'latitude': '-Infinity',
      });

      expect(location.latitude, isNull);
      expect(location.longitude, isNull);
      expect(negativeInfinity.latitude, isNull);
    });
  });
}
