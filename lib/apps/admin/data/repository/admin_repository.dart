import 'dart:io';

import 'package:doctor_hunt/apps/admin/data/model/admin_model.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminRepository {
  final SupabaseClient _supabase;

  AdminRepository(this._supabase);

  Future<AdminModel> getAdmin() async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('Admin is not authenticated');
    }

    final profile = await _supabase
        .from('users')
        .select('full_name, avatar_url')
        .eq('id', user.id)
        .single();

    final clinic = await _supabase
        .from('clinic_settings')
        .select('location')
        .single();

    return AdminModel(
      fullName: profile['full_name'] as String? ?? '',
      email: user.email ?? '',
      avatarUrl: profile['avatar_url'] as String?,
      clinicLocation: clinic['location'] as String? ?? '',
    );
  }

  Future<String> uploadProfileImage({
    required File file,
    required String extension,
  }) async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('Admin is not authenticated');
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final path = 'admins/${user.id}/profile_$timestamp.$extension';

    debugPrint('IMAGE UPLOAD START');
    debugPrint('IMAGE PATH: $path');
    debugPrint('FILE EXISTS: ${file.existsSync()}');

    await _supabase.storage
        .from('avatars')
        .upload(path, file, fileOptions: const FileOptions(upsert: false));

    debugPrint('IMAGE UPLOAD SUCCESS');

    final publicUrl = _supabase.storage.from('avatars').getPublicUrl(path);

    debugPrint('IMAGE URL: $publicUrl');

    await _supabase
        .from('users')
        .update({'avatar_url': publicUrl})
        .eq('id', user.id);

    debugPrint('AVATAR URL UPDATE SUCCESS');

    return publicUrl;
  }

  Future<void> updateProfile({
    required String fullName,
    required String clinicLocation,
  }) async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('Admin is not authenticated');
    }

    await _supabase
        .from('users')
        .update({'full_name': fullName})
        .eq('id', user.id);

    debugPrint('FULL NAME UPDATE SUCCESS');

    final clinic = await _supabase
        .from('clinic_settings')
        .select('id')
        .single();

    await _supabase
        .from('clinic_settings')
        .update({'location': clinicLocation})
        .eq('id', clinic['id']);

    debugPrint('CLINIC LOCATION UPDATE SUCCESS');
  }
}
