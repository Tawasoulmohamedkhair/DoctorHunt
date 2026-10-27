import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/search_bar.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchTap;

  const HeaderWidget({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.onMenuPressed,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isShort = context.height < 500;

    return SizedBox(
      height: context.h(205),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: isShort ? 120 : context.h(156),
            padding: EdgeInsets.fromLTRB(
              context.w(20),
              isShort ? 8 : context.h(16),
              context.w(20),
              context.h(12),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.header.path),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.r(30)),
                bottomRight: Radius.circular(context.r(30)),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                SizedBox(
                  width: 48,
                  height: 48,
                  child: IconButton(
                    onPressed: onMenuPressed,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 48,
                      minHeight: 48,
                    ),
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.white,
                      size: context.sp(28),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isShort ? 0 : context.h(20)),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${t.hi} $userName',
                              maxLines: 1,
                              style: context.regular20lightgray,
                            ),
                          ),
                        ),
                        SizedBox(height: isShort ? 0 : context.h(4)),
                        Text(
                          t.findDoctor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.semiBold25white,
                        ),
                      ],
                    ),
                  ),
                ),

                CircleAvatar(
                  radius: context.r(26),
                  backgroundColor: AppColors.white,
                  child: ClipOval(
                    child: AppImage(
                      imageUrl: avatarUrl,
                      width: context.w(52),
                      height: context.w(52),
                      shape: AppImageShape.circle,
                      fit: BoxFit.cover,
                      backgroundColor: AppColors.white,
                      fallback: Image.asset(
                        Assets.images.profile.path,
                        width: context.w(52),
                        height: context.w(52),
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => const Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: context.w(20),
            right: context.w(20),
            top: isShort ? context.h(80) : context.h(120),
            child: CustomSearchBar(onTap: onSearchTap),
          ),
        ],
      ),
    );
  }
}
