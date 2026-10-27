import 'dart:io';

import 'package:doctor_hunt/apps/core/error/app_error.dart';
import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/models/clinic_location_model.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/service/avatar_storage_service.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/data/models/medical_service_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorRepository {
  final SupabaseClient _supabase;
  final AvatarStorageService _avatarStorage = getIt<AvatarStorageService>();

  DoctorRepository(this._supabase);

  Future<ClinicLocationModel?> getClinicLocation() async {
    final response = await _supabase
        .from('clinic_settings')
        .select('location, latitude, longitude')
        .maybeSingle();

    if (response == null) return null;

    return ClinicLocationModel.fromMap(Map<String, dynamic>.from(response));
  }

  Future<List<DoctorModel>> getDoctors() async {
    final response = await _supabase
        .from('doctors')
        .select('''
          id,
          full_name,
          specialty_id,
          image_url,
          rating,
          reviews_count,
          fee,
          is_active,
          specialties (
            id,
            name
          )
        ''')
        .order('created_at', ascending: false);

    return (response as List)
        .map((doctor) => DoctorModel.fromMap(Map<String, dynamic>.from(doctor)))
        .toList();
  }

  Future<DoctorModel> getDoctorById(String doctorId) async {
    final response = await _supabase
        .from('doctors')
        .select('''
        id,
        full_name,
        specialty_id,
        image_url,
        rating,
        reviews_count,
        fee,
        is_active,
        specialties (
          id,
          name
        )
      ''')
        .eq('id', doctorId)
        .single();

    return DoctorModel.fromMap(Map<String, dynamic>.from(response));
  }

  Future<List<DoctorModel>> getActiveDoctors() async {
    final response = await _supabase
        .from('doctors')
        .select('''
        id,
        full_name,
        specialty_id,
        image_url,
        rating,
        reviews_count,
        fee,
        is_active,
        specialties (
          id,
          name
        )
      ''')
        .eq('is_active', true)
        .order('created_at', ascending: false);

    return (response as List)
        .map((doctor) => DoctorModel.fromMap(Map<String, dynamic>.from(doctor)))
        .toList();
  }

  Future<AppResult<List<DoctorModel>>> getActiveDoctorsResult() async {
    try {
      return AppSuccess(await getActiveDoctors());
    } catch (error, stackTrace) {
      return AppError(mapAppFailure(error, stackTrace));
    }
  }

  Future<List<String>> getDoctorServices(String doctorId) async {
    final response = await _supabase
        .from('doctor_services')
        .select('''
        medical_services (
          name,
          is_active
        )
      ''')
        .eq('doctor_id', doctorId);

    final services = <String>[];

    for (final item in response as List) {
      final medicalService = item['medical_services'] as Map<String, dynamic>?;

      if (medicalService == null) continue;

      final isActive = medicalService['is_active'] as bool? ?? false;
      final name = medicalService['name'] as String?;

      if (isActive && name != null && name.isNotEmpty) {
        services.add(name);
      }
    }

    return services;
  }

  Future<List<Map<String, dynamic>>> getDoctorReviews(
    String doctorId, {
    int limit = 10,
  }) async {
    final response = await _supabase
        .from('reviews')
        .select('''
        id,
        appointment_id,
        patient_id,
        doctor_id,
        rating,
        comment,
        created_at,
        patients!reviews_patient_id_fkey (
          user_id,
          users!patients_user_id_fkey (
            full_name,
            avatar_url
          )
        )
      ''')
        .eq('doctor_id', doctorId)
        .order('created_at', ascending: false)
        .limit(limit);

    return (response as List)
        .map((review) => Map<String, dynamic>.from(review))
        .toList();
  }

  Future<List<SpecialtyModel>> getSpecialties() async {
    final response = await _supabase
        .from('specialties')
        .select('id, name')
        .order('name');

    return (response as List)
        .map(
          (specialty) =>
              SpecialtyModel.fromMap(Map<String, dynamic>.from(specialty)),
        )
        .toList();
  }
  
  /// Fetches active medical services for the selected specialty.
  Future<List<MedicalServiceModel>> getMedicalServicesBySpecialty(
    String specialtyId,
  ) async {
    final response = await _supabase
        .from('medical_services')
        .select('id, specialty_id, name, is_active')
        .eq('specialty_id', specialtyId)
        .eq('is_active', true)
        .order('name');

    return (response as List)
        .map(
          (service) =>
              MedicalServiceModel.fromMap(Map<String, dynamic>.from(service)),
        )
        .toList();
  }

  /// Fetches the selected medical service IDs for a doctor.
  Future<List<String>> getDoctorMedicalServiceIds(String doctorId) async {
    final response = await _supabase
        .from('doctor_services')
        .select('medical_service_id')
        .eq('doctor_id', doctorId);

    return (response as List)
        .map((item) => item['medical_service_id'] as String)
        .toList();
  }

  /// Replaces all medical service links assigned to a doctor.
  Future<void> saveDoctorMedicalServices({
    required String doctorId,
    required List<String> medicalServiceIds,
  }) async {
    // Remove existing links first, including when the selection is empty.
    await _supabase.from('doctor_services').delete().eq('doctor_id', doctorId);

    if (medicalServiceIds.isEmpty) return;

    final rows = medicalServiceIds
        .toSet()
        .map(
          (serviceId) => {
            'doctor_id': doctorId,
            'medical_service_id': serviceId,
          },
        )
        .toList();

    await _supabase.from('doctor_services').insert(rows);
  }


  Future<DoctorModel> createDoctor({
    required String fullName,
    required String specialtyId,
    required double fee,
    required bool isActive,
  }) async {
    final response = await _supabase
        .from('doctors')
        .insert({
          'full_name': fullName,
          'specialty_id': specialtyId,
          'fee': fee,
          'rating': 0,
          'reviews_count': 0,
          'is_active': isActive,
        })
        .select('''
          id,
          full_name,
          specialty_id,
          image_url,
          rating,
          reviews_count,
          fee,
          is_active,
          specialties (
            id,
            name
          )
        ''')
        .single();

    return DoctorModel.fromMap(Map<String, dynamic>.from(response));
  }

  Future<void> updateDoctor({
    required String doctorId,
    required String fullName,
    required String specialtyId,
    required double fee,
  }) async {
    await _supabase
        .from('doctors')
        .update({
          'full_name': fullName,
          'specialty_id': specialtyId,
          'fee': fee,
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        })
        .eq('id', doctorId);
  }

  Future<void> updateDoctorStatus({
    required String doctorId,
    required bool isActive,
  }) async {
    await _supabase
        .from('doctors')
        .update({
          'is_active': isActive,
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        })
        .eq('id', doctorId);
  }

  Future<void> deleteDoctor(String doctorId) async {
    await _supabase.from('doctors').delete().eq('id', doctorId);
  }

  Future<String> uploadDoctorImage({
    required String doctorId,
    required File file,
    required String extension,
  }) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final path = 'doctors/$doctorId/profile_$timestamp.$extension';

    final imageUrl = await _avatarStorage.upload(
      path: path,
      file: file,
      upsert: false,
    );

    await _supabase
        .from('doctors')
        .update({
          'image_url': imageUrl,
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        })
        .eq('id', doctorId);

    return imageUrl;
  }

  /// Loads published availability visible to the current patient
  /// for the selected doctor and month.
  Future<List<Map<String, dynamic>>> getDoctorAvailabilityForMonth({
    required String doctorId,
    required DateTime month,
  }) async {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);

    final response = await _supabase
        .from('doctor_availability')
        .select('''
          id,
          doctor_id,
          work_date,
          shift,
          start_time,
          end_time,
          slot_duration_minutes
        ''')
        .eq('doctor_id', doctorId)
        .gte('work_date', _formatDate(firstDay))
        .lte('work_date', _formatDate(lastDay))
        .order('work_date')
        .order('start_time');

    return (response as List)
        .map((row) => Map<String, dynamic>.from(row))
        .toList();
  }

  /// Returns occupied appointment times for the given availability rows.
  Future<List<Map<String, dynamic>>> getBookedSlots(
    List<String> availabilityIds,
  ) async {
    if (availabilityIds.isEmpty) {
      return [];
    }

    final response = await _supabase.rpc(
      'get_doctor_slot_occupancy',
      params: {'p_availability_ids': availabilityIds},
    );

    return (response as List)
        .map((row) => Map<String, dynamic>.from(row))
        .toList();
  }

  String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
}
