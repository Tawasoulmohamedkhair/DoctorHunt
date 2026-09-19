import 'package:doctor_hunt/apps/Patient/features/home/presentation/widgets/search_bar.dart';
import 'package:doctor_hunt/gen/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ==================== Header Background ====================
          Container(
            width: double.infinity,
            height: 156.h,
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.header.path),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            // ==================== Header Content ====================
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),

                      Text(
                        context.t.home.hihand,
                        style: context.regular20lightgray,
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        context.t.home.findDoctor,
                        style: context.semiBold25white,
                      ),
                    ],
                  ),
                ),

                CircleAvatar(
                  radius: 26.r,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      Assets.images.profile.path,
                      fit: BoxFit.cover,
                      width: 52.w,
                      height: 52.h,
                      errorBuilder: (_, _, _) => const Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ==================== Search ====================
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 120.h,
            child: CustomSearchBar(),
          ),
        ],
      ),
    );
  }
}
