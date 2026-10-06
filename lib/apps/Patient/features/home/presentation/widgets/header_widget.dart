// import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
// import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
// import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/search_bar.dart';
// import 'package:doctor_hunt/generated/assets.gen.dart';
// import 'package:doctor_hunt/generated/style_atoms.dart';
// import 'package:doctor_hunt/i18n/strings.g.dart';
// import 'package:flutter/material.dart';

// class HeaderWidget extends StatelessWidget {
//   final String userName;
//   final String? avatarUrl;
//   final VoidCallback? onMenuPressed;

//   const HeaderWidget({
//     super.key,
//     required this.userName,
//     this.avatarUrl,
//     this.onMenuPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = Translations.of(context);

//     final isShort = context.height < 500;

//     return SizedBox(
//       height: context.h(205),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             width: double.infinity,
//             height: isShort ? 120 : context.h(156),
//             padding: EdgeInsets.fromLTRB(
//               context.w(20),
//               isShort ? 8 : context.h(16),
//               context.w(20),
//               context.h(12),
//             ),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(Assets.images.header.path),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(context.r(30)),
//                 bottomRight: Radius.circular(context.r(30)),
//               ),
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 IconButton(
//                   onPressed: onMenuPressed,
//                   padding: EdgeInsets.zero,
//                   constraints: const BoxConstraints(),
//                   icon: Icon(
//                     Icons.menu,
//                     color: AppColors.white,
//                     size: context.sp(28),
//                   ),
//                 ),

//                 SizedBox(width: context.w(14)),

//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: context.h(15)),
//                       Text(
//                         '${t.hi} $userName',
//                         style: context.regular20lightgray,
//                       ),
//                       SizedBox(height: context.h(4)),
//                       Text(t.findDoctor, style: context.semiBold25white),
//                     ],
//                   ),
//                 ),

//                 CircleAvatar(
//                   radius: context.r(26),
//                   backgroundColor: AppColors.white,
//                   child: ClipOval(child: _buildProfileImage(context)),
//                 ),
//               ],
//             ),
//           ),

//           Positioned(
//             left: context.w(20),
//             right: context.w(20),
//             top: isShort ? context.h(80) : context.h(120),
//             child: const CustomSearchBar(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileImage(BuildContext context) {
//     final hasAvatar = avatarUrl != null && avatarUrl!.trim().isNotEmpty;

//     if (!hasAvatar) {
//       return _buildDefaultProfileImage(context);
//     }

//     return Image.network(
//       avatarUrl!,
//       fit: BoxFit.cover,
//       width: context.w(52),
//       height: context.w(52),
//       errorBuilder: (_, _, _) {
//         return _buildDefaultProfileImage(context);
//       },
//     );
//   }

//   Widget _buildDefaultProfileImage(BuildContext context) {
//     return Image.asset(
//       Assets.images.profile.path,
//       fit: BoxFit.cover,
//       width: context.w(52),
//       height: context.w(52),
//       errorBuilder: (_, _, _) {
//         return const Icon(Icons.person);
//       },
//     );
//   }
// }
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/search_bar.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final VoidCallback? onMenuPressed;

  const HeaderWidget({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.onMenuPressed,
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
                IconButton(
                  onPressed: onMenuPressed,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.menu,
                    color: AppColors.white,
                    size: context.sp(28),
                  ),
                ),
                SizedBox(width: context.w(14)),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isShort ? 0 : context.h(15)),
                        Text(
                          '${t.hi} $userName',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.regular20lightgray,
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
                  child: ClipOval(child: _buildProfileImage(context)),
                ),
              ],
            ),
          ),
          Positioned(
            left: context.w(20),
            right: context.w(20),
            top: isShort ? context.h(80) : context.h(120),
            child: const CustomSearchBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final hasAvatar = avatarUrl != null && avatarUrl!.trim().isNotEmpty;

    if (!hasAvatar) {
      return _buildDefaultProfileImage(context);
    }

    return Image.network(
      avatarUrl!,
      fit: BoxFit.cover,
      width: context.w(52),
      height: context.w(52),
      errorBuilder: (_, _, _) {
        return _buildDefaultProfileImage(context);
      },
    );
  }

  Widget _buildDefaultProfileImage(BuildContext context) {
    return Image.asset(
      Assets.images.profile.path,
      fit: BoxFit.cover,
      width: context.w(52),
      height: context.w(52),
      errorBuilder: (_, _, _) {
        return const Icon(Icons.person);
      },
    );
  }
}
