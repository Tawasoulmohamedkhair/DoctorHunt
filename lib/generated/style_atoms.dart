import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



extension WeightAtoms on BuildContext {
  TextStyle get style => const TextStyle(
        fontFamily: 'Rubik',
      );


  TextStyle get light => style.copyWith(
        fontWeight: FontWeight.w300,
      );

  TextStyle get regular => style.copyWith(
        fontWeight: FontWeight.w400,
      );

  TextStyle get medium => style.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get semiBold => style.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get bold => style.copyWith(
        fontWeight: FontWeight.w700,
      );

}
extension ColorAtoms on TextStyle {

  TextStyle get primary => copyWith(
        color: AppColors.primary,
      );

  TextStyle get primaryLight => copyWith(
        color: AppColors.primaryLight,
      );

  TextStyle get primaryDark => copyWith(
        color: AppColors.primaryDark,
      );

  TextStyle get textMain => copyWith(
        color: AppColors.textMain,
      );

  TextStyle get textSecondary => copyWith(
        color: AppColors.textSecondary,
      );

  TextStyle get textSub => copyWith(
        color: AppColors.textSub,
      );

  TextStyle get textPlaceholder => copyWith(
        color: AppColors.textPlaceholder,
      );

  TextStyle get textNavigation => copyWith(
        color: AppColors.textNavigation,
      );

  TextStyle get textDark => copyWith(
        color: AppColors.textDark,
      );

  TextStyle get danger => copyWith(
        color: AppColors.danger,
      );

  TextStyle get rating => copyWith(
        color: AppColors.rating,
      );

  TextStyle get white => copyWith(
        color: AppColors.white,
      );

  TextStyle get black => copyWith(
        color: AppColors.black,
      );

}
extension FontSizeAtoms on TextStyle {

  TextStyle get px8 => copyWith(
        fontSize: 8.sp,
      );

  TextStyle get px11 => copyWith(
        fontSize: 11.sp,
      );

  TextStyle get px12 => copyWith(
        fontSize: 12.sp,
      );

  TextStyle get px14 => copyWith(
        fontSize: 14.sp,
      );

  TextStyle get px16 => copyWith(
        fontSize: 16.sp,
      );

  TextStyle get px18 => copyWith(
        fontSize: 18.sp,
      );

  TextStyle get px20 => copyWith(
        fontSize: 20.sp,
      );

  TextStyle get px22 => copyWith(
        fontSize: 22.sp,
      );

  TextStyle get px24 => copyWith(
        fontSize: 24.sp,
      );

  TextStyle get px26 => copyWith(
        fontSize: 26.sp,
      );

  TextStyle get px28 => copyWith(
        fontSize: 28.sp,
      );

  TextStyle get px30 => copyWith(
        fontSize: 30.sp,
      );

  TextStyle get px32 => copyWith(
        fontSize: 32.sp,
      );

  TextStyle get px36 => copyWith(
        fontSize: 36.sp,
      );

  TextStyle get px40 => copyWith(
        fontSize: 40.sp,
      );

}
extension WeightAndPxMixes on BuildContext {

  TextStyle get lightPx8 => light.px8;

  TextStyle get lightPx11 => light.px11;

  TextStyle get lightPx12 => light.px12;

  TextStyle get lightPx14 => light.px14;

  TextStyle get lightPx16 => light.px16;

  TextStyle get lightPx18 => light.px18;

  TextStyle get lightPx20 => light.px20;

  TextStyle get lightPx22 => light.px22;

  TextStyle get lightPx24 => light.px24;

  TextStyle get lightPx26 => light.px26;

  TextStyle get lightPx28 => light.px28;

  TextStyle get lightPx30 => light.px30;

  TextStyle get lightPx32 => light.px32;

  TextStyle get lightPx36 => light.px36;

  TextStyle get lightPx40 => light.px40;

  TextStyle get regularPx8 => regular.px8;

  TextStyle get regularPx11 => regular.px11;

  TextStyle get regularPx12 => regular.px12;

  TextStyle get regularPx14 => regular.px14;

  TextStyle get regularPx16 => regular.px16;

  TextStyle get regularPx18 => regular.px18;

  TextStyle get regularPx20 => regular.px20;

  TextStyle get regularPx22 => regular.px22;

  TextStyle get regularPx24 => regular.px24;

  TextStyle get regularPx26 => regular.px26;

  TextStyle get regularPx28 => regular.px28;

  TextStyle get regularPx30 => regular.px30;

  TextStyle get regularPx32 => regular.px32;

  TextStyle get regularPx36 => regular.px36;

  TextStyle get regularPx40 => regular.px40;

  TextStyle get mediumPx8 => medium.px8;

  TextStyle get mediumPx11 => medium.px11;

  TextStyle get mediumPx12 => medium.px12;

  TextStyle get mediumPx14 => medium.px14;

  TextStyle get mediumPx16 => medium.px16;

  TextStyle get mediumPx18 => medium.px18;

  TextStyle get mediumPx20 => medium.px20;

  TextStyle get mediumPx22 => medium.px22;

  TextStyle get mediumPx24 => medium.px24;

  TextStyle get mediumPx26 => medium.px26;

  TextStyle get mediumPx28 => medium.px28;

  TextStyle get mediumPx30 => medium.px30;

  TextStyle get mediumPx32 => medium.px32;

  TextStyle get mediumPx36 => medium.px36;

  TextStyle get mediumPx40 => medium.px40;

  TextStyle get semiBoldPx8 => semiBold.px8;

  TextStyle get semiBoldPx11 => semiBold.px11;

  TextStyle get semiBoldPx12 => semiBold.px12;

  TextStyle get semiBoldPx14 => semiBold.px14;

  TextStyle get semiBoldPx16 => semiBold.px16;

  TextStyle get semiBoldPx18 => semiBold.px18;

  TextStyle get semiBoldPx20 => semiBold.px20;

  TextStyle get semiBoldPx22 => semiBold.px22;

  TextStyle get semiBoldPx24 => semiBold.px24;

  TextStyle get semiBoldPx26 => semiBold.px26;

  TextStyle get semiBoldPx28 => semiBold.px28;

  TextStyle get semiBoldPx30 => semiBold.px30;

  TextStyle get semiBoldPx32 => semiBold.px32;

  TextStyle get semiBoldPx36 => semiBold.px36;

  TextStyle get semiBoldPx40 => semiBold.px40;

  TextStyle get boldPx8 => bold.px8;

  TextStyle get boldPx11 => bold.px11;

  TextStyle get boldPx12 => bold.px12;

  TextStyle get boldPx14 => bold.px14;

  TextStyle get boldPx16 => bold.px16;

  TextStyle get boldPx18 => bold.px18;

  TextStyle get boldPx20 => bold.px20;

  TextStyle get boldPx22 => bold.px22;

  TextStyle get boldPx24 => bold.px24;

  TextStyle get boldPx26 => bold.px26;

  TextStyle get boldPx28 => bold.px28;

  TextStyle get boldPx30 => bold.px30;

  TextStyle get boldPx32 => bold.px32;

  TextStyle get boldPx36 => bold.px36;

  TextStyle get boldPx40 => bold.px40;

}
extension StyleAtoms on BuildContext {

  TextStyle get light8primary =>
      lightPx8.primary;

  TextStyle get light8primaryLight =>
      lightPx8.primaryLight;

  TextStyle get light8primaryDark =>
      lightPx8.primaryDark;

  TextStyle get light8textMain =>
      lightPx8.textMain;

  TextStyle get light8textSecondary =>
      lightPx8.textSecondary;

  TextStyle get light8textSub =>
      lightPx8.textSub;

  TextStyle get light8textPlaceholder =>
      lightPx8.textPlaceholder;

  TextStyle get light8textNavigation =>
      lightPx8.textNavigation;

  TextStyle get light8textDark =>
      lightPx8.textDark;

  TextStyle get light8danger =>
      lightPx8.danger;

  TextStyle get light8rating =>
      lightPx8.rating;

  TextStyle get light8white =>
      lightPx8.white;

  TextStyle get light8black =>
      lightPx8.black;

  TextStyle get light11primary =>
      lightPx11.primary;

  TextStyle get light11primaryLight =>
      lightPx11.primaryLight;

  TextStyle get light11primaryDark =>
      lightPx11.primaryDark;

  TextStyle get light11textMain =>
      lightPx11.textMain;

  TextStyle get light11textSecondary =>
      lightPx11.textSecondary;

  TextStyle get light11textSub =>
      lightPx11.textSub;

  TextStyle get light11textPlaceholder =>
      lightPx11.textPlaceholder;

  TextStyle get light11textNavigation =>
      lightPx11.textNavigation;

  TextStyle get light11textDark =>
      lightPx11.textDark;

  TextStyle get light11danger =>
      lightPx11.danger;

  TextStyle get light11rating =>
      lightPx11.rating;

  TextStyle get light11white =>
      lightPx11.white;

  TextStyle get light11black =>
      lightPx11.black;

  TextStyle get light12primary =>
      lightPx12.primary;

  TextStyle get light12primaryLight =>
      lightPx12.primaryLight;

  TextStyle get light12primaryDark =>
      lightPx12.primaryDark;

  TextStyle get light12textMain =>
      lightPx12.textMain;

  TextStyle get light12textSecondary =>
      lightPx12.textSecondary;

  TextStyle get light12textSub =>
      lightPx12.textSub;

  TextStyle get light12textPlaceholder =>
      lightPx12.textPlaceholder;

  TextStyle get light12textNavigation =>
      lightPx12.textNavigation;

  TextStyle get light12textDark =>
      lightPx12.textDark;

  TextStyle get light12danger =>
      lightPx12.danger;

  TextStyle get light12rating =>
      lightPx12.rating;

  TextStyle get light12white =>
      lightPx12.white;

  TextStyle get light12black =>
      lightPx12.black;

  TextStyle get light14primary =>
      lightPx14.primary;

