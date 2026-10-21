// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routers.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $onboardingRoute,
  $chooseRoleRoute,
  $loginRoute,
  $signUpRoute,
  $patientShellRoute,
  $detailsRoute,
  $selectTimeRoute,
  $findDoctorsRoute,
  $popularRoute,
  $adminProfileRoute,
  $createDoctorRoute,
  $editDoctorRoute,
  $adminDoctorDetailsRoute,
  $adminShellRoute,
  $adminAppointmentDetailsRoute,
  $adminDoctorScheduleRoute,
];

RouteBase get $splashRoute => GoRouteData.$route(
  path: '/splash',
  hasOverriddenOnExit: false,
  factory: $SplashRoute._fromState,
);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/splash');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingRoute => GoRouteData.$route(
  path: '/onboarding',
  hasOverriddenOnExit: false,
  factory: $OnboardingRoute._fromState,
);

mixin $OnboardingRoute on GoRouteData {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $chooseRoleRoute => GoRouteData.$route(
  path: '/choose-role',
  hasOverriddenOnExit: false,
  factory: $ChooseRoleRoute._fromState,
);

mixin $ChooseRoleRoute on GoRouteData {
  static ChooseRoleRoute _fromState(GoRouterState state) =>
      const ChooseRoleRoute();

  @override
  String get location => GoRouteData.$location('/choose-role');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  hasOverriddenOnExit: false,
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
    role: _$UserRoleEnumMap._$fromName(state.uri.queryParameters['role']!)!,
  );

  LoginRoute get _self => this as LoginRoute;

  @override
  String get location => GoRouteData.$location(
    '/login',
    queryParams: {'role': _$UserRoleEnumMap[_self.role]},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$UserRoleEnumMap = {
  UserRole.patient: 'patient',
  UserRole.admin: 'admin',
};

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}

RouteBase get $signUpRoute => GoRouteData.$route(
  path: '/signup',
  hasOverriddenOnExit: false,
  factory: $SignUpRoute._fromState,
);

mixin $SignUpRoute on GoRouteData {
  static SignUpRoute _fromState(GoRouterState state) => const SignUpRoute();

  @override
  String get location => GoRouteData.$location('/signup');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $patientShellRoute => ShellRouteData.$route(
  factory: $PatientShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/home',
      hasOverriddenOnExit: false,
      factory: $HomeRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/favourites',
      hasOverriddenOnExit: false,
      factory: $FavouritesRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/appointments',
      hasOverriddenOnExit: false,
      factory: $AppointmentsRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/settings',
      hasOverriddenOnExit: false,
      factory: $SettingsRoute._fromState,
    ),
  ],
);

