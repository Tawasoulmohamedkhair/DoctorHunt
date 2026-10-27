import 'package:supabase_flutter/supabase_flutter.dart';

class ScheduleRepository {
  ScheduleRepository(this._client);

  final SupabaseClient _client;

  Future<List<Map<String, dynamic>>> getDoctorServices(String doctorId) async {
    try {
      final response = await _client
          .from('doctor_services')
          .select('''
          medical_service_id,
          medical_services!inner (
            id,
            name,
            is_active
          )
        ''')
          .eq('doctor_id', doctorId)
          .eq('medical_services.is_active', true);

      final services = List<Map<String, dynamic>>.from(response);

     

      return services;
    } catch (error) {
     
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getScheduleForMonth({
    required String doctorId,
    required DateTime month,
  }) async {
    final response = await _client
        .from('doctor_schedules')
        .select()
        .eq('doctor_id', doctorId)
        .eq('month_start', _formatDate(DateTime(month.year, month.month, 1)))
        .neq('status', 'archived')
        .order('version', ascending: false)
        .limit(1);

    if (response.isEmpty) return null;

    return Map<String, dynamic>.from(response.first);
  }

  Future<List<Map<String, dynamic>>> getAvailabilityForSchedule(
    String scheduleId,
  ) async {
    final response = await _client
        .from('doctor_availability')
        .select('''
          id,
          schedule_id,
          doctor_id,
          medical_service_id,
          work_date,
          shift,
          start_time,
          end_time,
          slot_duration_minutes
        ''')
        .eq('schedule_id', scheduleId)
        .order('work_date');

    return List<Map<String, dynamic>>.from(response);
  }

  Future<String> saveDraft({
    required String doctorId,
    required DateTime month,
    required List<Map<String, dynamic>> availabilityRows,
  }) async {
    final monthStart = DateTime(month.year, month.month, 1);

    final rows = availabilityRows.map((row) {
      return {
        'medical_service_id': row['medical_service_id'],
        'work_date': row['work_date'],
        'shift': row['shift'],
        'start_time': row['start_time'],
        'end_time': row['end_time'],
        'slot_duration_minutes': row['slot_duration_minutes'] ?? 30,
      };
    }).toList();

    final response = await _client.rpc(
      'save_doctor_schedule_draft',
      params: {
        'p_doctor_id': doctorId,
        'p_month_start': _formatDate(monthStart),
        'p_availability_rows': rows,
      },
    );

    if (response == null || response is! String) {
      throw Exception('The database did not return a valid schedule ID.');
    }

    return response;
  }

  Future<void> publishSchedule(String scheduleId) async {
    final response = await _client.rpc(
      'publish_doctor_schedule',
      params: {'p_schedule_id': scheduleId},
    );

    if (response != scheduleId) {
      throw Exception('The database did not confirm schedule publication.');
    }
  }

  Future<void> updatePublishedAvailability({
    required String availabilityId,
    required String medicalServiceId,
    required DateTime workDate,
    required String shift,
    required String startTime,
    required String endTime,
    int slotDurationMinutes = 30,
  }) async {
    final response = await _client.rpc(
      'update_published_doctor_availability',
      params: {
        'p_availability_id': availabilityId,
        'p_medical_service_id': medicalServiceId,
        'p_work_date': _formatDate(workDate),
        'p_shift': shift,
        'p_start_time': startTime,
        'p_end_time': endTime,
        'p_slot_duration_minutes': slotDurationMinutes,
      },
    );

    if (response != availabilityId) {
      throw Exception('The database did not confirm the availability update.');
    }
  }

  Future<String> addPublishedAvailability({
    required String scheduleId,
    required String doctorId,
    required String medicalServiceId,
    required DateTime workDate,
    required String shift,
    required String startTime,
    required String endTime,
    int slotDurationMinutes = 30,
  }) async {
    final response = await _client.rpc(
      'add_published_doctor_availability',
      params: {
        'p_schedule_id': scheduleId,
        'p_doctor_id': doctorId,
        'p_medical_service_id': medicalServiceId,
        'p_work_date': _formatDate(workDate),
        'p_shift': shift,
        'p_start_time': startTime,
        'p_end_time': endTime,
        'p_slot_duration_minutes': slotDurationMinutes,
      },
    );

    if (response is! String || response.isEmpty) {
      throw Exception('The database did not return a valid availability ID.');
    }

    return response;
  }

  Future<List<Map<String, dynamic>>> getClinicOperatingHours() async {
    final response = await _client
        .from('clinic_operating_hours')
        .select('day_of_week, shift, start_time, end_time, is_open')
        .order('day_of_week')
        .order('shift');

    return List<Map<String, dynamic>>.from(response);
  }

  String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
}
