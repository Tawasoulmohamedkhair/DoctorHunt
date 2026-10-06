import 'package:doctor_hunt/apps/admin/data/model/admin_model.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class AdminInformation extends StatelessWidget {
  final AdminModel settings;

  const AdminInformation({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return _AdminInformationCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: context.w(16),
        children: [
          _ProfileImage(avatarUrl: settings.avatarUrl),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.administrator,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF161D19),
                    fontSize: context.sp(16),
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    height: 1.50,
                  ),
                ),
                SizedBox(height: context.h(2)),
                Text(
                  settings.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF52625E),
                    fontSize: context.sp(12),
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    height: 1.33,
                  ),
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
              message ?? 'Failed to load admin information',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF52625E),
                fontSize: context.sp(12),
                fontFamily: 'Rubik',
              ),
            ),
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
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.r(16)),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
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

class _ProfileImage extends StatelessWidget {
  final String? avatarUrl;

  const _ProfileImage({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(56),
      height: context.w(56),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFE8F0E8),
        shape: const CircleBorder(),
      ),
      child: avatarUrl != null && avatarUrl!.trim().isNotEmpty
          ? Image.network(
              avatarUrl!,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Image.asset(
                  Assets.images.profile.path,
                  fit: BoxFit.cover,
                );
              },
            )
          : Image.asset(Assets.images.profile.path, fit: BoxFit.cover),
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
        color: Color(0xFFE8F0E8),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person_outline, color: Color(0xFF52625E)),
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
        color: const Color(0xFFE8F0E8),
        borderRadius: BorderRadius.circular(context.r(4)),
      ),
    );
  }
}
