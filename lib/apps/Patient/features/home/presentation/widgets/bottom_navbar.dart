import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  Widget _buildIcon({required IconData icon, required bool selected}) {
    if (selected) {
      return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: 24),
      );
    }

    return Icon(icon, color: AppColors.textNavigation, size: 24);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: AppColors.white,
        elevation: 0,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(
              icon: Icons.home_sharp,
              selected: currentIndex == 0,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: _buildIcon(icon: Icons.favorite, selected: currentIndex == 1),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: _buildIcon(
              icon: Icons.menu_book_outlined,
              selected: currentIndex == 2,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: _buildIcon(
              icon: Icons.chat_rounded,
              selected: currentIndex == 3,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
