import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;

  const SocialMediaWidget({
    super.key,
    this.onGooglePressed,
    this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: _socialItem(
            context,
            image: Assets.images.google.image(
              width: context.w(20),
              height: context.w(20),
            ),
            text: t.google,
            onTap: onGooglePressed,
          ),
        ),
      ],
    );
  }

  Widget _socialItem(
    BuildContext context, {
    required Widget image,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.r(12)),
      child: Container(
        height: context.h(54),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(context.r(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.15),
              blurRadius: context.r(22),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            SizedBox(width: context.w(8)),
            Text(text, style: context.light16textSecondary),
          ],
        ),
      ),
    );
  }
}
