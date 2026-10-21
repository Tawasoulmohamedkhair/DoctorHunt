import 'dart:io';

import 'package:doctor_hunt/apps/core/service/avatar_storage_service.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminRepository {
  final SupabaseClient _supabase;
  final AvatarStorageService _avatarStorage;

  AdminRepository(this._supabase, this._avatarStorage);

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
        .select('location, latitude, longitude')
        .single();

    return AdminModel(
      fullName: profile['full_name'] as String? ?? '',
      email: user.email ?? '',
      avatarUrl: profile['avatar_url'] as String?,
      clinicLocation: clinic['location'] as String? ?? '',
      latitude: (clinic['latitude'] as num?)?.toDouble(),
      longitude: (clinic['longitude'] as num?)?.toDouble(),
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

    final publicUrl = await _avatarStorage.upload(
      path: path,
      file: file,
      upsert: false,
    );

    await _supabase
        .from('users')
        .update({'avatar_url': publicUrl})
        .eq('id', user.id);

    return publicUrl;
  }

  Future<void> updateProfile({
    required String fullName,
    required String clinicLocation,
    double? latitude,
    double? longitude,
  }) async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('Admin is not authenticated');
    }

    await _supabase
        .from('users')
        .update({'full_name': fullName})
        .eq('id', user.id);

    final clinic = await _supabase
        .from('clinic_settings')
        .select('id')
        .single();

    await _supabase
        .from('clinic_settings')
        .update({
          'location': clinicLocation,
          'latitude': latitude,
          'longitude': longitude,
        })
        .eq('id', clinic['id']);
  }
}
