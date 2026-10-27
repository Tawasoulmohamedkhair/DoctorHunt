import 'dart:convert';

import 'package:doctor_hunt/apps/features/patient/features/favourites/data/repository/favorite_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late SupabaseClient supabase;
  late FavoriteRepository repository;

  const patientId = 'patient-1';
  const doctorId = 'doctor-1';

  tearDown(() {
    supabase.dispose();
  });

  group('FavoriteRepository', () {
    group('getFavoriteDoctorIds', () {
      test('returns favorite doctor IDs successfully', () async {
        supabase = _createSupabaseClient(
          MockClient((request) async {
            expect(request.method, 'GET');
            expect(request.url.path, '/rest/v1/favorites');
            expect(request.url.queryParameters['select'], 'doctor_id');
            expect(request.url.queryParameters['patient_id'], 'eq.$patientId');

            return http.Response(
              jsonEncode([
                {'doctor_id': 'doctor-1'},
                {'doctor_id': 'doctor-2'},
              ]),
              200,
              request: request,
              headers: {'content-type': 'application/json'},
            );
          }),
        );

        repository = FavoriteRepository(supabase);

        final result = await repository.getFavoriteDoctorIds(patientId);

        expect(result, {'doctor-1', 'doctor-2'});
      });

      test('returns an empty set when no favorites exist', () async {
        supabase = _createSupabaseClient(
          MockClient((request) async {
            return http.Response(
              jsonEncode([]),
              200,
              headers: {'content-type': 'application/json'},
              request: request,
            );
          }),
        );

        repository = FavoriteRepository(supabase);

        final result = await repository.getFavoriteDoctorIds(patientId);

        expect(result, isEmpty);
      });

      test('propagates Supabase errors', () async {
        supabase = _createSupabaseClient(
          MockClient((request) async {
            return http.Response(
              jsonEncode({
                'code': 'XX000',
                'message': 'Database error',
                'details': null,
                'hint': null,
              }),
              500,
              request: request,
              headers: {'content-type': 'application/json'},
            );
          }),
        );

        repository = FavoriteRepository(supabase);

        expect(
          () => repository.getFavoriteDoctorIds(patientId),
          throwsA(isA<PostgrestException>()),
        );
      });
    });

    group('addFavorite', () {
      test('sends the correct patient and doctor IDs', () async {
        supabase = _createSupabaseClient(
          MockClient((request) async {
            expect(request.method, 'POST');
            expect(request.url.path, '/rest/v1/favorites');
            expect(jsonDecode(request.body), {
              'patient_id': patientId,
              'doctor_id': doctorId,
            });

            return http.Response('', 201, request: request);
          }),
        );

        repository = FavoriteRepository(supabase);

        await expectLater(
          repository.addFavorite(patientId: patientId, doctorId: doctorId),
          completes,
        );
      });

      test('propagates Supabase errors', () async {
        supabase = _createSupabaseClient(
          MockClient((request) async {
            return http.Response(
              jsonEncode({
                'code': '23505',
                'message': 'Duplicate favorite',
                'details': null,
                'hint': null,
              }),
              409,
              request: request,

              headers: {'content-type': 'application/json'},
            );
          }),
        );

        repository = FavoriteRepository(supabase);

        expect(
          () =>
              repository.addFavorite(patientId: patientId, doctorId: doctorId),
          throwsA(isA<PostgrestException>()),
        );
      });
    });

    group('removeFavorite', () {
      test('deletes the favorite using both IDs', () async {
        supabase = _createSupabaseClient(
          MockClient((request) async {
            expect(request.method, 'DELETE');
            expect(request.url.path, '/rest/v1/favorites');
            expect(request.url.queryParameters['patient_id'], 'eq.$patientId');
            expect(request.url.queryParameters['doctor_id'], 'eq.$doctorId');

            return http.Response('', 204, request: request);
          }),
        );

        repository = FavoriteRepository(supabase);

        await expectLater(
          repository.removeFavorite(patientId: patientId, doctorId: doctorId),
          completes,
        );
      });

      test('propagates Supabase errors', () async {
        supabase = _createSupabaseClient(
          MockClient((request) async {
            return http.Response(
              jsonEncode({
                'code': '42501',
                'message': 'Permission denied',
                'details': null,
                'hint': null,
              }),
              403,
              request: request,

              headers: {'content-type': 'application/json'},
            );
          }),
        );

        repository = FavoriteRepository(supabase);

        expect(
          () => repository.removeFavorite(
            patientId: patientId,
            doctorId: doctorId,
          ),
          throwsA(isA<PostgrestException>()),
        );
      });
    });
  });
}

SupabaseClient _createSupabaseClient(http.Client httpClient) {
  return SupabaseClient(
    'https://example.supabase.co',
    'test-publishable-key',
    httpClient: httpClient,
  );
}