  TextStyle get light14primaryLight =>
      lightPx14.primaryLight;

  TextStyle get light14primaryDark =>
      lightPx14.primaryDark;

  TextStyle get light14textMain =>
      lightPx14.textMain;

  TextStyle get light14textSecondary =>
      lightPx14.textSecondary;

  TextStyle get light14textSub =>
      lightPx14.textSub;

  TextStyle get light14textPlaceholder =>
      lightPx14.textPlaceholder;

  TextStyle get light14textNavigation =>
      lightPx14.textNavigation;

  TextStyle get light14textDark =>
      lightPx14.textDark;

  TextStyle get light14danger =>
      lightPx14.danger;

  TextStyle get light14rating =>
      lightPx14.rating;

  TextStyle get light14white =>
      lightPx14.white;

  TextStyle get light14black =>
      lightPx14.black;

  TextStyle get light16primary =>
      lightPx16.primary;

  TextStyle get light16primaryLight =>
      lightPx16.primaryLight;

  TextStyle get light16primaryDark =>
      lightPx16.primaryDark;

  TextStyle get light16textMain =>
      lightPx16.textMain;

  TextStyle get light16textSecondary =>
      lightPx16.textSecondary;

  TextStyle get light16textSub =>
      lightPx16.textSub;

  TextStyle get light16textPlaceholder =>
      lightPx16.textPlaceholder;

  TextStyle get light16textNavigation =>
      lightPx16.textNavigation;

  TextStyle get light16textDark =>
      lightPx16.textDark;

  TextStyle get light16danger =>
      lightPx16.danger;

  TextStyle get light16rating =>
      lightPx16.rating;

  TextStyle get light16white =>
      lightPx16.white;

  TextStyle get light16black =>
      lightPx16.black;

  TextStyle get light18primary =>
      lightPx18.primary;

  TextStyle get light18primaryLight =>
      lightPx18.primaryLight;

  TextStyle get light18primaryDark =>
      lightPx18.primaryDark;

  TextStyle get light18textMain =>
      lightPx18.textMain;

  TextStyle get light18textSecondary =>
      lightPx18.textSecondary;

  TextStyle get light18textSub =>
      lightPx18.textSub;

  TextStyle get light18textPlaceholder =>
      lightPx18.textPlaceholder;

  TextStyle get light18textNavigation =>
      lightPx18.textNavigation;

  TextStyle get light18textDark =>
      lightPx18.textDark;

  TextStyle get light18danger =>
      lightPx18.danger;

  TextStyle get light18rating =>
      lightPx18.rating;

  TextStyle get light18white =>
      lightPx18.white;

  TextStyle get light18black =>
      lightPx18.black;

  TextStyle get light20primary =>
      lightPx20.primary;

  TextStyle get light20primaryLight =>
      lightPx20.primaryLight;

  TextStyle get light20primaryDark =>
      lightPx20.primaryDark;

  TextStyle get light20textMain =>
      lightPx20.textMain;

  TextStyle get light20textSecondary =>
      lightPx20.textSecondary;

  TextStyle get light20textSub =>
      lightPx20.textSub;

  TextStyle get light20textPlaceholder =>
      lightPx20.textPlaceholder;

  TextStyle get light20textNavigation =>
      lightPx20.textNavigation;

  TextStyle get light20textDark =>
      lightPx20.textDark;

  TextStyle get light20danger =>
      lightPx20.danger;

  TextStyle get light20rating =>
      lightPx20.rating;

  TextStyle get light20white =>
      lightPx20.white;

  TextStyle get light20black =>
      lightPx20.black;

  TextStyle get light22primary =>
      lightPx22.primary;

  TextStyle get light22primaryLight =>
      lightPx22.primaryLight;

  TextStyle get light22primaryDark =>
      lightPx22.primaryDark;

  TextStyle get light22textMain =>
      lightPx22.textMain;

  TextStyle get light22textSecondary =>
      lightPx22.textSecondary;

  TextStyle get light22textSub =>
      lightPx22.textSub;

  TextStyle get light22textPlaceholder =>
      lightPx22.textPlaceholder;

  TextStyle get light22textNavigation =>
      lightPx22.textNavigation;

  TextStyle get light22textDark =>
      lightPx22.textDark;

  TextStyle get light22danger =>
      lightPx22.danger;

  TextStyle get light22rating =>
      lightPx22.rating;

  TextStyle get light22white =>
      lightPx22.white;

  TextStyle get light22black =>
      lightPx22.black;

  TextStyle get light24primary =>
      lightPx24.primary;

  TextStyle get light24primaryLight =>
      lightPx24.primaryLight;

  TextStyle get light24primaryDark =>
      lightPx24.primaryDark;

  TextStyle get light24textMain =>
      lightPx24.textMain;

  TextStyle get light24textSecondary =>
      lightPx24.textSecondary;

  TextStyle get light24textSub =>
      lightPx24.textSub;

  TextStyle get light24textPlaceholder =>
      lightPx24.textPlaceholder;

  TextStyle get light24textNavigation =>
      lightPx24.textNavigation;

  TextStyle get light24textDark =>
      lightPx24.textDark;

  TextStyle get light24danger =>
      lightPx24.danger;

  TextStyle get light24rating =>
      lightPx24.rating;

  TextStyle get light24white =>
      lightPx24.white;

  TextStyle get light24black =>
      lightPx24.black;

  TextStyle get light26primary =>
      lightPx26.primary;

  TextStyle get light26primaryLight =>
      lightPx26.primaryLight;

  TextStyle get light26primaryDark =>
      lightPx26.primaryDark;

  TextStyle get light26textMain =>
      lightPx26.textMain;

  TextStyle get light26textSecondary =>
      lightPx26.textSecondary;

  TextStyle get light26textSub =>
      lightPx26.textSub;

  TextStyle get light26textPlaceholder =>
      lightPx26.textPlaceholder;

  TextStyle get light26textNavigation =>
      lightPx26.textNavigation;

  TextStyle get light26textDark =>
      lightPx26.textDark;

  TextStyle get light26danger =>
      lightPx26.danger;

  TextStyle get light26rating =>
      lightPx26.rating;

  TextStyle get light26white =>
      lightPx26.white;

  TextStyle get light26black =>
      lightPx26.black;

  TextStyle get light28primary =>
      lightPx28.primary;

  TextStyle get light28primaryLight =>
      lightPx28.primaryLight;

  TextStyle get light28primaryDark =>
      lightPx28.primaryDark;

  TextStyle get light28textMain =>
      lightPx28.textMain;

  TextStyle get light28textSecondary =>
      lightPx28.textSecondary;

  TextStyle get light28textSub =>
      lightPx28.textSub;

  TextStyle get light28textPlaceholder =>
      lightPx28.textPlaceholder;

  TextStyle get light28textNavigation =>
      lightPx28.textNavigation;

  TextStyle get light28textDark =>
      lightPx28.textDark;

  TextStyle get light28danger =>
      lightPx28.danger;

  TextStyle get light28rating =>
      lightPx28.rating;

  TextStyle get light28white =>
      lightPx28.white;

  TextStyle get light28black =>
      lightPx28.black;

  TextStyle get light30primary =>
      lightPx30.primary;

  TextStyle get light30primaryLight =>
      lightPx30.primaryLight;

  TextStyle get light30primaryDark =>
      lightPx30.primaryDark;

  TextStyle get light30textMain =>
      lightPx30.textMain;

  TextStyle get light30textSecondary =>
      lightPx30.textSecondary;

  TextStyle get light30textSub =>
      lightPx30.textSub;

  TextStyle get light30textPlaceholder =>
      lightPx30.textPlaceholder;

  TextStyle get light30textNavigation =>
      lightPx30.textNavigation;

  TextStyle get light30textDark =>
      lightPx30.textDark;

  TextStyle get light30danger =>
      lightPx30.danger;

  TextStyle get light30rating =>
      lightPx30.rating;

  TextStyle get light30white =>
      lightPx30.white;

  TextStyle get light30black =>
      lightPx30.black;

  TextStyle get light32primary =>
      lightPx32.primary;

  TextStyle get light32primaryLight =>
      lightPx32.primaryLight;

  TextStyle get light32primaryDark =>
      lightPx32.primaryDark;

  TextStyle get light32textMain =>
      lightPx32.textMain;

  TextStyle get light32textSecondary =>
      lightPx32.textSecondary;

  TextStyle get light32textSub =>
      lightPx32.textSub;

  TextStyle get light32textPlaceholder =>
      lightPx32.textPlaceholder;

  TextStyle get light32textNavigation =>
      lightPx32.textNavigation;

  TextStyle get light32textDark =>
      lightPx32.textDark;

  TextStyle get light32danger =>
      lightPx32.danger;

  TextStyle get light32rating =>
      lightPx32.rating;

  TextStyle get light32white =>
      lightPx32.white;

  TextStyle get light32black =>
      lightPx32.black;

  TextStyle get light36primary =>
      lightPx36.primary;

  TextStyle get light36primaryLight =>
      lightPx36.primaryLight;

  TextStyle get light36primaryDark =>
      lightPx36.primaryDark;

  TextStyle get light36textMain =>
      lightPx36.textMain;

  TextStyle get light36textSecondary =>
      lightPx36.textSecondary;

  TextStyle get light36textSub =>
      lightPx36.textSub;

  TextStyle get light36textPlaceholder =>
      lightPx36.textPlaceholder;

  TextStyle get light36textNavigation =>
      lightPx36.textNavigation;

  TextStyle get light36textDark =>
      lightPx36.textDark;

  TextStyle get light36danger =>
      lightPx36.danger;

  TextStyle get light36rating =>
      lightPx36.rating;

  TextStyle get light36white =>
      lightPx36.white;

  TextStyle get light36black =>
      lightPx36.black;

  TextStyle get light40primary =>
      lightPx40.primary;

