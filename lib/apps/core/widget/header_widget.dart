import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onActionPressed;
  final IconData? actionIcon;
  final IconData? icon2;
  final bool showAction;
  final bool showBackButton;
  final String? text;

  const HeaderAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onActionPressed,
    this.actionIcon,
    this.showAction = true,
    this.showBackButton = true,
    this.text = '',
    this.icon2,
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
            if (showBackButton) ...[
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
            ],

            Expanded(
              child: Text(
                title,
                style: context.medium18textSecondary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                showAction
                    ? IconButton(
                        icon: Icon(actionIcon, color: AppColors.textSub),
                        onPressed: onActionPressed,
                      )
                    : SizedBox(width: context.w(48)),
                if (text != null && text!.isNotEmpty)
                  Container(
                    width: context.w(30),
                    height: context.w(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Center(child: Icon(icon2, color: AppColors.white, size: context.sp(16))),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
