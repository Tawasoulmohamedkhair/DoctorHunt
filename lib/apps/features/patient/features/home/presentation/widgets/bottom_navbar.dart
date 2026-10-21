import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  Widget _buildIcon({
    required BuildContext context,
    required IconData icon,
    required bool selected,
  }) {
    if (selected) {
      return Container(
        width: context.w(48),
        height: context.h(48),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: context.sp(24)),
      );
    }

    return Icon(icon, color: AppColors.textNavigation, size: context.sp(24));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                context: context,
                icon: Icons.home_sharp,
                selected: currentIndex == 0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                context: context,
                icon: Icons.favorite,
                selected: currentIndex == 1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                context: context,
                icon: Icons.menu_book_outlined,
                selected: currentIndex == 2,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                context: context,
                icon: Icons.chat_rounded,
                selected: currentIndex == 3,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
