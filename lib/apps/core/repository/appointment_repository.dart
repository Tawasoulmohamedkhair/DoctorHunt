import 'package:doctor_hunt/apps/core/error/app_error.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/data/model/appointment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppointmentRepository {
  AppointmentRepository(this._supabase);

  final SupabaseClient _supabase;

  // ─────────────────────────────────────────────
  // Shared
  // ─────────────────────────────────────────────

  Future<String> bookAppointment({
    required String availabilityId,
    required String appointmentTime,
  }) async {
    final result = await _supabase.rpc(
      'book_doctor_appointment',
      params: {
        'p_availability_id': availabilityId,
        'p_appointment_time': appointmentTime,
      },
    );

    if (result == null || result.toString().isEmpty) {
      throw Exception('Booking was not confirmed.');
    }

    return result.toString();
  }

  // ─────────────────────────────────────────────
  // Patient
  // ─────────────────────────────────────────────

  Future<List<AppointmentModel>> getMyAppointments() async {
    final patientId = _supabase.auth.currentUser?.id;

    if (patientId == null) {
      throw AuthSessionMissingException();
    }

    final response = await _supabase
        .from('appointments')
        .select('''
        id,
        patient_id,
        availability_id,
        appointment_time,
        fee_at_booking,
        status,
        created_at,
        doctor_availability!inner (
          work_date,
          shift,
          start_time,
          end_time,
          doctors!inner (
            id,
            full_name,
            image_url,
            fee,
            specialties (
              name
            )
          ),
          medical_services (
            id,
            name
          )
        ),
        reviews!reviews_appointment_id_fkey (
          id,
          rating
        )
      ''')
        .eq('patient_id', patientId)
        .order('created_at', ascending: false);

    return response
        .map(
          (json) => AppointmentModel.fromJson(Map<String, dynamic>.from(json)),
        )
        .toList();
  }

  Future<void> cancelPatientAppointment(String appointmentId) async {
    await _supabase.rpc(
      'patient_cancel_appointment',
      params: {'p_appointment_id': appointmentId},
    );
  }

  // ─────────────────────────────────────────────
  // Admin
  // ─────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getAdminAppointments() async {
    final response = await _supabase
        .from('appointments')
        .select('''
          id,
          patient_id,
          availability_id,
          appointment_time,
          fee_at_booking,
          status,
          created_at,
          patients!appointments_patient_id_fkey!inner (
            user_id,
            users!patients_user_id_fkey!inner (
              id,
              full_name,
              email,
              phone,
              avatar_url
            )
          ),
          doctor_availability!appointments_availability_id_fkey!inner (
            work_date,
            shift,
            start_time,
            end_time,
            doctors!inner (
              id,
              full_name,
              image_url,
              specialties (
                name
              )
            ),
            medical_services (
              id,
              name
            )
          )
        ''')
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> cancelAdminAppointment(String appointmentId) async {
    await _supabase.rpc(
      'admin_cancel_appointment',
      params: {'p_appointment_id': appointmentId},
    );
  }

  Future<void> submitReview({
    required String appointmentId,
    required String doctorId,
    required int rating,
    String? comment,
  }) async {
    final patientId = _supabase.auth.currentUser?.id;

    if (patientId == null) {
      throw AuthSessionMissingException();
    }

    if (rating < 1 || rating > 5) {
      throw const AppValidationException();
    }

    await _supabase.from('reviews').insert({
      'appointment_id': appointmentId,
      'patient_id': patientId,
      'doctor_id': doctorId,
      'rating': rating,
      'comment': comment == null || comment.trim().isEmpty
          ? null
          : comment.trim(),
    });
  }

  Future<void> completeAdminAppointment(String appointmentId) async {
    await _supabase.rpc(
      'admin_complete_appointment',
      params: {'p_appointment_id': appointmentId},
    );
  }

  Future<Map<String, dynamic>?> getAdminAppointmentById(
    String appointmentId,
  ) async {
    final response = await _supabase
        .from('appointments')
        .select('''
        id,
        patient_id,
        availability_id,
        appointment_time,
        fee_at_booking,
        status,
        created_at,
        patients!appointments_patient_id_fkey!inner (
          user_id,
          users!patients_user_id_fkey!inner (
            id,
            full_name,
            email,
            phone,
            avatar_url
          )
        ),
        doctor_availability!appointments_availability_id_fkey!inner (
          work_date,
          shift,
          start_time,
          end_time,
          doctors!inner (
            id,
            full_name,
            image_url,
            specialties (
              name
            )
          ),
          medical_services (
            id,
            name
          )
        )
      ''')
        .eq('id', appointmentId)
        .maybeSingle();

    return response;
  }
}
