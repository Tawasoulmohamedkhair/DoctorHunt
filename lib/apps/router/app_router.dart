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

    // Patient
    $patientShellRoute,

    // Patient standalone routes
    $detailsRoute,
    $findDoctorsRoute,
    $popularRoute,

    // Admin standalone routes
    $adminProfileRoute,

    // Admin Shell
    $adminShellRoute,
  ],
);
