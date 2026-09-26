import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class LanguageSwitchButton extends StatelessWidget {
  const LanguageSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnglish = LocaleSettings.currentLocale == AppLocale.en;

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(context.r(20)),
          border: Border.all(color: AppColors.primary, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextButton.icon(
          onPressed: () {
            LocaleSettings.setLocale(isEnglish ? AppLocale.ar : AppLocale.en);
          },
          icon: Icon(
            Icons.language_rounded,
            color: AppColors.primary,
            size: context.sp(18),
          ),
          label: Text(
            isEnglish ? 'العربية' : 'English',
            style: context.semiBold13primary,
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: context.w(12),
              vertical: context.h(6),
            ),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
    );
  }
}
