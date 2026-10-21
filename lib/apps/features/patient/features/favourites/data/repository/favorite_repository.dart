
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteRepository {
  final SupabaseClient _supabase;

  FavoriteRepository(this._supabase);

  Future<Set<String>> getFavoriteDoctorIds(String patientId) async {
    final response = await _supabase
        .from('favorites')
        .select('doctor_id')
        .eq('patient_id', patientId);

    return response
        .map((row) => row['doctor_id'] as String)
        .toSet();
  }

  Future<void> addFavorite({
    required String patientId,
    required String doctorId,
  }) async {
    await _supabase.from('favorites').insert({
      'patient_id': patientId,
      'doctor_id': doctorId,
    });
  }

  Future<void> removeFavorite({
    required String patientId,
    required String doctorId,
  }) async {
    await _supabase
        .from('favorites')
        .delete()
        .eq('patient_id', patientId)
        .eq('doctor_id', doctorId);
  }
}
