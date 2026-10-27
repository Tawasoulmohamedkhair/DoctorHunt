import 'package:doctor_hunt/apps/core/service/avatar_storage_service.dart';
import 'package:doctor_hunt/apps/features/admin/features/appointments/presentation/cubit/admin_appointment_details_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/appointments/presentation/cubit/admin_appointments_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctordetails_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/doctorform_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/schedule/data/repository/schedule_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/choose_role/presentation/cubit/role_selection_cubit.dart';
import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/data/repository/favorite_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/find_doctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/features/common/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/core/repository/admin_repository.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/admindoctors_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/cubit/adminprofile_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/settings/presentation/cubit/adminsetting_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Supabase
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<AvatarStorageService>(
    () => AvatarStorageService(getIt<SupabaseClient>()),
  );

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepository(getIt<SupabaseClient>(), getIt<AvatarStorageService>()),
  );
  getIt.registerLazySingleton<AdminRepository>(
    () =>
        AdminRepository(getIt<SupabaseClient>(), getIt<AvatarStorageService>()),
  );
  getIt.registerLazySingleton<DoctorRepository>(
    () => DoctorRepository(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepository(getIt<SupabaseClient>()),
  );

  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepository(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<ScheduleRepository>(
    () => ScheduleRepository(getIt<SupabaseClient>()),
  );

  // Cubits
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit(getIt()));

  getIt.registerFactory<RoleSelectionCubit>(() => RoleSelectionCubit());

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory<SettingsCubit>(
    () => SettingsCubit(getIt<AuthRepository>()),
  );

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<DoctorRepository>()));
  getIt.registerFactory<AdminSettingsCubit>(
    () => AdminSettingsCubit(getIt<AdminRepository>()),
  );

  getIt.registerFactory<AdminProfileCubit>(
    () => AdminProfileCubit(getIt<AdminRepository>()),
  );
  getIt.registerFactory<AdminDoctorsCubit>(
    () => AdminDoctorsCubit(getIt<DoctorRepository>()),
  );
  getIt.registerFactory<AdminDoctorDetailsCubit>(
    () => AdminDoctorDetailsCubit(getIt<DoctorRepository>()),
  );
  getIt.registerFactory<DoctorFormCubit>(
    () => DoctorFormCubit(getIt<DoctorRepository>()),
  );
  getIt.registerFactory<DoctorDetailsCubit>(
    () => DoctorDetailsCubit(getIt<DoctorRepository>()),
  );
  getIt.registerFactory<FavoritesCubit>(
    () => FavoritesCubit(getIt<FavoriteRepository>()),
  );
  getIt.registerFactory<FindDoctorsCubit>(
    () => FindDoctorsCubit(getIt<DoctorRepository>()),
  );

  getIt.registerFactory<SelectTimeCubit>(
    () => SelectTimeCubit(
      getIt<DoctorRepository>(),
      getIt<AppointmentRepository>(),
    ),
  );
  getIt.registerFactory<ScheduleCubit>(
    () => ScheduleCubit(getIt<ScheduleRepository>()),
  );
  getIt.registerFactory<AppointmentCubit>(
    () => AppointmentCubit(getIt<AppointmentRepository>()),
  );
  getIt.registerFactory<AdminAppointmentsCubit>(
    () => AdminAppointmentsCubit(getIt<AppointmentRepository>()),
  );
  getIt.registerFactory<AdminAppointmentDetailsCubit>(
    () => AdminAppointmentDetailsCubit(getIt<AppointmentRepository>()),
  );
}