extension $PatientShellRouteExtension on PatientShellRoute {
  static PatientShellRoute _fromState(GoRouterState state) =>
      const PatientShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FavouritesRoute on GoRouteData {
  static FavouritesRoute _fromState(GoRouterState state) =>
      const FavouritesRoute();

  @override
  String get location => GoRouteData.$location('/favourites');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppointmentsRoute on GoRouteData {
  static AppointmentsRoute _fromState(GoRouterState state) =>
      const AppointmentsRoute();

  @override
  String get location => GoRouteData.$location('/appointments');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $detailsRoute => GoRouteData.$route(
  path: '/details',
  hasOverriddenOnExit: false,
  factory: $DetailsRoute._fromState,
);

mixin $DetailsRoute on GoRouteData {
  static DetailsRoute _fromState(GoRouterState state) =>
      DetailsRoute(doctorId: state.uri.queryParameters['doctor-id']!);

  DetailsRoute get _self => this as DetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/details',
    queryParams: {'doctor-id': _self.doctorId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $selectTimeRoute => GoRouteData.$route(
  path: '/select-time',
  hasOverriddenOnExit: false,
  factory: $SelectTimeRoute._fromState,
);

mixin $SelectTimeRoute on GoRouteData {
  static SelectTimeRoute _fromState(GoRouterState state) =>
      SelectTimeRoute(doctorId: state.uri.queryParameters['doctor-id']!);

  SelectTimeRoute get _self => this as SelectTimeRoute;

  @override
  String get location => GoRouteData.$location(
    '/select-time',
    queryParams: {'doctor-id': _self.doctorId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $findDoctorsRoute => GoRouteData.$route(
  path: '/find-doctors',
  hasOverriddenOnExit: false,
  factory: $FindDoctorsRoute._fromState,
);

mixin $FindDoctorsRoute on GoRouteData {
  static FindDoctorsRoute _fromState(GoRouterState state) => FindDoctorsRoute(
    query: state.uri.queryParameters['query'],
    sortByRating:
        _$convertMapValue(
          'sort-by-rating',
          state.uri.queryParameters,
          _$boolConverter,
        ) ??
        false,
  );

  FindDoctorsRoute get _self => this as FindDoctorsRoute;

  @override
  String get location => GoRouteData.$location(
    '/find-doctors',
    queryParams: {
      if (_self.query != null) 'query': _self.query,
      if (_self.sortByRating != false)
        'sort-by-rating': _self.sortByRating.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $popularRoute => GoRouteData.$route(
  path: '/popular',
  hasOverriddenOnExit: false,
  factory: $PopularRoute._fromState,
);

mixin $PopularRoute on GoRouteData {
  static PopularRoute _fromState(GoRouterState state) => const PopularRoute();

  @override
  String get location => GoRouteData.$location('/popular');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminProfileRoute => GoRouteData.$route(
  path: '/admin-profile',
  hasOverriddenOnExit: false,
  factory: $AdminProfileRoute._fromState,
);

mixin $AdminProfileRoute on GoRouteData {
  static AdminProfileRoute _fromState(GoRouterState state) =>
      const AdminProfileRoute();

  @override
  String get location => GoRouteData.$location('/admin-profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createDoctorRoute => GoRouteData.$route(
  path: '/admin/doctors/create',
  hasOverriddenOnExit: false,
  factory: $CreateDoctorRoute._fromState,
);

mixin $CreateDoctorRoute on GoRouteData {
  static CreateDoctorRoute _fromState(GoRouterState state) =>
      const CreateDoctorRoute();

  @override
  String get location => GoRouteData.$location('/admin/doctors/create');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editDoctorRoute => GoRouteData.$route(
  path: '/admin/doctors/:doctorId/edit',
  hasOverriddenOnExit: false,
  factory: $EditDoctorRoute._fromState,
);

mixin $EditDoctorRoute on GoRouteData {
  static EditDoctorRoute _fromState(GoRouterState state) =>
      EditDoctorRoute(doctorId: state.pathParameters['doctorId']!);

  EditDoctorRoute get _self => this as EditDoctorRoute;

  @override
  String get location => GoRouteData.$location(
    '/admin/doctors/${Uri.encodeComponent(_self.doctorId)}/edit',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminDoctorDetailsRoute => GoRouteData.$route(
  path: '/admin/doctors/:doctorId',
  hasOverriddenOnExit: false,
  factory: $AdminDoctorDetailsRoute._fromState,
);

mixin $AdminDoctorDetailsRoute on GoRouteData {
  static AdminDoctorDetailsRoute _fromState(GoRouterState state) =>
      AdminDoctorDetailsRoute(doctorId: state.pathParameters['doctorId']!);

  AdminDoctorDetailsRoute get _self => this as AdminDoctorDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/admin/doctors/${Uri.encodeComponent(_self.doctorId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminShellRoute => ShellRouteData.$route(
  factory: $AdminShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/admin/doctors',
      hasOverriddenOnExit: false,
      factory: $AdminDoctorsRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/admin/appointments',
      hasOverriddenOnExit: false,
      factory: $AdminAppointmentsRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/admin/settings',
      hasOverriddenOnExit: false,
      factory: $AdminSettingsRoute._fromState,
    ),
  ],
);

extension $AdminShellRouteExtension on AdminShellRoute {
  static AdminShellRoute _fromState(GoRouterState state) =>
      const AdminShellRoute();
}

mixin $AdminDoctorsRoute on GoRouteData {
  static AdminDoctorsRoute _fromState(GoRouterState state) =>
      const AdminDoctorsRoute();

  @override
  String get location => GoRouteData.$location('/admin/doctors');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AdminAppointmentsRoute on GoRouteData {
  static AdminAppointmentsRoute _fromState(GoRouterState state) =>
      const AdminAppointmentsRoute();

  @override
  String get location => GoRouteData.$location('/admin/appointments');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AdminSettingsRoute on GoRouteData {
  static AdminSettingsRoute _fromState(GoRouterState state) =>
      const AdminSettingsRoute();

  @override
  String get location => GoRouteData.$location('/admin/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminAppointmentDetailsRoute => GoRouteData.$route(
  path: '/admin/appointments/:appointmentId',
  hasOverriddenOnExit: false,
  factory: $AdminAppointmentDetailsRoute._fromState,
);

mixin $AdminAppointmentDetailsRoute on GoRouteData {
  static AdminAppointmentDetailsRoute _fromState(GoRouterState state) =>
      AdminAppointmentDetailsRoute(
        appointmentId: state.pathParameters['appointmentId']!,
      );

  AdminAppointmentDetailsRoute get _self =>
      this as AdminAppointmentDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/admin/appointments/${Uri.encodeComponent(_self.appointmentId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminDoctorScheduleRoute => GoRouteData.$route(
  path: '/admin/doctors/:doctorId/schedule',
  hasOverriddenOnExit: false,
  factory: $AdminDoctorScheduleRoute._fromState,
);

mixin $AdminDoctorScheduleRoute on GoRouteData {
  static AdminDoctorScheduleRoute _fromState(GoRouterState state) =>
      AdminDoctorScheduleRoute(doctorId: state.pathParameters['doctorId']!);

  AdminDoctorScheduleRoute get _self => this as AdminDoctorScheduleRoute;

  @override
  String get location => GoRouteData.$location(
    '/admin/doctors/${Uri.encodeComponent(_self.doctorId)}/schedule',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
