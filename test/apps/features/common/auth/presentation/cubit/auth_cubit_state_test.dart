import 'package:doctor_hunt/apps/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthCubitState', () {
    test('has initial values by default', () {
      const state = AuthCubitState();

      expect(state.status, AuthStatus.initial);
      expect(state.errorMessage, isNull);
      expect(state.user, isNull);
    });

    test('copyWith updates status and preserves other values', () {
      const state = AuthCubitState(
        status: AuthStatus.failure,
        errorMessage: 'Login failed',
      );

      final updatedState = state.copyWith(status: AuthStatus.loading);

      expect(updatedState.status, AuthStatus.loading);
      expect(updatedState.errorMessage, 'Login failed');
      expect(updatedState.user, isNull);
    });

    test('copyWith updates errorMessage', () {
      const state = AuthCubitState();

      final updatedState = state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Invalid credentials',
      );

      expect(updatedState.status, AuthStatus.failure);
      expect(updatedState.errorMessage, 'Invalid credentials');
    });

    test('copyWith updates user', () {
      const user = UserModel(
        id: 'user-123',
        fullName: 'Test Patient',
        email: 'test@example.com',
        role: 'patient',
        isActive: true,
      );

      const state = AuthCubitState();

      final updatedState = state.copyWith(
        status: AuthStatus.success,
        user: user,
      );

      expect(updatedState.status, AuthStatus.success);
      expect(updatedState.user, same(user));
    });

    test('states with the same values are equal', () {
      const state1 = AuthCubitState(
        status: AuthStatus.loading,
        errorMessage: 'Loading',
      );

      const state2 = AuthCubitState(
        status: AuthStatus.loading,
        errorMessage: 'Loading',
      );

      expect(state1, equals(state2));
    });

    test('states with different statuses are not equal', () {
      const state1 = AuthCubitState(status: AuthStatus.initial);

      const state2 = AuthCubitState(status: AuthStatus.loading);

      expect(state1, isNot(equals(state2)));
    });
  });
}
