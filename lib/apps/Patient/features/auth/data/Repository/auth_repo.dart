import 'package:doctor_hunt/apps/Patient/core/supabase/supabase_client.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/data/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

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
    final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'];

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

    return await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
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

  Future<UserModel?> getCurrentUserProfile() async {
    final user = supabase.auth.currentUser;
    if (user == null) return null;

    final response = await supabase
        .from('users')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    if (response == null) return null;

    return UserModel.fromJson(response); // أو حسب الـ UserModel عندك
  }
}
