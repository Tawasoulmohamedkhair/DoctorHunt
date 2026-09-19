
import 'package:doctor_hunt/apps/Patient/core/di/injection.dart';
import 'package:doctor_hunt/apps/Patient/features/Choose%20role/presentation/screen/chose_role_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/screen/doctor_details_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/screen/find_doctors_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/screen/home_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/cubit/onboardin_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:doctor_hunt/apps/Patient/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'app_routers.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

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

@TypedGoRoute<ChooseRoleRoute>(path: '/choose-role')
class ChooseRoleRoute extends GoRouteData with $ChooseRoleRoute {
  const ChooseRoleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChooseRoleScreen();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: const LoginScreen(),
    );
  }
}

@TypedGoRoute<SignUpRoute>(path: '/signup')
class SignUpRoute extends GoRouteData with $SignUpRoute {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: const SignupScreen(),
    );
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
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
@TypedGoRoute<DetailsRoute>(path: '/details')
class DetailsRoute extends GoRouteData with $DetailsRoute {
 DetailsRoute({required this.doctorId});

  final String doctorId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (_) => getIt<DoctorDetailsCubit>(),
      child:  DoctorDetailsScreen(doctorId: doctorId ,),
    );
  }
}

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