  TextStyle get light40primaryLight =>
      lightPx40.primaryLight;

  TextStyle get light40primaryDark =>
      lightPx40.primaryDark;

  TextStyle get light40textMain =>
      lightPx40.textMain;

  TextStyle get light40textSecondary =>
      lightPx40.textSecondary;

  TextStyle get light40textSub =>
      lightPx40.textSub;

  TextStyle get light40textPlaceholder =>
      lightPx40.textPlaceholder;

  TextStyle get light40textNavigation =>
      lightPx40.textNavigation;

  TextStyle get light40textDark =>
      lightPx40.textDark;

  TextStyle get light40danger =>
      lightPx40.danger;

  TextStyle get light40rating =>
      lightPx40.rating;

  TextStyle get light40white =>
      lightPx40.white;

  TextStyle get light40black =>
      lightPx40.black;

  TextStyle get regular8primary =>
      regularPx8.primary;

  TextStyle get regular8primaryLight =>
      regularPx8.primaryLight;

  TextStyle get regular8primaryDark =>
      regularPx8.primaryDark;

  TextStyle get regular8textMain =>
      regularPx8.textMain;

  TextStyle get regular8textSecondary =>
      regularPx8.textSecondary;

  TextStyle get regular8textSub =>
      regularPx8.textSub;

  TextStyle get regular8textPlaceholder =>
      regularPx8.textPlaceholder;

  TextStyle get regular8textNavigation =>
      regularPx8.textNavigation;

  TextStyle get regular8textDark =>
      regularPx8.textDark;

  TextStyle get regular8danger =>
      regularPx8.danger;

  TextStyle get regular8rating =>
      regularPx8.rating;

  TextStyle get regular8white =>
      regularPx8.white;

  TextStyle get regular8black =>
      regularPx8.black;

  TextStyle get regular11primary =>
      regularPx11.primary;

  TextStyle get regular11primaryLight =>
      regularPx11.primaryLight;

  TextStyle get regular11primaryDark =>
      regularPx11.primaryDark;

  TextStyle get regular11textMain =>
      regularPx11.textMain;

  TextStyle get regular11textSecondary =>
      regularPx11.textSecondary;

  TextStyle get regular11textSub =>
      regularPx11.textSub;

  TextStyle get regular11textPlaceholder =>
      regularPx11.textPlaceholder;

  TextStyle get regular11textNavigation =>
      regularPx11.textNavigation;

  TextStyle get regular11textDark =>
      regularPx11.textDark;

  TextStyle get regular11danger =>
      regularPx11.danger;

  TextStyle get regular11rating =>
      regularPx11.rating;

  TextStyle get regular11white =>
      regularPx11.white;

  TextStyle get regular11black =>
      regularPx11.black;

  TextStyle get regular12primary =>
      regularPx12.primary;

  TextStyle get regular12primaryLight =>
      regularPx12.primaryLight;

  TextStyle get regular12primaryDark =>
      regularPx12.primaryDark;

  TextStyle get regular12textMain =>
      regularPx12.textMain;

  TextStyle get regular12textSecondary =>
      regularPx12.textSecondary;

  TextStyle get regular12textSub =>
      regularPx12.textSub;

  TextStyle get regular12textPlaceholder =>
      regularPx12.textPlaceholder;

  TextStyle get regular12textNavigation =>
      regularPx12.textNavigation;

  TextStyle get regular12textDark =>
      regularPx12.textDark;

  TextStyle get regular12danger =>
      regularPx12.danger;

  TextStyle get regular12rating =>
      regularPx12.rating;

  TextStyle get regular12white =>
      regularPx12.white;

  TextStyle get regular12black =>
      regularPx12.black;

  TextStyle get regular14primary =>
      regularPx14.primary;

  TextStyle get regular14primaryLight =>
      regularPx14.primaryLight;

  TextStyle get regular14primaryDark =>
      regularPx14.primaryDark;

  TextStyle get regular14textMain =>
      regularPx14.textMain;

  TextStyle get regular14textSecondary =>
      regularPx14.textSecondary;

  TextStyle get regular14textSub =>
      regularPx14.textSub;

  TextStyle get regular14textPlaceholder =>
      regularPx14.textPlaceholder;

  TextStyle get regular14textNavigation =>
      regularPx14.textNavigation;

  TextStyle get regular14textDark =>
      regularPx14.textDark;

  TextStyle get regular14danger =>
      regularPx14.danger;

  TextStyle get regular14rating =>
      regularPx14.rating;

  TextStyle get regular14white =>
      regularPx14.white;

  TextStyle get regular14black =>
      regularPx14.black;

  TextStyle get regular16primary =>
      regularPx16.primary;

  TextStyle get regular16primaryLight =>
      regularPx16.primaryLight;

  TextStyle get regular16primaryDark =>
      regularPx16.primaryDark;

  TextStyle get regular16textMain =>
      regularPx16.textMain;

  TextStyle get regular16textSecondary =>
      regularPx16.textSecondary;

  TextStyle get regular16textSub =>
      regularPx16.textSub;

  TextStyle get regular16textPlaceholder =>
      regularPx16.textPlaceholder;

  TextStyle get regular16textNavigation =>
      regularPx16.textNavigation;

  TextStyle get regular16textDark =>
      regularPx16.textDark;

  TextStyle get regular16danger =>
      regularPx16.danger;

  TextStyle get regular16rating =>
      regularPx16.rating;

  TextStyle get regular16white =>
      regularPx16.white;

  TextStyle get regular16black =>
      regularPx16.black;

  TextStyle get regular18primary =>
      regularPx18.primary;

  TextStyle get regular18primaryLight =>
      regularPx18.primaryLight;

  TextStyle get regular18primaryDark =>
      regularPx18.primaryDark;

  TextStyle get regular18textMain =>
      regularPx18.textMain;

  TextStyle get regular18textSecondary =>
      regularPx18.textSecondary;

  TextStyle get regular18textSub =>
      regularPx18.textSub;

  TextStyle get regular18textPlaceholder =>
      regularPx18.textPlaceholder;

  TextStyle get regular18textNavigation =>
      regularPx18.textNavigation;

  TextStyle get regular18textDark =>
      regularPx18.textDark;

  TextStyle get regular18danger =>
      regularPx18.danger;

  TextStyle get regular18rating =>
      regularPx18.rating;

  TextStyle get regular18white =>
      regularPx18.white;

  TextStyle get regular18black =>
      regularPx18.black;

  TextStyle get regular20primary =>
      regularPx20.primary;

  TextStyle get regular20primaryLight =>
      regularPx20.primaryLight;

  TextStyle get regular20primaryDark =>
      regularPx20.primaryDark;

  TextStyle get regular20textMain =>
      regularPx20.textMain;

  TextStyle get regular20textSecondary =>
      regularPx20.textSecondary;

  TextStyle get regular20textSub =>
      regularPx20.textSub;

  TextStyle get regular20textPlaceholder =>
      regularPx20.textPlaceholder;

  TextStyle get regular20textNavigation =>
      regularPx20.textNavigation;

  TextStyle get regular20textDark =>
      regularPx20.textDark;

  TextStyle get regular20danger =>
      regularPx20.danger;

  TextStyle get regular20rating =>
      regularPx20.rating;

  TextStyle get regular20white =>
      regularPx20.white;

  TextStyle get regular20black =>
      regularPx20.black;

  TextStyle get regular22primary =>
      regularPx22.primary;

  TextStyle get regular22primaryLight =>
      regularPx22.primaryLight;

  TextStyle get regular22primaryDark =>
      regularPx22.primaryDark;

  TextStyle get regular22textMain =>
      regularPx22.textMain;

  TextStyle get regular22textSecondary =>
      regularPx22.textSecondary;

  TextStyle get regular22textSub =>
      regularPx22.textSub;

  TextStyle get regular22textPlaceholder =>
      regularPx22.textPlaceholder;

  TextStyle get regular22textNavigation =>
      regularPx22.textNavigation;

  TextStyle get regular22textDark =>
      regularPx22.textDark;

  TextStyle get regular22danger =>
      regularPx22.danger;

  TextStyle get regular22rating =>
      regularPx22.rating;

  TextStyle get regular22white =>
      regularPx22.white;

  TextStyle get regular22black =>
      regularPx22.black;

  TextStyle get regular24primary =>
      regularPx24.primary;

  TextStyle get regular24primaryLight =>
      regularPx24.primaryLight;

  TextStyle get regular24primaryDark =>
      regularPx24.primaryDark;

  TextStyle get regular24textMain =>
      regularPx24.textMain;

  TextStyle get regular24textSecondary =>
      regularPx24.textSecondary;

  TextStyle get regular24textSub =>
      regularPx24.textSub;

  TextStyle get regular24textPlaceholder =>
      regularPx24.textPlaceholder;

  TextStyle get regular24textNavigation =>
      regularPx24.textNavigation;

  TextStyle get regular24textDark =>
      regularPx24.textDark;

  TextStyle get regular24danger =>
      regularPx24.danger;

  TextStyle get regular24rating =>
      regularPx24.rating;

  TextStyle get regular24white =>
      regularPx24.white;

  TextStyle get regular24black =>
      regularPx24.black;

  TextStyle get regular26primary =>
      regularPx26.primary;

  TextStyle get regular26primaryLight =>
      regularPx26.primaryLight;

  TextStyle get regular26primaryDark =>
      regularPx26.primaryDark;

  TextStyle get regular26textMain =>
      regularPx26.textMain;

  TextStyle get regular26textSecondary =>
      regularPx26.textSecondary;

  TextStyle get regular26textSub =>
      regularPx26.textSub;

  TextStyle get regular26textPlaceholder =>
      regularPx26.textPlaceholder;

  TextStyle get regular26textNavigation =>
      regularPx26.textNavigation;

  TextStyle get regular26textDark =>
      regularPx26.textDark;

  TextStyle get regular26danger =>
      regularPx26.danger;

