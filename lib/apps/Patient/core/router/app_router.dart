import 'package:go_router/go_router.dart';
import 'app_routers.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    $splashRoute,
    $onboardingRoute,
    $chooseRoleRoute,
    $loginRoute,
    $signUpRoute,
    $homeRoute,
    $detailsRoute,
    $findDoctorsRoute,
  ],
);
