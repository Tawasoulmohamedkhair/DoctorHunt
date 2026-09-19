import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onActionPressed;
  final IconData actionIcon;
  final bool showAction;

  const HeaderAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onActionPressed,
    this.actionIcon = Icons.search,
    this.showAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: AppColors.textSub,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),

              Text(title, style: context.medium18textSecondary),
            ],
          ),

          showAction
              ? IconButton(
                  icon: Icon(actionIcon, color: AppColors.textSub),
                  onPressed: onActionPressed,
                )
              : const SizedBox(width: 48),
        ],
      ),
    );
  }
}