  TextStyle get regular26rating =>
      regularPx26.rating;

  TextStyle get regular26white =>
      regularPx26.white;

  TextStyle get regular26black =>
      regularPx26.black;

  TextStyle get regular28primary =>
      regularPx28.primary;

  TextStyle get regular28primaryLight =>
      regularPx28.primaryLight;

  TextStyle get regular28primaryDark =>
      regularPx28.primaryDark;

  TextStyle get regular28textMain =>
      regularPx28.textMain;

  TextStyle get regular28textSecondary =>
      regularPx28.textSecondary;

  TextStyle get regular28textSub =>
      regularPx28.textSub;

  TextStyle get regular28textPlaceholder =>
      regularPx28.textPlaceholder;

  TextStyle get regular28textNavigation =>
      regularPx28.textNavigation;

  TextStyle get regular28textDark =>
      regularPx28.textDark;

  TextStyle get regular28danger =>
      regularPx28.danger;

  TextStyle get regular28rating =>
      regularPx28.rating;

  TextStyle get regular28white =>
      regularPx28.white;

  TextStyle get regular28black =>
      regularPx28.black;

  TextStyle get regular30primary =>
      regularPx30.primary;

  TextStyle get regular30primaryLight =>
      regularPx30.primaryLight;

  TextStyle get regular30primaryDark =>
      regularPx30.primaryDark;

  TextStyle get regular30textMain =>
      regularPx30.textMain;

  TextStyle get regular30textSecondary =>
      regularPx30.textSecondary;

  TextStyle get regular30textSub =>
      regularPx30.textSub;

  TextStyle get regular30textPlaceholder =>
      regularPx30.textPlaceholder;

  TextStyle get regular30textNavigation =>
      regularPx30.textNavigation;

  TextStyle get regular30textDark =>
      regularPx30.textDark;

  TextStyle get regular30danger =>
      regularPx30.danger;

  TextStyle get regular30rating =>
      regularPx30.rating;

  TextStyle get regular30white =>
      regularPx30.white;

  TextStyle get regular30black =>
      regularPx30.black;

  TextStyle get regular32primary =>
      regularPx32.primary;

  TextStyle get regular32primaryLight =>
      regularPx32.primaryLight;

  TextStyle get regular32primaryDark =>
      regularPx32.primaryDark;

  TextStyle get regular32textMain =>
      regularPx32.textMain;

  TextStyle get regular32textSecondary =>
      regularPx32.textSecondary;

  TextStyle get regular32textSub =>
      regularPx32.textSub;

  TextStyle get regular32textPlaceholder =>
      regularPx32.textPlaceholder;

  TextStyle get regular32textNavigation =>
      regularPx32.textNavigation;

  TextStyle get regular32textDark =>
      regularPx32.textDark;

  TextStyle get regular32danger =>
      regularPx32.danger;

  TextStyle get regular32rating =>
      regularPx32.rating;

  TextStyle get regular32white =>
      regularPx32.white;

  TextStyle get regular32black =>
      regularPx32.black;

  TextStyle get regular36primary =>
      regularPx36.primary;

  TextStyle get regular36primaryLight =>
      regularPx36.primaryLight;

  TextStyle get regular36primaryDark =>
      regularPx36.primaryDark;

  TextStyle get regular36textMain =>
      regularPx36.textMain;

  TextStyle get regular36textSecondary =>
      regularPx36.textSecondary;

  TextStyle get regular36textSub =>
      regularPx36.textSub;

  TextStyle get regular36textPlaceholder =>
      regularPx36.textPlaceholder;

  TextStyle get regular36textNavigation =>
      regularPx36.textNavigation;

  TextStyle get regular36textDark =>
      regularPx36.textDark;

  TextStyle get regular36danger =>
      regularPx36.danger;

  TextStyle get regular36rating =>
      regularPx36.rating;

  TextStyle get regular36white =>
      regularPx36.white;

  TextStyle get regular36black =>
      regularPx36.black;

  TextStyle get regular40primary =>
      regularPx40.primary;

  TextStyle get regular40primaryLight =>
      regularPx40.primaryLight;

  TextStyle get regular40primaryDark =>
      regularPx40.primaryDark;

  TextStyle get regular40textMain =>
      regularPx40.textMain;

  TextStyle get regular40textSecondary =>
      regularPx40.textSecondary;

  TextStyle get regular40textSub =>
      regularPx40.textSub;

  TextStyle get regular40textPlaceholder =>
      regularPx40.textPlaceholder;

  TextStyle get regular40textNavigation =>
      regularPx40.textNavigation;

  TextStyle get regular40textDark =>
      regularPx40.textDark;

  TextStyle get regular40danger =>
      regularPx40.danger;

  TextStyle get regular40rating =>
      regularPx40.rating;

  TextStyle get regular40white =>
      regularPx40.white;

  TextStyle get regular40black =>
      regularPx40.black;

  TextStyle get medium8primary =>
      mediumPx8.primary;

  TextStyle get medium8primaryLight =>
      mediumPx8.primaryLight;

  TextStyle get medium8primaryDark =>
      mediumPx8.primaryDark;

  TextStyle get medium8textMain =>
      mediumPx8.textMain;

  TextStyle get medium8textSecondary =>
      mediumPx8.textSecondary;

  TextStyle get medium8textSub =>
      mediumPx8.textSub;

  TextStyle get medium8textPlaceholder =>
      mediumPx8.textPlaceholder;

  TextStyle get medium8textNavigation =>
      mediumPx8.textNavigation;

  TextStyle get medium8textDark =>
      mediumPx8.textDark;

  TextStyle get medium8danger =>
      mediumPx8.danger;

  TextStyle get medium8rating =>
      mediumPx8.rating;

  TextStyle get medium8white =>
      mediumPx8.white;

  TextStyle get medium8black =>
      mediumPx8.black;

  TextStyle get medium11primary =>
      mediumPx11.primary;

  TextStyle get medium11primaryLight =>
      mediumPx11.primaryLight;

  TextStyle get medium11primaryDark =>
      mediumPx11.primaryDark;

  TextStyle get medium11textMain =>
      mediumPx11.textMain;

  TextStyle get medium11textSecondary =>
      mediumPx11.textSecondary;

  TextStyle get medium11textSub =>
      mediumPx11.textSub;

  TextStyle get medium11textPlaceholder =>
      mediumPx11.textPlaceholder;

  TextStyle get medium11textNavigation =>
      mediumPx11.textNavigation;

  TextStyle get medium11textDark =>
      mediumPx11.textDark;

  TextStyle get medium11danger =>
      mediumPx11.danger;

  TextStyle get medium11rating =>
      mediumPx11.rating;

  TextStyle get medium11white =>
      mediumPx11.white;

  TextStyle get medium11black =>
      mediumPx11.black;

  TextStyle get medium12primary =>
      mediumPx12.primary;

  TextStyle get medium12primaryLight =>
      mediumPx12.primaryLight;

  TextStyle get medium12primaryDark =>
      mediumPx12.primaryDark;

  TextStyle get medium12textMain =>
      mediumPx12.textMain;

  TextStyle get medium12textSecondary =>
      mediumPx12.textSecondary;

  TextStyle get medium12textSub =>
      mediumPx12.textSub;

  TextStyle get medium12textPlaceholder =>
      mediumPx12.textPlaceholder;

  TextStyle get medium12textNavigation =>
      mediumPx12.textNavigation;

  TextStyle get medium12textDark =>
      mediumPx12.textDark;

  TextStyle get medium12danger =>
      mediumPx12.danger;

  TextStyle get medium12rating =>
      mediumPx12.rating;

  TextStyle get medium12white =>
      mediumPx12.white;

  TextStyle get medium12black =>
      mediumPx12.black;

  TextStyle get medium14primary =>
      mediumPx14.primary;

  TextStyle get medium14primaryLight =>
      mediumPx14.primaryLight;

  TextStyle get medium14primaryDark =>
      mediumPx14.primaryDark;

  TextStyle get medium14textMain =>
      mediumPx14.textMain;

  TextStyle get medium14textSecondary =>
      mediumPx14.textSecondary;

  TextStyle get medium14textSub =>
      mediumPx14.textSub;

  TextStyle get medium14textPlaceholder =>
      mediumPx14.textPlaceholder;

  TextStyle get medium14textNavigation =>
      mediumPx14.textNavigation;

  TextStyle get medium14textDark =>
      mediumPx14.textDark;

  TextStyle get medium14danger =>
      mediumPx14.danger;

  TextStyle get medium14rating =>
      mediumPx14.rating;

  TextStyle get medium14white =>
      mediumPx14.white;

  TextStyle get medium14black =>
      mediumPx14.black;

  TextStyle get medium16primary =>
      mediumPx16.primary;

  TextStyle get medium16primaryLight =>
      mediumPx16.primaryLight;

  TextStyle get medium16primaryDark =>
      mediumPx16.primaryDark;

  TextStyle get medium16textMain =>
      mediumPx16.textMain;

  TextStyle get medium16textSecondary =>
      mediumPx16.textSecondary;

  TextStyle get medium16textSub =>
      mediumPx16.textSub;

  TextStyle get medium16textPlaceholder =>
      mediumPx16.textPlaceholder;

  TextStyle get medium16textNavigation =>
      mediumPx16.textNavigation;

  TextStyle get medium16textDark =>
      mediumPx16.textDark;

  TextStyle get medium16danger =>
      mediumPx16.danger;

  TextStyle get medium16rating =>
      mediumPx16.rating;

  TextStyle get medium16white =>
      mediumPx16.white;

  TextStyle get medium16black =>
      mediumPx16.black;

  TextStyle get medium18primary =>
      mediumPx18.primary;

  TextStyle get medium18primaryLight =>
      mediumPx18.primaryLight;

  TextStyle get medium18primaryDark =>
      mediumPx18.primaryDark;

  TextStyle get medium18textMain =>
      mediumPx18.textMain;

