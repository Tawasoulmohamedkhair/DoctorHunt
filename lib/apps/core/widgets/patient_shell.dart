import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/widgets/patient_drawer.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';

class PatientShell extends StatefulWidget {
  const PatientShell({super.key, required this.child});

  final Widget child;

  @override
  State<PatientShell> createState() => _PatientShellState();
}

class _PatientShellState extends State<PatientShell> {
  final ZoomDrawerController _drawerController = ZoomDrawerController();

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith(const FavouritesRoute().location)) return 1;
    if (location.startsWith(const AppointmentsRoute().location)) return 2;
    if (location.startsWith(const SettingsRoute().location)) return 3;
    return 0;
  }

  void _onNavigationTap(BuildContext context, int index) {
    switch (index) {
      case 1:
        const FavouritesRoute().go(context);
      case 2:
        const AppointmentsRoute().go(context);
      case 3:
        const SettingsRoute().go(context);
      case 0:
      default:
        const HomeRoute().go(context);
    }
  }

  void _navigateFromDrawer(BuildContext context, GoRouteData route) {
    _drawerController.close?.call();
    route.go(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    final userName = context.select(
      (AuthCubit c) => c.state.user?.fullName ?? 'User',
    );
    final avatarUrl = context.select((AuthCubit c) => c.state.user?.avatarUrl);

    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      
      angle: -12,
      borderRadius: context.r(30),
      showShadow: true,
      mainScreenTapClose: true,
      slideWidth: context.safeWidth * 0.72,
      menuBackgroundColor: AppColors.drawerTop,
      menuScreen: PatientDrawer(
        userName: userName,
        avatarUrl: avatarUrl,
        selectedIndex: currentIndex,
        onHomeTap: () => _navigateFromDrawer(context, const HomeRoute()),
        onFavouritesTap: () =>
            _navigateFromDrawer(context, const FavouritesRoute()),
        onAppointmentsTap: () =>
            _navigateFromDrawer(context, const AppointmentsRoute()),
        onSettingsTap: () =>
            _navigateFromDrawer(context, const SettingsRoute()),
        onLogoutTap: () {
          _drawerController.close?.call();
        },
      ),
      mainScreen: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
          onTap: (i) => _onNavigationTap(context, i),
        ),
      ),
    );
  }
}
