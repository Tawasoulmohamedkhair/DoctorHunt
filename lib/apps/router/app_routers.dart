import 'package:doctor_hunt/apps/admin/features/appointments/presentation/screen/appointments_screen.dart';
import 'package:doctor_hunt/apps/admin/features/doctor/presentation/screen/admin_doctors_screen.dart';
import 'package:doctor_hunt/apps/admin/features/profile/presentation/cubit/adminprofile_cubit.dart';
import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/widget/admin_shell.dart';
import 'package:doctor_hunt/apps/core/widget/patient_shell.dart';

import 'package:doctor_hunt/apps/Patient/features/Appointments/presentation/screens/appointments_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/Favourites/presentation/screens/favourites_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/poplular/presentation/screens/poplular_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/settings/presentation/screens/setting_screen.dart';

import 'package:doctor_hunt/apps/Patient/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/screen/chose_role_screen.dart';

import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/screen/doctor_details_screen.dart';

import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/screen/find_doctors_screen.dart';

import 'package:doctor_hunt/apps/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/screen/home_screen.dart';

import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/splash/splash_screen.dart';

import 'package:doctor_hunt/apps/admin/features/profile/presentation/screen/profile_screen.dart';
import 'package:doctor_hunt/apps/admin/features/settings/presentation/screen/admin_setting_screen.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'app_routers.g.dart';

// ============================================================
// Splash
// ============================================================

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

// ============================================================
// Onboarding
// ============================================================

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<OnboardingCubit>(),
      child: const OnboardingScreen(),
    );
  }
}

// ============================================================
// Choose Role
// ============================================================

@TypedGoRoute<ChooseRoleRoute>(path: '/choose-role')
class ChooseRoleRoute extends GoRouteData with $ChooseRoleRoute {
  const ChooseRoleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChooseRoleScreen();
  }
}

// ============================================================
// Login
// ============================================================

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute({required this.role});

  final UserRole role;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(role: role);
  }
}

// ============================================================
// Sign Up
// ============================================================

@TypedGoRoute<SignUpRoute>(path: '/signup')
class SignUpRoute extends GoRouteData with $SignUpRoute {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignupScreen();
  }
}

// ============================================================
// Patient Shell
// ============================================================

@TypedShellRoute<PatientShellRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<FavouritesRoute>(path: '/favourites'),
    TypedGoRoute<AppointmentsRoute>(path: '/appointments'),
    TypedGoRoute<SettingsRoute>(path: '/settings'),
  ],
)
class PatientShellRoute extends ShellRouteData {
  const PatientShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return PatientShell(child: navigator);
  }
}

// ============================================================
// Patient - Home
// ============================================================

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: const HomeScreen(),
    );
  }
}

// ============================================================
// Patient - Favourites
// ============================================================

class FavouritesRoute extends GoRouteData with $FavouritesRoute {
  const FavouritesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FavouritesScreen();
  }
}

// ============================================================
// Patient - Appointments
// ============================================================

class AppointmentsRoute extends GoRouteData with $AppointmentsRoute {
  const AppointmentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppointmentsScreen();
  }
}

// ============================================================
// Patient - Settings
// ============================================================

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingScreen();
  }
}

// ============================================================
// Doctor Details
// ============================================================

@TypedGoRoute<DetailsRoute>(path: '/details')
class DetailsRoute extends GoRouteData with $DetailsRoute {
  const DetailsRoute({required this.doctorId});

  final String doctorId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<DoctorDetailsCubit>(),
      child: DoctorDetailsScreen(doctorId: doctorId),
    );
  }
}

// ============================================================
// Find Doctors
// ============================================================

@TypedGoRoute<FindDoctorsRoute>(path: '/find-doctors')
class FindDoctorsRoute extends GoRouteData with $FindDoctorsRoute {
  const FindDoctorsRoute({this.query});

  final String? query;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<FindDoctorsCubit>()..loadDoctors(query: query),
      child: FindDoctorsScreen(initialQuery: query),
    );
  }
}

// ============================================================
// Popular Doctors
// ============================================================

@TypedGoRoute<PopularRoute>(path: '/popular')
class PopularRoute extends GoRouteData with $PopularRoute {
  const PopularRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PopularScreen();
  }
}

// ============================================================
// Admin Profile
// ============================================================


@TypedGoRoute<AdminProfileRoute>(path: '/admin-profile')
class AdminProfileRoute extends GoRouteData with $AdminProfileRoute {
  const AdminProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<AdminProfileCubit>()..loadProfile(),
      child: const AdminProfileScreen(),
    );
  }
}

// ============================================================
// Admin Shell
// ============================================================

@TypedShellRoute<AdminShellRoute>(
  routes: [
    TypedGoRoute<AdminDoctorsRoute>(path: '/admin/doctors'),
    TypedGoRoute<AdminAppointmentsRoute>(path: '/admin/appointments'),
    TypedGoRoute<AdminSettingsRoute>(path: '/admin/settings'),
  ],
)
class AdminShellRoute extends ShellRouteData {
  const AdminShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AdminShell(child: navigator);
  }
}

// ============================================================
// Admin - Doctors
// ============================================================

class AdminDoctorsRoute extends GoRouteData with $AdminDoctorsRoute {
  const AdminDoctorsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminDoctorsScreen();
  }
}

// ============================================================
// Admin - Appointments
// ============================================================

class AdminAppointmentsRoute extends GoRouteData with $AdminAppointmentsRoute {
  const AdminAppointmentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminAppointmentsScreen();
  }
}

// ============================================================
// Admin - Settings
// ============================================================

class AdminSettingsRoute extends GoRouteData with $AdminSettingsRoute {
  const AdminSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminSettingScreen();
  }
}
