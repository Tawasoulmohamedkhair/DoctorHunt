import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class AvatarStorageService {
  AvatarStorageService(this._supabase);

  final SupabaseClient _supabase;

  Future<String> upload({
    required String path,
    required File file,
    bool upsert = false,
  }) async {
    await _supabase.storage
        .from('avatars')
        .upload(path, file, fileOptions: FileOptions(upsert: upsert));

    return _supabase.storage.from('avatars').getPublicUrl(path);
  }
}
