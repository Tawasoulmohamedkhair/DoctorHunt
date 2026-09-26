import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/search_bar.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isShort = context.height < 500;
    return SizedBox(
      height: context.h(205),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: isShort ? 100 : context.h(156),
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
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.h(15)),
                      Text(
                        t.hihand,
                        style: context.regular20lightgray,
                      ),
                      SizedBox(height: context.h(4)),
                      Text(
                        t.findDoctor,
                        style: context.semiBold25white,
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: context.r(26),
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      Assets.images.profile.path,
                      fit: BoxFit.cover,
                      width: context.w(52),
                      height: context.w(52),
                      errorBuilder: (_, _, _) => const Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: context.w(20),
            right: context.w(20),
            top: context.h(120),
            child: const CustomSearchBar(),
          ),
        ],
      ),
    );
  }
}
