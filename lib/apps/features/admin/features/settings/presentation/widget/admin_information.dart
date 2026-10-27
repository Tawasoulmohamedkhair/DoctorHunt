import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:doctor_hunt/apps/features/admin/features/settings/presentation/cubit/adminsetting_cubit.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminInformation extends StatelessWidget {
  final AdminModel settings;

  const AdminInformation({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    final name = settings.fullName.trim().isNotEmpty
        ? settings.fullName.trim()
        : t.administrator;

    return _AdminInformationCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: context.w(16),
        children: [
          AppImage(
            imageUrl: settings.avatarUrl,
            width: context.w(56),
            height: context.w(56),
            shape: AppImageShape.circle,
            fit: BoxFit.cover,
            backgroundColor: AppColors.white,
            fallback: Image.asset(
              Assets.images.profile.path,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.boldPx16.copyWith(fontSize: context.sp(16), color: AppColors.textDeep, height: 1.50),
                ),
                SizedBox(height: context.h(2)),
                Text(
                  settings.email,
                  textDirection: TextDirection.ltr,
                  textAlign: Directionality.of(context) == TextDirection.rtl
                      ? TextAlign.right
                      : TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.regularPx12.copyWith(fontSize: context.sp(12), color: AppColors.textMuted, height: 1.33),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdminInformationLoading extends StatelessWidget {
  const AdminInformationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return _AdminInformationCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _ProfilePlaceholder(),
          SizedBox(width: context.w(16)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TextPlaceholder(width: context.w(100), height: context.h(16)),
                SizedBox(height: context.h(6)),
                _TextPlaceholder(width: context.w(150), height: context.h(12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdminInformationError extends StatelessWidget {
  final String? message;

  const AdminInformationError({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return _AdminInformationCard(
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          SizedBox(width: context.w(12)),
          Expanded(
            child: Text(
              message ?? t.unableToLoadAdminInformation,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.regularPx12.copyWith(fontSize: context.sp(12), color: AppColors.textMuted),
            ),
          ),
          IconButton(
            tooltip: t.retry,
            onPressed: () {
              context.read<AdminSettingsCubit>().loadAdminSettings();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class _AdminInformationCard extends StatelessWidget {
  final Widget child;

  const _AdminInformationCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(16)),
      decoration: ShapeDecoration(
        color: AppColors.white,
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
      child: child,
    );
  }
}

class _ProfilePlaceholder extends StatelessWidget {
  const _ProfilePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(56),
      height: context.w(56),
      decoration: const BoxDecoration(
        color: AppColors.lightGreys,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person_outline, color: AppColors.textMuted),
    );
  }
}

class _TextPlaceholder extends StatelessWidget {
  final double width;
  final double height;

  const _TextPlaceholder({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.lightGreys,
        borderRadius: BorderRadius.circular(context.r(4)),
      ),
    );
  }
}

