import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminNavigationBar extends StatelessWidget {
  const AdminNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    final selectedIndex = _getSelectedIndex(currentPath);

    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _AdminNavigationItem(
            icon: Icons.medical_services_outlined,
            label: t.doctors,
            isSelected: selectedIndex == 0,
            onTap: () {
              const AdminDoctorsRoute().go(context);
            },
          ),
          _AdminNavigationItem(
            icon: Icons.calendar_month_outlined,
            label: t.appointments,
            isSelected: selectedIndex == 1,
            onTap: () {
              const AdminAppointmentsRoute().go(context);
            },
          ),
          _AdminNavigationItem(
            icon: Icons.settings_outlined,
            label: t.settings,
            isSelected: selectedIndex == 2,
            onTap: () {
              const AdminSettingsRoute().go(context);
            },
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(String location) {
    if (location.startsWith('/admin/doctors')) {
      return 0;
    }

    if (location.startsWith('/admin/appointments')) {
      return 1;
    }

    if (location.startsWith('/admin/settings')) {
      return 2;
    }

    return 0;
  }
}

class _AdminNavigationItem extends StatelessWidget {
  const _AdminNavigationItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static const Color selectedColor = AppColors.success;
  static const Color unselectedColor = AppColors.slateBlue;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? selectedColor : unselectedColor;

    return SizedBox(
      width: 72,
      height: 44,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.mediumPx12.copyWith(color: color, height: 1.33, letterSpacing: -0.30),
            ),
          ],
        ),
      ),
    );
  }
}
