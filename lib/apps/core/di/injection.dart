import 'package:doctor_hunt/apps/features/Choose%20role/presentation/cubit/role_selection_cubit.dart';
import 'package:doctor_hunt/apps/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/onboarding/presentation/cubit/onboardin_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Cubits
  getIt.registerFactory(() => OnboardingCubit(getIt()));
  getIt.registerFactory<RoleSelectionCubit>(() => RoleSelectionCubit());
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
}
