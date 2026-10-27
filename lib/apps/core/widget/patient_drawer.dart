import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({
    super.key,
    required this.userName,
    this.avatarUrl,
    required this.selectedIndex,
    required this.onHomeTap,
    required this.onFavouritesTap,
    required this.onAppointmentsTap,
    required this.onSettingsTap,
    required this.onLogoutTap,
  });

  final String userName;
  final String? avatarUrl;
  final int selectedIndex;

  final VoidCallback onHomeTap;
  final VoidCallback onFavouritesTap;
  final VoidCallback onAppointmentsTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onLogoutTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.drawerGradient),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w(16)),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.h(30)),
                      _DrawerHeaderProfile(
                        userName: userName,
                        avatarUrl: avatarUrl,
                      ),
                      SizedBox(height: context.h(45)),
                      _DrawerItemTile(
                        icon: selectedIndex == 0
                            ? Icons.home
                            : Icons.home_outlined,
                        title: t.home,
                        isSelected: selectedIndex == 0,
                        onTap: onHomeTap,
                      ),
                      _DrawerItemTile(
                        icon: selectedIndex == 1
                            ? Icons.favorite
                            : Icons.favorite_border,
                        title: t.favorites,
                        isSelected: selectedIndex == 1,
                        onTap: onFavouritesTap,
                      ),
                      _DrawerItemTile(
                        icon: selectedIndex == 2
                            ? Icons.menu_book
                            : Icons.menu_book_outlined,
                        title: t.myappointments,
                        isSelected: selectedIndex == 2,
                        onTap: onAppointmentsTap,
                      ),
                      _DrawerItemTile(
                        icon: selectedIndex == 3
                            ? Icons.settings
                            : Icons.settings_outlined,
                        title: t.settings,
                        isSelected: selectedIndex == 3,
                        onTap: onSettingsTap,
                      ),
                      const Spacer(),
                      _DrawerItemTile(
                        icon: Icons.logout,
                        title: 'Logout',
                        isSelected: false,
                        isDestructive: true,
                        onTap: onLogoutTap,
                      ),
                      SizedBox(height: context.h(20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerHeaderProfile extends StatelessWidget {
  const _DrawerHeaderProfile({required this.userName, this.avatarUrl});

  final String userName;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final hasAvatar = avatarUrl != null && avatarUrl!.trim().isNotEmpty;

    return Row(
      children: [
        CircleAvatar(
          radius: context.r(28),
          backgroundColor: AppColors.white,
          backgroundImage: hasAvatar ? NetworkImage(avatarUrl!) : null,
          child: hasAvatar
              ? null
              : Icon(
                  Icons.person,
                  color: AppColors.textNavigation,
                  size: context.sp(28),
                ),
        ),
        SizedBox(width: context.w(14)),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              userName,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: context.regular16white,
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawerItemTile extends StatelessWidget {
  const _DrawerItemTile({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final contentColor = isDestructive
        ? Colors.redAccent.shade100
        : AppColors.white;

    return Padding(
      padding: EdgeInsets.only(bottom: context.h(8)),
      child: Material(
        color: isSelected ? Colors.white.withAlpha(30) : Colors.transparent,
        borderRadius: BorderRadius.circular(context.r(12)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.r(12)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.w(12),
              vertical: context.h(12),
            ),
            child: Row(
              children: [
                Icon(icon, color: contentColor, size: context.sp(22)),
                SizedBox(width: context.w(16)),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: contentColor,
                      fontSize: context.sp(15),
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
