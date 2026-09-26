import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

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
      height: context.h(56),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onBackPressed ?? () => Navigator.pop(context),
                  child: Container(
                    width: context.w(30),
                    height: context.w(30),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(context.r(10)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: context.sp(16),
                        color: AppColors.textSub,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: context.w(20)),
                Text(title, style: context.medium18textSecondary),
              ],
            ),
            showAction
                ? IconButton(
                    icon: Icon(actionIcon, color: AppColors.textSub),
                    onPressed: onActionPressed,
                  )
                : SizedBox(width: context.w(48)),
          ],
        ),
      ),
    );
  }
}
