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
    $selectTimeRoute,
    $findDoctorsRoute,
    $popularRoute,

    // Admin standalone routes
    $adminProfileRoute,
    // Admin - Create Doctor
    $createDoctorRoute,
    $editDoctorRoute,
    //admin - Doctor Details
    $adminDoctorDetailsRoute,

    // Admin Shell
    $adminShellRoute,

    // Admin standalone routes
    $adminDoctorScheduleRoute,
    // Admin - AppointmentsDetails
    $adminAppointmentDetailsRoute,
  ],
);
