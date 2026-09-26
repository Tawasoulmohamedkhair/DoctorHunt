import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/data/Repository/auth_repo.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Supabase
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<SupabaseClient>()),
  );

  // Cubits
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit(getIt()));

  getIt.registerFactory<RoleSelectionCubit>(() => RoleSelectionCubit());

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  getIt.registerFactory<DoctorDetailsCubit>(() => DoctorDetailsCubit());

  getIt.registerFactory<FindDoctorsCubit>(() => FindDoctorsCubit());
}
