import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/admin/features/settings/presentation/cubit/adminsetting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(16)),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.r(16)),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          _AdminMenuItem(
            icon: Icons.person_outline,
            title: t.adminprofile,
            subtitle: t.editsuperadmin,
            showArrow: true,
            onTap: () async {
              final result = await const AdminProfileRoute().push<bool>(
                context,
              );

              if (!context.mounted || result != true) return;

              context.read<AdminSettingsCubit>().loadAdminSettings();
            },
          ),
          Divider(
            height: context.h(24),
            thickness: 1,
            color: const Color(0xFFE8ECEA),
          ),
          _AdminMenuItem(
            icon: Icons.lock_outline,
            title: t.changepassword,
            subtitle: t.updatecredentials,
            showArrow: true,
            onTap: () {
              // سيتم ربطها بـ Change Password Route
            },
          ),
          Divider(
            height: context.h(24),
            thickness: 1,
            color: const Color(0xFFE8ECEA),
          ),
          _AdminMenuItem(
            icon: Icons.info_outline,
            title: t.appinfo,
            subtitle: t.buildversion,
            version: 'v1.0.0',
            onTap: () {
              // سيتم ربطها بـ App Information Route
            },
          ),
        ],
      ),
    );
  }
}

class _AdminMenuItem extends StatelessWidget {
  const _AdminMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showArrow = false,
    this.version,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool showArrow;
  final String? version;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.r(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: context.w(40),
            height: context.w(40),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF6EE),
              borderRadius: BorderRadius.circular(context.r(12)),
            ),
            child: Icon(
              icon,
              size: context.sp(22),
              color: AppColors.textMuted,
            ),
          ),
          SizedBox(width: context.w(14)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.semiBoldPx14.copyWith(fontSize: context.sp(14), color: AppColors.textDeep, height: 1.43),
                ),
                SizedBox(height: context.h(2)),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.regularPx12.copyWith(fontSize: context.sp(12), color: AppColors.textMuted, height: 1.33),
                ),
              ],
            ),
          ),
          if (version != null)
            Text(
              version!,
              style: context.regularPx12.copyWith(fontSize: context.sp(12), color: AppColors.textMuted),
            )
          else if (showArrow)
            Icon(
              Icons.arrow_forward_ios,
              size: context.sp(16),
              color: AppColors.textMuted,
            ),
        ],
      ),
    );
  }
}

