import 'dart:async';

import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockPostgrestFilterBuilder extends Mock
    implements PostgrestFilterBuilder<dynamic> {
       MockPostgrestFilterBuilder(this.result);

  final dynamic result;


  @override
  Future<R> then<R>(
    FutureOr<R> Function(dynamic value) onValue, {
    Function? onError,
  }) {
    return Future<dynamic>.value(result).then<R>(
      onValue,
      onError: onError,
    );
  }
}

void main() {
  late MockSupabaseClient supabaseClient;
  late AppointmentRepository repository;

  setUp(() {
    supabaseClient = MockSupabaseClient();
    repository = AppointmentRepository(supabaseClient);
  });

  group('AppointmentRepository', () {
    group('bookAppointment', () {
      const availabilityId = 'availability-1';
      const appointmentTime = '10:00:00';

      test('returns appointment ID when booking succeeds', () async {
        final builder = MockPostgrestFilterBuilder('appointment-1');

        when(
          () => supabaseClient.rpc<dynamic>(
            'book_doctor_appointment',
            params: {
              'p_availability_id': availabilityId,
              'p_appointment_time': appointmentTime,
            },
          ),
        ).thenAnswer((_) => builder);

        final result = await repository.bookAppointment(
          availabilityId: availabilityId,
          appointmentTime: appointmentTime,
        );

        expect(result, 'appointment-1');

        verify(
          () => supabaseClient.rpc<dynamic>(
            'book_doctor_appointment',
            params: {
              'p_availability_id': availabilityId,
              'p_appointment_time': appointmentTime,
            },
          ),
        ).called(1);
      });

      test('throws exception when booking result is null', () async {
final builder = MockPostgrestFilterBuilder('');        when(
          () => supabaseClient.rpc<dynamic>(
            'book_doctor_appointment',
            params: {
              'p_availability_id': availabilityId,
              'p_appointment_time': appointmentTime,
            },
          ),
        ).thenAnswer((_) => builder);

        expect(
          () => repository.bookAppointment(
            availabilityId: availabilityId,
            appointmentTime: appointmentTime,
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('throws exception when booking result is empty', () async {
final builder = MockPostgrestFilterBuilder('');
        when(
          () => supabaseClient.rpc<dynamic>(
            'book_doctor_appointment',
            params: {
              'p_availability_id': availabilityId,
              'p_appointment_time': appointmentTime,
            },
          ),
        ).thenAnswer((_) => builder);

        expect(
          () => repository.bookAppointment(
            availabilityId: availabilityId,
            appointmentTime: appointmentTime,
          ),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