  TextStyle get medium18textSecondary =>
      mediumPx18.textSecondary;

  TextStyle get medium18textSub =>
      mediumPx18.textSub;

  TextStyle get medium18textPlaceholder =>
      mediumPx18.textPlaceholder;

  TextStyle get medium18textNavigation =>
      mediumPx18.textNavigation;

  TextStyle get medium18textDark =>
      mediumPx18.textDark;

  TextStyle get medium18danger =>
      mediumPx18.danger;

  TextStyle get medium18rating =>
      mediumPx18.rating;

  TextStyle get medium18white =>
      mediumPx18.white;

  TextStyle get medium18black =>
      mediumPx18.black;

  TextStyle get medium20primary =>
      mediumPx20.primary;

  TextStyle get medium20primaryLight =>
      mediumPx20.primaryLight;

  TextStyle get medium20primaryDark =>
      mediumPx20.primaryDark;

  TextStyle get medium20textMain =>
      mediumPx20.textMain;

  TextStyle get medium20textSecondary =>
      mediumPx20.textSecondary;

  TextStyle get medium20textSub =>
      mediumPx20.textSub;

  TextStyle get medium20textPlaceholder =>
      mediumPx20.textPlaceholder;

  TextStyle get medium20textNavigation =>
      mediumPx20.textNavigation;

  TextStyle get medium20textDark =>
      mediumPx20.textDark;

  TextStyle get medium20danger =>
      mediumPx20.danger;

  TextStyle get medium20rating =>
      mediumPx20.rating;

  TextStyle get medium20white =>
      mediumPx20.white;

  TextStyle get medium20black =>
      mediumPx20.black;

  TextStyle get medium22primary =>
      mediumPx22.primary;

  TextStyle get medium22primaryLight =>
      mediumPx22.primaryLight;

  TextStyle get medium22primaryDark =>
      mediumPx22.primaryDark;

  TextStyle get medium22textMain =>
      mediumPx22.textMain;

  TextStyle get medium22textSecondary =>
      mediumPx22.textSecondary;

  TextStyle get medium22textSub =>
      mediumPx22.textSub;

  TextStyle get medium22textPlaceholder =>
      mediumPx22.textPlaceholder;

  TextStyle get medium22textNavigation =>
      mediumPx22.textNavigation;

  TextStyle get medium22textDark =>
      mediumPx22.textDark;

  TextStyle get medium22danger =>
      mediumPx22.danger;

  TextStyle get medium22rating =>
      mediumPx22.rating;

  TextStyle get medium22white =>
      mediumPx22.white;

  TextStyle get medium22black =>
      mediumPx22.black;

  TextStyle get medium24primary =>
      mediumPx24.primary;

  TextStyle get medium24primaryLight =>
      mediumPx24.primaryLight;

  TextStyle get medium24primaryDark =>
      mediumPx24.primaryDark;

  TextStyle get medium24textMain =>
      mediumPx24.textMain;

  TextStyle get medium24textSecondary =>
      mediumPx24.textSecondary;

  TextStyle get medium24textSub =>
      mediumPx24.textSub;

  TextStyle get medium24textPlaceholder =>
      mediumPx24.textPlaceholder;

  TextStyle get medium24textNavigation =>
      mediumPx24.textNavigation;

  TextStyle get medium24textDark =>
      mediumPx24.textDark;

  TextStyle get medium24danger =>
      mediumPx24.danger;

  TextStyle get medium24rating =>
      mediumPx24.rating;

  TextStyle get medium24white =>
      mediumPx24.white;

  TextStyle get medium24black =>
      mediumPx24.black;

  TextStyle get medium26primary =>
      mediumPx26.primary;

  TextStyle get medium26primaryLight =>
      mediumPx26.primaryLight;

  TextStyle get medium26primaryDark =>
      mediumPx26.primaryDark;

  TextStyle get medium26textMain =>
      mediumPx26.textMain;

  TextStyle get medium26textSecondary =>
      mediumPx26.textSecondary;

  TextStyle get medium26textSub =>
      mediumPx26.textSub;

  TextStyle get medium26textPlaceholder =>
      mediumPx26.textPlaceholder;

  TextStyle get medium26textNavigation =>
      mediumPx26.textNavigation;

  TextStyle get medium26textDark =>
      mediumPx26.textDark;

  TextStyle get medium26danger =>
      mediumPx26.danger;

  TextStyle get medium26rating =>
      mediumPx26.rating;

  TextStyle get medium26white =>
      mediumPx26.white;

  TextStyle get medium26black =>
      mediumPx26.black;

  TextStyle get medium28primary =>
      mediumPx28.primary;

  TextStyle get medium28primaryLight =>
      mediumPx28.primaryLight;

  TextStyle get medium28primaryDark =>
      mediumPx28.primaryDark;

  TextStyle get medium28textMain =>
      mediumPx28.textMain;

  TextStyle get medium28textSecondary =>
      mediumPx28.textSecondary;

  TextStyle get medium28textSub =>
      mediumPx28.textSub;

  TextStyle get medium28textPlaceholder =>
      mediumPx28.textPlaceholder;

  TextStyle get medium28textNavigation =>
      mediumPx28.textNavigation;

  TextStyle get medium28textDark =>
      mediumPx28.textDark;

  TextStyle get medium28danger =>
      mediumPx28.danger;

  TextStyle get medium28rating =>
      mediumPx28.rating;

  TextStyle get medium28white =>
      mediumPx28.white;

  TextStyle get medium28black =>
      mediumPx28.black;

  TextStyle get medium30primary =>
      mediumPx30.primary;

  TextStyle get medium30primaryLight =>
      mediumPx30.primaryLight;

  TextStyle get medium30primaryDark =>
      mediumPx30.primaryDark;

  TextStyle get medium30textMain =>
      mediumPx30.textMain;

  TextStyle get medium30textSecondary =>
      mediumPx30.textSecondary;

  TextStyle get medium30textSub =>
      mediumPx30.textSub;

  TextStyle get medium30textPlaceholder =>
      mediumPx30.textPlaceholder;

  TextStyle get medium30textNavigation =>
      mediumPx30.textNavigation;

  TextStyle get medium30textDark =>
      mediumPx30.textDark;

  TextStyle get medium30danger =>
      mediumPx30.danger;

  TextStyle get medium30rating =>
      mediumPx30.rating;

  TextStyle get medium30white =>
      mediumPx30.white;

  TextStyle get medium30black =>
      mediumPx30.black;

  TextStyle get medium32primary =>
      mediumPx32.primary;

  TextStyle get medium32primaryLight =>
      mediumPx32.primaryLight;

  TextStyle get medium32primaryDark =>
      mediumPx32.primaryDark;

  TextStyle get medium32textMain =>
      mediumPx32.textMain;

  TextStyle get medium32textSecondary =>
      mediumPx32.textSecondary;

  TextStyle get medium32textSub =>
      mediumPx32.textSub;

  TextStyle get medium32textPlaceholder =>
      mediumPx32.textPlaceholder;

  TextStyle get medium32textNavigation =>
      mediumPx32.textNavigation;

  TextStyle get medium32textDark =>
      mediumPx32.textDark;

  TextStyle get medium32danger =>
      mediumPx32.danger;

  TextStyle get medium32rating =>
      mediumPx32.rating;

  TextStyle get medium32white =>
      mediumPx32.white;

  TextStyle get medium32black =>
      mediumPx32.black;

  TextStyle get medium36primary =>
      mediumPx36.primary;

  TextStyle get medium36primaryLight =>
      mediumPx36.primaryLight;

  TextStyle get medium36primaryDark =>
      mediumPx36.primaryDark;

  TextStyle get medium36textMain =>
      mediumPx36.textMain;

  TextStyle get medium36textSecondary =>
      mediumPx36.textSecondary;

  TextStyle get medium36textSub =>
      mediumPx36.textSub;

  TextStyle get medium36textPlaceholder =>
      mediumPx36.textPlaceholder;

  TextStyle get medium36textNavigation =>
      mediumPx36.textNavigation;

  TextStyle get medium36textDark =>
      mediumPx36.textDark;

  TextStyle get medium36danger =>
      mediumPx36.danger;

  TextStyle get medium36rating =>
      mediumPx36.rating;

  TextStyle get medium36white =>
      mediumPx36.white;

  TextStyle get medium36black =>
      mediumPx36.black;

  TextStyle get medium40primary =>
      mediumPx40.primary;

  TextStyle get medium40primaryLight =>
      mediumPx40.primaryLight;

  TextStyle get medium40primaryDark =>
      mediumPx40.primaryDark;

  TextStyle get medium40textMain =>
      mediumPx40.textMain;

  TextStyle get medium40textSecondary =>
      mediumPx40.textSecondary;

  TextStyle get medium40textSub =>
      mediumPx40.textSub;

  TextStyle get medium40textPlaceholder =>
      mediumPx40.textPlaceholder;

  TextStyle get medium40textNavigation =>
      mediumPx40.textNavigation;

  TextStyle get medium40textDark =>
      mediumPx40.textDark;

  TextStyle get medium40danger =>
      mediumPx40.danger;

  TextStyle get medium40rating =>
      mediumPx40.rating;

  TextStyle get medium40white =>
      mediumPx40.white;

  TextStyle get medium40black =>
      mediumPx40.black;

  TextStyle get semiBold8primary =>
      semiBoldPx8.primary;

  TextStyle get semiBold8primaryLight =>
      semiBoldPx8.primaryLight;

  TextStyle get semiBold8primaryDark =>
      semiBoldPx8.primaryDark;

  TextStyle get semiBold8textMain =>
      semiBoldPx8.textMain;

  TextStyle get semiBold8textSecondary =>
      semiBoldPx8.textSecondary;

  TextStyle get semiBold8textSub =>
      semiBoldPx8.textSub;

