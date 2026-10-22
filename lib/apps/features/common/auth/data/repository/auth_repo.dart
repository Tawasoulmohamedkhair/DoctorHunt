import 'dart:io';

import 'package:doctor_hunt/apps/core/service/avatar_storage_service.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase;
  final AvatarStorageService _avatarStorageService;
  final String? _googleWebClientId;

  AuthRepository(
    this._supabase, [
    AvatarStorageService? avatarStorageService,
    String? googleWebClientId,
  ]) : _avatarStorageService =
           avatarStorageService ?? AvatarStorageService(_supabase),
       _googleWebClientId = googleWebClientId;

  bool get hasCurrentUser => _supabase.auth.currentUser != null;
  String? get currentUserId => _supabase.auth.currentUser?.id;
  String? get currentUserEmail => _supabase.auth.currentUser?.email;

  // ---------------- LOGIN ----------------

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signInWithPassword(
      email: email.trim(),
      password: password,
    );
  }

  // ---------------- SIGN UP ----------------

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return await _supabase.auth.signUp(
      email: email.trim(),
      password: password,
      data: {'full_name': fullName},
    );
  }

  // ---------------- GOOGLE ----------------
  Future<AuthResponse> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;
    final webClientId =
        _googleWebClientId ?? dotenv.env['GOOGLE_WEB_CLIENT_ID'];
    if (webClientId == null || webClientId.isEmpty) {
      throw AuthException('GOOGLE_WEB_CLIENT_ID is not configured.');
    }

    await googleSignIn.initialize(serverClientId: webClientId);

    final googleUser = await googleSignIn.authenticate();

    final authorization =
        await googleUser.authorizationClient.authorizationForScopes([
          'email',
          'profile',
        ]) ??
        await googleUser.authorizationClient.authorizeScopes([
          'email',
          'profile',
        ]);

    final idToken = googleUser.authentication.idToken;

    if (idToken == null) {
      throw AuthException('No ID Token found.');
    }

    final accessToken = authorization.accessToken;

    final response = await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return response;
  }

  // ---------------- FORGOT PASSWORD ----------------

  Future<void> forgotPassword({required String email}) async {
    await _supabase.auth.resetPasswordForEmail(email.trim());
  }

  // ---------------- VERIFY RECOVERY OTP ----------------

  Future<AuthResponse> verifyRecoveryCode({
    required String email,
    required String code,
  }) async {
    final response = await _supabase.auth.verifyOTP(
      email: email.trim(),
      token: code.trim(),
      type: OtpType.recovery,
    );

    return response;
  }

  // ---------------- RESET PASSWORD ----------------

  Future<UserResponse> resetPassword({required String password}) async {
    return await _supabase.auth.updateUser(UserAttributes(password: password));
  }

  // ---------------- AUTH STATE ----------------

  Stream<AuthState> get authStateChanges {
    return _supabase.auth.onAuthStateChange;
  }

  Future<UserModel?> getCurrentUserProfile({
    bool throwIfMissing = false,
  }) async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      return null;
    }

    final response = await _supabase
        .from('users')
        .select()
        .eq('id', user.id)
        .maybeSingle()
        .timeout(const Duration(seconds: 15));

    if (response == null) {
      if (throwIfMissing) {
        throw StateError('The current user profile was not found.');
      }
      return null;
    }

    final userProfile = UserModel.fromJson(response);

    return userProfile;
  }

  Future<String?> updateCurrentUserProfile({
    required String fullName,
    required String phone,
    required String? currentAvatarUrl,
    File? newAvatar,
  }) async {
    final user = _supabase.auth.currentUser;
    if (user == null) {
      throw StateError('A signed-in user is required to update the profile.');
    }

    var avatarUrl = currentAvatarUrl;
    if (newAvatar != null) {
      final extension = newAvatar.path.split('.').last.toLowerCase();
      final path =
          'patients/${user.id}/profile_${DateTime.now().millisecondsSinceEpoch}.$extension';
      avatarUrl = await _avatarStorageService.upload(
        path: path,
        file: newAvatar,
        upsert: true,
      );
    }

    await _supabase
        .from('users')
        .update({
          'full_name': fullName,
          'phone': phone,
          'avatar_url': avatarUrl,
        })
        .eq('id', user.id);

    return avatarUrl;
  }

  Future<void> logOut() async {
    await _supabase.auth.signOut();
  }
}
