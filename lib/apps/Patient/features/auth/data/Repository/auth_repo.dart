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
      data: {
        'full_name': fullName,
      },
    );
  }

  // ---------------- GOOGLE ----------------

  Future<AuthResponse> signInWithGoogle() async {
    const webClientId =
        '597408620306-e9lfakbn789789hntkmp730e1d16077e.apps.googleusercontent.com';

    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId: webClientId,
    );

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

  Future<void> forgotPassword({
    required String email,
  }) async {
    await _supabase.auth.resetPasswordForEmail(
      email.trim(),
    );
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

  Future<UserResponse> resetPassword({
    required String password,
  }) async {
    return await _supabase.auth.updateUser(
      UserAttributes(
        password: password,
      ),
    );
  }

  // ---------------- AUTH STATE ----------------

  Stream<AuthState> get authStateChanges {
    return _supabase.auth.onAuthStateChange;
  }
}