  TextStyle get semiBold8textPlaceholder =>
      semiBoldPx8.textPlaceholder;

  TextStyle get semiBold8textNavigation =>
      semiBoldPx8.textNavigation;

  TextStyle get semiBold8textDark =>
      semiBoldPx8.textDark;

  TextStyle get semiBold8danger =>
      semiBoldPx8.danger;

  TextStyle get semiBold8rating =>
      semiBoldPx8.rating;

  TextStyle get semiBold8white =>
      semiBoldPx8.white;

  TextStyle get semiBold8black =>
      semiBoldPx8.black;

  TextStyle get semiBold11primary =>
      semiBoldPx11.primary;

  TextStyle get semiBold11primaryLight =>
      semiBoldPx11.primaryLight;

  TextStyle get semiBold11primaryDark =>
      semiBoldPx11.primaryDark;

  TextStyle get semiBold11textMain =>
      semiBoldPx11.textMain;

  TextStyle get semiBold11textSecondary =>
      semiBoldPx11.textSecondary;

  TextStyle get semiBold11textSub =>
      semiBoldPx11.textSub;

  TextStyle get semiBold11textPlaceholder =>
      semiBoldPx11.textPlaceholder;

  TextStyle get semiBold11textNavigation =>
      semiBoldPx11.textNavigation;

  TextStyle get semiBold11textDark =>
      semiBoldPx11.textDark;

  TextStyle get semiBold11danger =>
      semiBoldPx11.danger;

  TextStyle get semiBold11rating =>
      semiBoldPx11.rating;

  TextStyle get semiBold11white =>
      semiBoldPx11.white;

  TextStyle get semiBold11black =>
      semiBoldPx11.black;

  TextStyle get semiBold12primary =>
      semiBoldPx12.primary;

  TextStyle get semiBold12primaryLight =>
      semiBoldPx12.primaryLight;

  TextStyle get semiBold12primaryDark =>
      semiBoldPx12.primaryDark;

  TextStyle get semiBold12textMain =>
      semiBoldPx12.textMain;

  TextStyle get semiBold12textSecondary =>
      semiBoldPx12.textSecondary;

  TextStyle get semiBold12textSub =>
      semiBoldPx12.textSub;

  TextStyle get semiBold12textPlaceholder =>
      semiBoldPx12.textPlaceholder;

  TextStyle get semiBold12textNavigation =>
      semiBoldPx12.textNavigation;

  TextStyle get semiBold12textDark =>
      semiBoldPx12.textDark;

  TextStyle get semiBold12danger =>
      semiBoldPx12.danger;

  TextStyle get semiBold12rating =>
      semiBoldPx12.rating;

  TextStyle get semiBold12white =>
      semiBoldPx12.white;

  TextStyle get semiBold12black =>
      semiBoldPx12.black;

  TextStyle get semiBold14primary =>
      semiBoldPx14.primary;

  TextStyle get semiBold14primaryLight =>
      semiBoldPx14.primaryLight;

  TextStyle get semiBold14primaryDark =>
      semiBoldPx14.primaryDark;

  TextStyle get semiBold14textMain =>
      semiBoldPx14.textMain;

  TextStyle get semiBold14textSecondary =>
      semiBoldPx14.textSecondary;

  TextStyle get semiBold14textSub =>
      semiBoldPx14.textSub;

  TextStyle get semiBold14textPlaceholder =>
      semiBoldPx14.textPlaceholder;

  TextStyle get semiBold14textNavigation =>
      semiBoldPx14.textNavigation;

  TextStyle get semiBold14textDark =>
      semiBoldPx14.textDark;

  TextStyle get semiBold14danger =>
      semiBoldPx14.danger;

  TextStyle get semiBold14rating =>
      semiBoldPx14.rating;

  TextStyle get semiBold14white =>
      semiBoldPx14.white;

  TextStyle get semiBold14black =>
      semiBoldPx14.black;

  TextStyle get semiBold16primary =>
      semiBoldPx16.primary;

  TextStyle get semiBold16primaryLight =>
      semiBoldPx16.primaryLight;

  TextStyle get semiBold16primaryDark =>
      semiBoldPx16.primaryDark;

  TextStyle get semiBold16textMain =>
      semiBoldPx16.textMain;

  TextStyle get semiBold16textSecondary =>
      semiBoldPx16.textSecondary;

  TextStyle get semiBold16textSub =>
      semiBoldPx16.textSub;

  TextStyle get semiBold16textPlaceholder =>
      semiBoldPx16.textPlaceholder;

  TextStyle get semiBold16textNavigation =>
      semiBoldPx16.textNavigation;

  TextStyle get semiBold16textDark =>
      semiBoldPx16.textDark;

  TextStyle get semiBold16danger =>
      semiBoldPx16.danger;

  TextStyle get semiBold16rating =>
      semiBoldPx16.rating;

  TextStyle get semiBold16white =>
      semiBoldPx16.white;

  TextStyle get semiBold16black =>
      semiBoldPx16.black;

  TextStyle get semiBold18primary =>
      semiBoldPx18.primary;

  TextStyle get semiBold18primaryLight =>
      semiBoldPx18.primaryLight;

  TextStyle get semiBold18primaryDark =>
      semiBoldPx18.primaryDark;

  TextStyle get semiBold18textMain =>
      semiBoldPx18.textMain;

  TextStyle get semiBold18textSecondary =>
      semiBoldPx18.textSecondary;

  TextStyle get semiBold18textSub =>
      semiBoldPx18.textSub;

  TextStyle get semiBold18textPlaceholder =>
      semiBoldPx18.textPlaceholder;

  TextStyle get semiBold18textNavigation =>
      semiBoldPx18.textNavigation;

  TextStyle get semiBold18textDark =>
      semiBoldPx18.textDark;

  TextStyle get semiBold18danger =>
      semiBoldPx18.danger;

  TextStyle get semiBold18rating =>
      semiBoldPx18.rating;

  TextStyle get semiBold18white =>
      semiBoldPx18.white;

  TextStyle get semiBold18black =>
      semiBoldPx18.black;

  TextStyle get semiBold20primary =>
      semiBoldPx20.primary;

  TextStyle get semiBold20primaryLight =>
      semiBoldPx20.primaryLight;

  TextStyle get semiBold20primaryDark =>
      semiBoldPx20.primaryDark;

  TextStyle get semiBold20textMain =>
      semiBoldPx20.textMain;

  TextStyle get semiBold20textSecondary =>
      semiBoldPx20.textSecondary;

  TextStyle get semiBold20textSub =>
      semiBoldPx20.textSub;

  TextStyle get semiBold20textPlaceholder =>
      semiBoldPx20.textPlaceholder;

  TextStyle get semiBold20textNavigation =>
      semiBoldPx20.textNavigation;

  TextStyle get semiBold20textDark =>
      semiBoldPx20.textDark;

  TextStyle get semiBold20danger =>
      semiBoldPx20.danger;

  TextStyle get semiBold20rating =>
      semiBoldPx20.rating;

  TextStyle get semiBold20white =>
      semiBoldPx20.white;

  TextStyle get semiBold20black =>
      semiBoldPx20.black;

  TextStyle get semiBold22primary =>
      semiBoldPx22.primary;

  TextStyle get semiBold22primaryLight =>
      semiBoldPx22.primaryLight;

  TextStyle get semiBold22primaryDark =>
      semiBoldPx22.primaryDark;

  TextStyle get semiBold22textMain =>
      semiBoldPx22.textMain;

  TextStyle get semiBold22textSecondary =>
      semiBoldPx22.textSecondary;

  TextStyle get semiBold22textSub =>
      semiBoldPx22.textSub;

  TextStyle get semiBold22textPlaceholder =>
      semiBoldPx22.textPlaceholder;

  TextStyle get semiBold22textNavigation =>
      semiBoldPx22.textNavigation;

  TextStyle get semiBold22textDark =>
      semiBoldPx22.textDark;

  TextStyle get semiBold22danger =>
      semiBoldPx22.danger;

  TextStyle get semiBold22rating =>
      semiBoldPx22.rating;

  TextStyle get semiBold22white =>
      semiBoldPx22.white;

  TextStyle get semiBold22black =>
      semiBoldPx22.black;

  TextStyle get semiBold24primary =>
      semiBoldPx24.primary;

  TextStyle get semiBold24primaryLight =>
      semiBoldPx24.primaryLight;

  TextStyle get semiBold24primaryDark =>
      semiBoldPx24.primaryDark;

  TextStyle get semiBold24textMain =>
      semiBoldPx24.textMain;

  TextStyle get semiBold24textSecondary =>
      semiBoldPx24.textSecondary;

  TextStyle get semiBold24textSub =>
      semiBoldPx24.textSub;

  TextStyle get semiBold24textPlaceholder =>
      semiBoldPx24.textPlaceholder;

  TextStyle get semiBold24textNavigation =>
      semiBoldPx24.textNavigation;

  TextStyle get semiBold24textDark =>
      semiBoldPx24.textDark;

  TextStyle get semiBold24danger =>
      semiBoldPx24.danger;

  TextStyle get semiBold24rating =>
      semiBoldPx24.rating;

  TextStyle get semiBold24white =>
      semiBoldPx24.white;

  TextStyle get semiBold24black =>
      semiBoldPx24.black;

  TextStyle get semiBold26primary =>
      semiBoldPx26.primary;

  TextStyle get semiBold26primaryLight =>
      semiBoldPx26.primaryLight;

  TextStyle get semiBold26primaryDark =>
      semiBoldPx26.primaryDark;

  TextStyle get semiBold26textMain =>
      semiBoldPx26.textMain;

  TextStyle get semiBold26textSecondary =>
      semiBoldPx26.textSecondary;

  TextStyle get semiBold26textSub =>
      semiBoldPx26.textSub;

  TextStyle get semiBold26textPlaceholder =>
      semiBoldPx26.textPlaceholder;

