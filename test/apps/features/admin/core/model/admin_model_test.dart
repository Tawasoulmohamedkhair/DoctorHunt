import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminModel Equatable behavior', () {
    test('models with the same values, including optional values, are equal', () {
      const first = AdminModel(
        fullName: 'A. Admin',
        email: 'admin@example.com',
        avatarUrl: 'https://example.com/avatar.png',
        clinicLocation: 'Muscat',
        latitude: 23.6,
        longitude: 58.4,
      );
      const second = AdminModel(
        fullName: 'A. Admin',
        email: 'admin@example.com',
        avatarUrl: 'https://example.com/avatar.png',
        clinicLocation: 'Muscat',
        latitude: 23.6,
        longitude: 58.4,
      );

      expect(first, second);
      expect(first.props, [
        'A. Admin',
        'admin@example.com',
        'https://example.com/avatar.png',
        'Muscat',
        23.6,
        58.4,
      ]);
    });

    test('models differ when optional values differ or are absent', () {
      const withoutOptionalValues = AdminModel(
        fullName: 'A. Admin',
        email: 'admin@example.com',
        clinicLocation: 'Muscat',
      );
      const withAvatar = AdminModel(
        fullName: 'A. Admin',
        email: 'admin@example.com',
        avatarUrl: 'https://example.com/avatar.png',
        clinicLocation: 'Muscat',
      );

      expect(withoutOptionalValues, isNot(withAvatar));
      expect(withoutOptionalValues.latitude, isNull);
      expect(withoutOptionalValues.longitude, isNull);
    });
  });

  group('SpecialtyModel.fromMap', () {
    test('converts valid map values', () {
      expect(
        SpecialtyModel.fromMap({'id': 'specialty-1', 'name': 'Cardiology'}),
        const SpecialtyModel(id: 'specialty-1', name: 'Cardiology'),
      );
    });

    test('throws when required values are absent or have the wrong type', () {
      expect(() => SpecialtyModel.fromMap({'name': 'Cardiology'}), throwsA(isA<TypeError>()));
      expect(() => SpecialtyModel.fromMap({'id': 1, 'name': 'Cardiology'}), throwsA(isA<TypeError>()));
    });
  });
}
