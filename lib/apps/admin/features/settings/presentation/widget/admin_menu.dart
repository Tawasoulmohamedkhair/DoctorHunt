import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

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
      child: Column(
        children: [
          _AdminMenuItem(
            icon: Icons.person_outline,
            title: 'Admin Profile',
            subtitle: 'Edit super admin details & permissions',
            showArrow: true,
            onTap: () {
              const AdminProfileRoute().push(context);
            },
          ),
          Divider(
            height: context.h(24),
            thickness: 1,
            color: const Color(0xFFE8ECEA),
          ),
          _AdminMenuItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            subtitle: 'Update master security credentials',
            showArrow: true,
            onTap: () {
              // سيتم ربطها بـ Change Password Route
            },
          ),
          SizedBox(height: context.h(24)),
          _AdminMenuItem(
            icon: Icons.info_outline,
            title: 'App Information',
            subtitle: 'Build version',
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
              color: const Color(0xFF52625E),
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
                  style: TextStyle(
                    color: const Color(0xFF161D19),
                    fontSize: context.sp(14),
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    height: 1.43,
                  ),
                ),
                SizedBox(height: context.h(2)),
                Text(
                  subtitle,
                  maxLines: 2,
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
          if (version != null)
            Text(
              version!,
              style: TextStyle(
                color: const Color(0xFF52625E),
                fontSize: context.sp(12),
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w400,
              ),
            )
          else if (showArrow)
            Icon(
              Icons.arrow_forward_ios,
              size: context.sp(16),
              color: const Color(0xFF52625E),
            ),
        ],
      ),
    );
  }
}