  TextStyle get semiBold26textNavigation =>
      semiBoldPx26.textNavigation;

  TextStyle get semiBold26textDark =>
      semiBoldPx26.textDark;

  TextStyle get semiBold26danger =>
      semiBoldPx26.danger;

  TextStyle get semiBold26rating =>
      semiBoldPx26.rating;

  TextStyle get semiBold26white =>
      semiBoldPx26.white;

  TextStyle get semiBold26black =>
      semiBoldPx26.black;

  TextStyle get semiBold28primary =>
      semiBoldPx28.primary;

  TextStyle get semiBold28primaryLight =>
      semiBoldPx28.primaryLight;

  TextStyle get semiBold28primaryDark =>
      semiBoldPx28.primaryDark;

  TextStyle get semiBold28textMain =>
      semiBoldPx28.textMain;

  TextStyle get semiBold28textSecondary =>
      semiBoldPx28.textSecondary;

  TextStyle get semiBold28textSub =>
      semiBoldPx28.textSub;

  TextStyle get semiBold28textPlaceholder =>
      semiBoldPx28.textPlaceholder;

  TextStyle get semiBold28textNavigation =>
      semiBoldPx28.textNavigation;

  TextStyle get semiBold28textDark =>
      semiBoldPx28.textDark;

  TextStyle get semiBold28danger =>
      semiBoldPx28.danger;

  TextStyle get semiBold28rating =>
      semiBoldPx28.rating;

  TextStyle get semiBold28white =>
      semiBoldPx28.white;

  TextStyle get semiBold28black =>
      semiBoldPx28.black;

  TextStyle get semiBold30primary =>
      semiBoldPx30.primary;

  TextStyle get semiBold30primaryLight =>
      semiBoldPx30.primaryLight;

  TextStyle get semiBold30primaryDark =>
      semiBoldPx30.primaryDark;

  TextStyle get semiBold30textMain =>
      semiBoldPx30.textMain;

  TextStyle get semiBold30textSecondary =>
      semiBoldPx30.textSecondary;

  TextStyle get semiBold30textSub =>
      semiBoldPx30.textSub;

  TextStyle get semiBold30textPlaceholder =>
      semiBoldPx30.textPlaceholder;

  TextStyle get semiBold30textNavigation =>
      semiBoldPx30.textNavigation;

  TextStyle get semiBold30textDark =>
      semiBoldPx30.textDark;

  TextStyle get semiBold30danger =>
      semiBoldPx30.danger;

  TextStyle get semiBold30rating =>
      semiBoldPx30.rating;

  TextStyle get semiBold30white =>
      semiBoldPx30.white;

  TextStyle get semiBold30black =>
      semiBoldPx30.black;

  TextStyle get semiBold32primary =>
      semiBoldPx32.primary;

  TextStyle get semiBold32primaryLight =>
      semiBoldPx32.primaryLight;

  TextStyle get semiBold32primaryDark =>
      semiBoldPx32.primaryDark;

  TextStyle get semiBold32textMain =>
      semiBoldPx32.textMain;

  TextStyle get semiBold32textSecondary =>
      semiBoldPx32.textSecondary;

  TextStyle get semiBold32textSub =>
      semiBoldPx32.textSub;

  TextStyle get semiBold32textPlaceholder =>
      semiBoldPx32.textPlaceholder;

  TextStyle get semiBold32textNavigation =>
      semiBoldPx32.textNavigation;

  TextStyle get semiBold32textDark =>
      semiBoldPx32.textDark;

  TextStyle get semiBold32danger =>
      semiBoldPx32.danger;

  TextStyle get semiBold32rating =>
      semiBoldPx32.rating;

  TextStyle get semiBold32white =>
      semiBoldPx32.white;

  TextStyle get semiBold32black =>
      semiBoldPx32.black;

  TextStyle get semiBold36primary =>
      semiBoldPx36.primary;

  TextStyle get semiBold36primaryLight =>
      semiBoldPx36.primaryLight;

  TextStyle get semiBold36primaryDark =>
      semiBoldPx36.primaryDark;

  TextStyle get semiBold36textMain =>
      semiBoldPx36.textMain;

  TextStyle get semiBold36textSecondary =>
      semiBoldPx36.textSecondary;

  TextStyle get semiBold36textSub =>
      semiBoldPx36.textSub;

  TextStyle get semiBold36textPlaceholder =>
      semiBoldPx36.textPlaceholder;

  TextStyle get semiBold36textNavigation =>
      semiBoldPx36.textNavigation;

  TextStyle get semiBold36textDark =>
      semiBoldPx36.textDark;

  TextStyle get semiBold36danger =>
      semiBoldPx36.danger;

  TextStyle get semiBold36rating =>
      semiBoldPx36.rating;

  TextStyle get semiBold36white =>
      semiBoldPx36.white;

  TextStyle get semiBold36black =>
      semiBoldPx36.black;

  TextStyle get semiBold40primary =>
      semiBoldPx40.primary;

  TextStyle get semiBold40primaryLight =>
      semiBoldPx40.primaryLight;

  TextStyle get semiBold40primaryDark =>
      semiBoldPx40.primaryDark;

  TextStyle get semiBold40textMain =>
      semiBoldPx40.textMain;

  TextStyle get semiBold40textSecondary =>
      semiBoldPx40.textSecondary;

  TextStyle get semiBold40textSub =>
      semiBoldPx40.textSub;

  TextStyle get semiBold40textPlaceholder =>
      semiBoldPx40.textPlaceholder;

  TextStyle get semiBold40textNavigation =>
      semiBoldPx40.textNavigation;

  TextStyle get semiBold40textDark =>
      semiBoldPx40.textDark;

  TextStyle get semiBold40danger =>
      semiBoldPx40.danger;

  TextStyle get semiBold40rating =>
      semiBoldPx40.rating;

  TextStyle get semiBold40white =>
      semiBoldPx40.white;

  TextStyle get semiBold40black =>
      semiBoldPx40.black;

  TextStyle get bold8primary =>
      boldPx8.primary;

  TextStyle get bold8primaryLight =>
      boldPx8.primaryLight;

  TextStyle get bold8primaryDark =>
      boldPx8.primaryDark;

  TextStyle get bold8textMain =>
      boldPx8.textMain;

  TextStyle get bold8textSecondary =>
      boldPx8.textSecondary;

  TextStyle get bold8textSub =>
      boldPx8.textSub;

  TextStyle get bold8textPlaceholder =>
      boldPx8.textPlaceholder;

  TextStyle get bold8textNavigation =>
      boldPx8.textNavigation;

  TextStyle get bold8textDark =>
      boldPx8.textDark;

  TextStyle get bold8danger =>
      boldPx8.danger;

  TextStyle get bold8rating =>
      boldPx8.rating;

  TextStyle get bold8white =>
      boldPx8.white;

  TextStyle get bold8black =>
      boldPx8.black;

  TextStyle get bold11primary =>
      boldPx11.primary;

  TextStyle get bold11primaryLight =>
      boldPx11.primaryLight;

  TextStyle get bold11primaryDark =>
      boldPx11.primaryDark;

  TextStyle get bold11textMain =>
      boldPx11.textMain;

  TextStyle get bold11textSecondary =>
      boldPx11.textSecondary;

  TextStyle get bold11textSub =>
      boldPx11.textSub;

  TextStyle get bold11textPlaceholder =>
      boldPx11.textPlaceholder;

  TextStyle get bold11textNavigation =>
      boldPx11.textNavigation;

  TextStyle get bold11textDark =>
      boldPx11.textDark;

  TextStyle get bold11danger =>
      boldPx11.danger;

  TextStyle get bold11rating =>
      boldPx11.rating;

  TextStyle get bold11white =>
      boldPx11.white;

  TextStyle get bold11black =>
      boldPx11.black;

  TextStyle get bold12primary =>
      boldPx12.primary;

  TextStyle get bold12primaryLight =>
      boldPx12.primaryLight;

  TextStyle get bold12primaryDark =>
      boldPx12.primaryDark;

  TextStyle get bold12textMain =>
      boldPx12.textMain;

  TextStyle get bold12textSecondary =>
      boldPx12.textSecondary;

  TextStyle get bold12textSub =>
      boldPx12.textSub;

  TextStyle get bold12textPlaceholder =>
      boldPx12.textPlaceholder;

  TextStyle get bold12textNavigation =>
      boldPx12.textNavigation;

  TextStyle get bold12textDark =>
      boldPx12.textDark;

  TextStyle get bold12danger =>
      boldPx12.danger;

  TextStyle get bold12rating =>
      boldPx12.rating;

  TextStyle get bold12white =>
      boldPx12.white;

  TextStyle get bold12black =>
      boldPx12.black;

  TextStyle get bold14primary =>
      boldPx14.primary;

  TextStyle get bold14primaryLight =>
      boldPx14.primaryLight;

  TextStyle get bold14primaryDark =>
      boldPx14.primaryDark;

  TextStyle get bold14textMain =>
      boldPx14.textMain;

  TextStyle get bold14textSecondary =>
      boldPx14.textSecondary;

  TextStyle get bold14textSub =>
      boldPx14.textSub;

  TextStyle get bold14textPlaceholder =>
      boldPx14.textPlaceholder;

  TextStyle get bold14textNavigation =>
      boldPx14.textNavigation;

  TextStyle get bold14textDark =>
      boldPx14.textDark;

  TextStyle get bold14danger =>
      boldPx14.danger;

  TextStyle get bold14rating =>
      boldPx14.rating;

  TextStyle get bold14white =>
      boldPx14.white;

  TextStyle get bold14black =>
      boldPx14.black;

  TextStyle get bold16primary =>
      boldPx16.primary;

  TextStyle get bold16primaryLight =>
      boldPx16.primaryLight;

  TextStyle get bold16primaryDark =>
      boldPx16.primaryDark;

  TextStyle get bold16textMain =>
      boldPx16.textMain;

