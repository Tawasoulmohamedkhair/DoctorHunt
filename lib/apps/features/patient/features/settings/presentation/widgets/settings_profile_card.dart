import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_state.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SettingsProfileCard extends StatelessWidget {
  const SettingsProfileCard({super.key, required this.state});

  final SettingsState state;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    final userName = state.userName.trim().isNotEmpty
        ? state.userName
        : t.patientUser;

    return Container(
      padding: EdgeInsets.all(context.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(16)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          AppImage(
            key: ValueKey(state.avatarUrl),
            imageUrl: state.avatarUrl,
            width: context.w(56),
            height: context.w(56),
            shape: AppImageShape.circle,
            backgroundColor: AppColors.lightGreys,
            fallback: Icon(
              Icons.person,
              size: context.sp(30),
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: context.w(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.isLoadingProfile ? t.loading : userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.boldPx16.copyWith(
                    fontSize: context.sp(16),
                    color: AppColors.textDeep,
                  ),
                ),
                SizedBox(height: context.h(4)),
                Text(
                  state.userEmail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.regularPx12.copyWith(
                    fontSize: context.sp(12),
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: context.sp(20),
            color: AppColors.textSub,
          ),
        ],
      ),
    );
  }
}
