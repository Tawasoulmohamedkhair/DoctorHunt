import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoctorModel', () {
    const doctor = DoctorModel(
      id: 'doctor-1',
      fullName: 'Mohamed Ahmed',
      specialtyId: 'specialty-1',
      specialtyName: 'Cardiology',
      imageUrl: 'https://example.com/doctor.jpg',
      rating: 4.5,
      reviewsCount: 20,
      fee: 15.0,
      isActive: true,
    );

    group('Constructor', () {
      test('creates a DoctorModel with the correct values', () {
        expect(doctor.id, 'doctor-1');
        expect(doctor.fullName, 'Mohamed Ahmed');
        expect(doctor.specialtyId, 'specialty-1');
        expect(doctor.specialtyName, 'Cardiology');
        expect(doctor.imageUrl, 'https://example.com/doctor.jpg');
        expect(doctor.rating, 4.5);
        expect(doctor.reviewsCount, 20);
        expect(doctor.fee, 15.0);
        expect(doctor.isActive, true);
      });
      test('allows imageUrl to be null', () {
        const doctorWithoutImage = DoctorModel(
          id: 'doctor-2',
          fullName: 'Sara Ali',
          specialtyId: 'specialty-2',
          specialtyName: 'Dermatology',
          rating: 4.0,
          reviewsCount: 10,
          fee: 20.0,
          isActive: true,
        );
        expect(doctorWithoutImage.imageUrl, isNull);
      });
    });
    group('fromMap', () {
      test('creates a DoctorModel from a valid map', () {
        final map = <String, dynamic>{
          'id': 'doctor-1',
          'full_name': 'Mohamed Ahmed',
          'specialty_id': 'specialty-1',
          'specialties': <String, dynamic>{'name': 'Cardiology'},
          'image_url': 'https://example.com/doctor.jpg',
          'rating': 4.5,
          'reviews_count': 20,
          'fee': 15.0,
          'is_active': true,
        };
        final result = DoctorModel.fromMap(map);
        expect(result, doctor);
        expect(result.rating, isA<double>());
        expect(result.fee, isA<double>());
      });
      test('uses an empty specialty name when specialties is null', () {
        final map = <String, dynamic>{
          'id': 'doctor-2',
          'full_name': 'Sara Ali',
          'specialty_id': 'specialty-2',
          'specialties': null,
          'image_url': null,
          'rating': 4,
          'reviews_count': 10,
          'fee': 20,
          'is_active': true,
        };
        final result = DoctorModel.fromMap(map);
        expect(result.specialtyName, '');
        expect(result.imageUrl, isNull);
        expect(result.rating, 4.0);
        expect(result.fee, 20.0);
      });
      test('uses an empty specialty name when specialties is missing', () {
        final map = <String, dynamic>{
          'id': 'doctor-3',
          'full_name': 'Ali Hassan',
          'specialty_id': 'specialty-3',
          'rating': 3,
          'reviews_count': 5,
          'fee': 12,
          'is_active': false,
        };
        final result = DoctorModel.fromMap(map);
        expect(result.specialtyName, '');
      });
    });
    group('copyWith', () {
      test('updates the specified fields', () {
        final updatedDoctor = doctor.copyWith(
          fullName: 'Mohamed Ali',
          rating: 4.8,
          fee: 25.0,
        );

        expect(updatedDoctor.fullName, 'Mohamed Ali');
        expect(updatedDoctor.rating, 4.8);
        expect(updatedDoctor.fee, 25.0);
      });

      test('preserves the original values of unspecified fields', () {
        final updatedDoctor = doctor.copyWith(fullName: 'Mohamed Ali');

        expect(updatedDoctor.id, doctor.id);
        expect(updatedDoctor.specialtyId, doctor.specialtyId);
        expect(updatedDoctor.specialtyName, doctor.specialtyName);
        expect(updatedDoctor.imageUrl, doctor.imageUrl);
        expect(updatedDoctor.rating, doctor.rating);
        expect(updatedDoctor.reviewsCount, doctor.reviewsCount);
        expect(updatedDoctor.fee, doctor.fee);
        expect(updatedDoctor.isActive, doctor.isActive);
      });
    });

    group('Equatable', () {
      test('considers models with the same values equal', () {
        const anotherDoctor = DoctorModel(
          id: 'doctor-1',
          fullName: 'Mohamed Ahmed',
          specialtyId: 'specialty-1',
          specialtyName: 'Cardiology',
          imageUrl: 'https://example.com/doctor.jpg',
          rating: 4.5,
          reviewsCount: 20,
          fee: 15.0,
          isActive: true,
        );

        expect(doctor, equals(anotherDoctor));
      });

      test('considers models with different values unequal', () {
        final anotherDoctor = doctor.copyWith(rating: 3.5);

        expect(doctor, isNot(equals(anotherDoctor)));
      });
    });
  });
}