  TextStyle get bold16textSecondary =>
      boldPx16.textSecondary;

  TextStyle get bold16textSub =>
      boldPx16.textSub;

  TextStyle get bold16textPlaceholder =>
      boldPx16.textPlaceholder;

  TextStyle get bold16textNavigation =>
      boldPx16.textNavigation;

  TextStyle get bold16textDark =>
      boldPx16.textDark;

  TextStyle get bold16danger =>
      boldPx16.danger;

  TextStyle get bold16rating =>
      boldPx16.rating;

  TextStyle get bold16white =>
      boldPx16.white;

  TextStyle get bold16black =>
      boldPx16.black;

  TextStyle get bold18primary =>
      boldPx18.primary;

  TextStyle get bold18primaryLight =>
      boldPx18.primaryLight;

  TextStyle get bold18primaryDark =>
      boldPx18.primaryDark;

  TextStyle get bold18textMain =>
      boldPx18.textMain;

  TextStyle get bold18textSecondary =>
      boldPx18.textSecondary;

  TextStyle get bold18textSub =>
      boldPx18.textSub;

  TextStyle get bold18textPlaceholder =>
      boldPx18.textPlaceholder;

  TextStyle get bold18textNavigation =>
      boldPx18.textNavigation;

  TextStyle get bold18textDark =>
      boldPx18.textDark;

  TextStyle get bold18danger =>
      boldPx18.danger;

  TextStyle get bold18rating =>
      boldPx18.rating;

  TextStyle get bold18white =>
      boldPx18.white;

  TextStyle get bold18black =>
      boldPx18.black;

  TextStyle get bold20primary =>
      boldPx20.primary;

  TextStyle get bold20primaryLight =>
      boldPx20.primaryLight;

  TextStyle get bold20primaryDark =>
      boldPx20.primaryDark;

  TextStyle get bold20textMain =>
      boldPx20.textMain;

  TextStyle get bold20textSecondary =>
      boldPx20.textSecondary;

  TextStyle get bold20textSub =>
      boldPx20.textSub;

  TextStyle get bold20textPlaceholder =>
      boldPx20.textPlaceholder;

  TextStyle get bold20textNavigation =>
      boldPx20.textNavigation;

  TextStyle get bold20textDark =>
      boldPx20.textDark;

  TextStyle get bold20danger =>
      boldPx20.danger;

  TextStyle get bold20rating =>
      boldPx20.rating;

  TextStyle get bold20white =>
      boldPx20.white;

  TextStyle get bold20black =>
      boldPx20.black;

  TextStyle get bold22primary =>
      boldPx22.primary;

  TextStyle get bold22primaryLight =>
      boldPx22.primaryLight;

  TextStyle get bold22primaryDark =>
      boldPx22.primaryDark;

  TextStyle get bold22textMain =>
      boldPx22.textMain;

  TextStyle get bold22textSecondary =>
      boldPx22.textSecondary;

  TextStyle get bold22textSub =>
      boldPx22.textSub;

  TextStyle get bold22textPlaceholder =>
      boldPx22.textPlaceholder;

  TextStyle get bold22textNavigation =>
      boldPx22.textNavigation;

  TextStyle get bold22textDark =>
      boldPx22.textDark;

  TextStyle get bold22danger =>
      boldPx22.danger;

  TextStyle get bold22rating =>
      boldPx22.rating;

  TextStyle get bold22white =>
      boldPx22.white;

  TextStyle get bold22black =>
      boldPx22.black;

  TextStyle get bold24primary =>
      boldPx24.primary;

  TextStyle get bold24primaryLight =>
      boldPx24.primaryLight;

  TextStyle get bold24primaryDark =>
      boldPx24.primaryDark;

  TextStyle get bold24textMain =>
      boldPx24.textMain;

  TextStyle get bold24textSecondary =>
      boldPx24.textSecondary;

  TextStyle get bold24textSub =>
      boldPx24.textSub;

  TextStyle get bold24textPlaceholder =>
      boldPx24.textPlaceholder;

  TextStyle get bold24textNavigation =>
      boldPx24.textNavigation;

  TextStyle get bold24textDark =>
      boldPx24.textDark;

  TextStyle get bold24danger =>
      boldPx24.danger;

  TextStyle get bold24rating =>
      boldPx24.rating;

  TextStyle get bold24white =>
      boldPx24.white;

  TextStyle get bold24black =>
      boldPx24.black;

  TextStyle get bold26primary =>
      boldPx26.primary;

  TextStyle get bold26primaryLight =>
      boldPx26.primaryLight;

  TextStyle get bold26primaryDark =>
      boldPx26.primaryDark;

  TextStyle get bold26textMain =>
      boldPx26.textMain;

  TextStyle get bold26textSecondary =>
      boldPx26.textSecondary;

  TextStyle get bold26textSub =>
      boldPx26.textSub;

  TextStyle get bold26textPlaceholder =>
      boldPx26.textPlaceholder;

  TextStyle get bold26textNavigation =>
      boldPx26.textNavigation;

  TextStyle get bold26textDark =>
      boldPx26.textDark;

  TextStyle get bold26danger =>
      boldPx26.danger;

  TextStyle get bold26rating =>
      boldPx26.rating;

  TextStyle get bold26white =>
      boldPx26.white;

  TextStyle get bold26black =>
      boldPx26.black;

  TextStyle get bold28primary =>
      boldPx28.primary;

  TextStyle get bold28primaryLight =>
      boldPx28.primaryLight;

  TextStyle get bold28primaryDark =>
      boldPx28.primaryDark;

  TextStyle get bold28textMain =>
      boldPx28.textMain;

  TextStyle get bold28textSecondary =>
      boldPx28.textSecondary;

  TextStyle get bold28textSub =>
      boldPx28.textSub;

  TextStyle get bold28textPlaceholder =>
      boldPx28.textPlaceholder;

  TextStyle get bold28textNavigation =>
      boldPx28.textNavigation;

  TextStyle get bold28textDark =>
      boldPx28.textDark;

  TextStyle get bold28danger =>
      boldPx28.danger;

  TextStyle get bold28rating =>
      boldPx28.rating;

  TextStyle get bold28white =>
      boldPx28.white;

  TextStyle get bold28black =>
      boldPx28.black;

  TextStyle get bold30primary =>
      boldPx30.primary;

  TextStyle get bold30primaryLight =>
      boldPx30.primaryLight;

  TextStyle get bold30primaryDark =>
      boldPx30.primaryDark;

  TextStyle get bold30textMain =>
      boldPx30.textMain;

  TextStyle get bold30textSecondary =>
      boldPx30.textSecondary;

  TextStyle get bold30textSub =>
      boldPx30.textSub;

  TextStyle get bold30textPlaceholder =>
      boldPx30.textPlaceholder;

  TextStyle get bold30textNavigation =>
      boldPx30.textNavigation;

  TextStyle get bold30textDark =>
      boldPx30.textDark;

  TextStyle get bold30danger =>
      boldPx30.danger;

  TextStyle get bold30rating =>
      boldPx30.rating;

  TextStyle get bold30white =>
      boldPx30.white;

  TextStyle get bold30black =>
      boldPx30.black;

  TextStyle get bold32primary =>
      boldPx32.primary;

  TextStyle get bold32primaryLight =>
      boldPx32.primaryLight;

  TextStyle get bold32primaryDark =>
      boldPx32.primaryDark;

  TextStyle get bold32textMain =>
      boldPx32.textMain;

  TextStyle get bold32textSecondary =>
      boldPx32.textSecondary;

  TextStyle get bold32textSub =>
      boldPx32.textSub;

  TextStyle get bold32textPlaceholder =>
      boldPx32.textPlaceholder;

  TextStyle get bold32textNavigation =>
      boldPx32.textNavigation;

  TextStyle get bold32textDark =>
      boldPx32.textDark;

  TextStyle get bold32danger =>
      boldPx32.danger;

  TextStyle get bold32rating =>
      boldPx32.rating;

  TextStyle get bold32white =>
      boldPx32.white;

  TextStyle get bold32black =>
      boldPx32.black;

  TextStyle get bold36primary =>
      boldPx36.primary;

  TextStyle get bold36primaryLight =>
      boldPx36.primaryLight;

  TextStyle get bold36primaryDark =>
      boldPx36.primaryDark;

  TextStyle get bold36textMain =>
      boldPx36.textMain;

  TextStyle get bold36textSecondary =>
      boldPx36.textSecondary;

  TextStyle get bold36textSub =>
      boldPx36.textSub;

  TextStyle get bold36textPlaceholder =>
      boldPx36.textPlaceholder;

  TextStyle get bold36textNavigation =>
      boldPx36.textNavigation;

  TextStyle get bold36textDark =>
      boldPx36.textDark;

  TextStyle get bold36danger =>
      boldPx36.danger;

  TextStyle get bold36rating =>
      boldPx36.rating;

  TextStyle get bold36white =>
      boldPx36.white;

  TextStyle get bold36black =>
      boldPx36.black;

  TextStyle get bold40primary =>
      boldPx40.primary;

  TextStyle get bold40primaryLight =>
      boldPx40.primaryLight;

  TextStyle get bold40primaryDark =>
      boldPx40.primaryDark;

  TextStyle get bold40textMain =>
      boldPx40.textMain;

  TextStyle get bold40textSecondary =>
      boldPx40.textSecondary;

  TextStyle get bold40textSub =>
      boldPx40.textSub;

  TextStyle get bold40textPlaceholder =>
      boldPx40.textPlaceholder;

  TextStyle get bold40textNavigation =>
      boldPx40.textNavigation;

  TextStyle get bold40textDark =>
      boldPx40.textDark;

  TextStyle get bold40danger =>
      boldPx40.danger;

  TextStyle get bold40rating =>
      boldPx40.rating;

  TextStyle get bold40white =>
      boldPx40.white;

  TextStyle get bold40black =>
      boldPx40.black;

}
