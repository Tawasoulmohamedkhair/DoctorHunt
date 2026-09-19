import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:flutter/material.dart';



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

  TextStyle get grey => copyWith(
        color: AppColors.grey,
      );

  TextStyle get lightgray => copyWith(
        color: AppColors.lightgray,
      );

}
extension FontSizeAtoms on TextStyle {

  TextStyle get px7 => copyWith(
        fontSize: 7,
      );

  TextStyle get px9 => copyWith(
        fontSize: 9,
      );

  TextStyle get px10 => copyWith(
        fontSize: 10,
      );

  TextStyle get px11 => copyWith(
        fontSize: 11,
      );

  TextStyle get px12 => copyWith(
        fontSize: 12,
      );

  TextStyle get px13 => copyWith(
        fontSize: 13,
      );

  TextStyle get px14 => copyWith(
        fontSize: 14,
      );

  TextStyle get px15 => copyWith(
        fontSize: 15,
      );

  TextStyle get px16 => copyWith(
        fontSize: 16,
      );

  TextStyle get px18 => copyWith(
        fontSize: 18,
      );

  TextStyle get px20 => copyWith(
        fontSize: 20,
      );

  TextStyle get px22 => copyWith(
        fontSize: 22,
      );

  TextStyle get px24 => copyWith(
        fontSize: 24,
      );

  TextStyle get px25 => copyWith(
        fontSize: 25,
      );

  TextStyle get px26 => copyWith(
        fontSize: 26,
      );

  TextStyle get px28 => copyWith(
        fontSize: 28,
      );

  TextStyle get px30 => copyWith(
        fontSize: 30,
      );

  TextStyle get px38 => copyWith(
        fontSize: 38,
      );

}
extension WeightAndPxMixes on BuildContext {

  TextStyle get lightPx7 => light.px7;

  TextStyle get lightPx9 => light.px9;

  TextStyle get lightPx10 => light.px10;

  TextStyle get lightPx11 => light.px11;

  TextStyle get lightPx12 => light.px12;

  TextStyle get lightPx13 => light.px13;

  TextStyle get lightPx14 => light.px14;

  TextStyle get lightPx15 => light.px15;

  TextStyle get lightPx16 => light.px16;

  TextStyle get lightPx18 => light.px18;

  TextStyle get lightPx20 => light.px20;

  TextStyle get lightPx22 => light.px22;

  TextStyle get lightPx24 => light.px24;

  TextStyle get lightPx25 => light.px25;

  TextStyle get lightPx26 => light.px26;

  TextStyle get lightPx28 => light.px28;

  TextStyle get lightPx30 => light.px30;

  TextStyle get lightPx38 => light.px38;

  TextStyle get regularPx7 => regular.px7;

  TextStyle get regularPx9 => regular.px9;

  TextStyle get regularPx10 => regular.px10;

  TextStyle get regularPx11 => regular.px11;

  TextStyle get regularPx12 => regular.px12;

  TextStyle get regularPx13 => regular.px13;

  TextStyle get regularPx14 => regular.px14;

  TextStyle get regularPx15 => regular.px15;

  TextStyle get regularPx16 => regular.px16;

  TextStyle get regularPx18 => regular.px18;

  TextStyle get regularPx20 => regular.px20;

  TextStyle get regularPx22 => regular.px22;

  TextStyle get regularPx24 => regular.px24;

  TextStyle get regularPx25 => regular.px25;

  TextStyle get regularPx26 => regular.px26;

  TextStyle get regularPx28 => regular.px28;

  TextStyle get regularPx30 => regular.px30;

  TextStyle get regularPx38 => regular.px38;

  TextStyle get mediumPx7 => medium.px7;

  TextStyle get mediumPx9 => medium.px9;

  TextStyle get mediumPx10 => medium.px10;

  TextStyle get mediumPx11 => medium.px11;

  TextStyle get mediumPx12 => medium.px12;

  TextStyle get mediumPx13 => medium.px13;

  TextStyle get mediumPx14 => medium.px14;

  TextStyle get mediumPx15 => medium.px15;

  TextStyle get mediumPx16 => medium.px16;

  TextStyle get mediumPx18 => medium.px18;

  TextStyle get mediumPx20 => medium.px20;

  TextStyle get mediumPx22 => medium.px22;

  TextStyle get mediumPx24 => medium.px24;

  TextStyle get mediumPx25 => medium.px25;

  TextStyle get mediumPx26 => medium.px26;

  TextStyle get mediumPx28 => medium.px28;

  TextStyle get mediumPx30 => medium.px30;

  TextStyle get mediumPx38 => medium.px38;

  TextStyle get semiBoldPx7 => semiBold.px7;

  TextStyle get semiBoldPx9 => semiBold.px9;

  TextStyle get semiBoldPx10 => semiBold.px10;

  TextStyle get semiBoldPx11 => semiBold.px11;

  TextStyle get semiBoldPx12 => semiBold.px12;

  TextStyle get semiBoldPx13 => semiBold.px13;

  TextStyle get semiBoldPx14 => semiBold.px14;

  TextStyle get semiBoldPx15 => semiBold.px15;

  TextStyle get semiBoldPx16 => semiBold.px16;

  TextStyle get semiBoldPx18 => semiBold.px18;

  TextStyle get semiBoldPx20 => semiBold.px20;

  TextStyle get semiBoldPx22 => semiBold.px22;

  TextStyle get semiBoldPx24 => semiBold.px24;

  TextStyle get semiBoldPx25 => semiBold.px25;

  TextStyle get semiBoldPx26 => semiBold.px26;

  TextStyle get semiBoldPx28 => semiBold.px28;

  TextStyle get semiBoldPx30 => semiBold.px30;

  TextStyle get semiBoldPx38 => semiBold.px38;

  TextStyle get boldPx7 => bold.px7;

  TextStyle get boldPx9 => bold.px9;

  TextStyle get boldPx10 => bold.px10;

  TextStyle get boldPx11 => bold.px11;

  TextStyle get boldPx12 => bold.px12;

  TextStyle get boldPx13 => bold.px13;

  TextStyle get boldPx14 => bold.px14;

  TextStyle get boldPx15 => bold.px15;

  TextStyle get boldPx16 => bold.px16;

  TextStyle get boldPx18 => bold.px18;

  TextStyle get boldPx20 => bold.px20;

  TextStyle get boldPx22 => bold.px22;

  TextStyle get boldPx24 => bold.px24;

  TextStyle get boldPx25 => bold.px25;

  TextStyle get boldPx26 => bold.px26;

  TextStyle get boldPx28 => bold.px28;

  TextStyle get boldPx30 => bold.px30;

  TextStyle get boldPx38 => bold.px38;

}
extension StyleAtoms on BuildContext {

  TextStyle get light7primary =>
      lightPx7.primary;

  TextStyle get light7primaryLight =>
      lightPx7.primaryLight;

  TextStyle get light7primaryDark =>
      lightPx7.primaryDark;

  TextStyle get light7textMain =>
      lightPx7.textMain;

  TextStyle get light7textSecondary =>
      lightPx7.textSecondary;

  TextStyle get light7textSub =>
      lightPx7.textSub;

  TextStyle get light7textPlaceholder =>
      lightPx7.textPlaceholder;

  TextStyle get light7textNavigation =>
      lightPx7.textNavigation;

  TextStyle get light7textDark =>
      lightPx7.textDark;

  TextStyle get light7danger =>
      lightPx7.danger;

  TextStyle get light7rating =>
      lightPx7.rating;

  TextStyle get light7white =>
      lightPx7.white;

  TextStyle get light7black =>
      lightPx7.black;

  TextStyle get light7grey =>
      lightPx7.grey;

  TextStyle get light7lightgray =>
      lightPx7.lightgray;

  TextStyle get light9primary =>
      lightPx9.primary;

  TextStyle get light9primaryLight =>
      lightPx9.primaryLight;

  TextStyle get light9primaryDark =>
      lightPx9.primaryDark;

  TextStyle get light9textMain =>
      lightPx9.textMain;

  TextStyle get light9textSecondary =>
      lightPx9.textSecondary;

  TextStyle get light9textSub =>
      lightPx9.textSub;

  TextStyle get light9textPlaceholder =>
      lightPx9.textPlaceholder;

  TextStyle get light9textNavigation =>
      lightPx9.textNavigation;

  TextStyle get light9textDark =>
      lightPx9.textDark;

  TextStyle get light9danger =>
      lightPx9.danger;

  TextStyle get light9rating =>
      lightPx9.rating;

  TextStyle get light9white =>
      lightPx9.white;

  TextStyle get light9black =>
      lightPx9.black;

  TextStyle get light9grey =>
      lightPx9.grey;

  TextStyle get light9lightgray =>
      lightPx9.lightgray;

  TextStyle get light10primary =>
      lightPx10.primary;

  TextStyle get light10primaryLight =>
      lightPx10.primaryLight;

  TextStyle get light10primaryDark =>
      lightPx10.primaryDark;

  TextStyle get light10textMain =>
      lightPx10.textMain;

  TextStyle get light10textSecondary =>
      lightPx10.textSecondary;

  TextStyle get light10textSub =>
      lightPx10.textSub;

  TextStyle get light10textPlaceholder =>
      lightPx10.textPlaceholder;

  TextStyle get light10textNavigation =>
      lightPx10.textNavigation;

  TextStyle get light10textDark =>
      lightPx10.textDark;

  TextStyle get light10danger =>
      lightPx10.danger;

  TextStyle get light10rating =>
      lightPx10.rating;

  TextStyle get light10white =>
      lightPx10.white;

  TextStyle get light10black =>
      lightPx10.black;

  TextStyle get light10grey =>
      lightPx10.grey;

  TextStyle get light10lightgray =>
      lightPx10.lightgray;

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

  TextStyle get light11grey =>
      lightPx11.grey;

  TextStyle get light11lightgray =>
      lightPx11.lightgray;

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

  TextStyle get light12grey =>
      lightPx12.grey;

  TextStyle get light12lightgray =>
      lightPx12.lightgray;

  TextStyle get light13primary =>
      lightPx13.primary;

  TextStyle get light13primaryLight =>
      lightPx13.primaryLight;

  TextStyle get light13primaryDark =>
      lightPx13.primaryDark;

  TextStyle get light13textMain =>
      lightPx13.textMain;

  TextStyle get light13textSecondary =>
      lightPx13.textSecondary;

  TextStyle get light13textSub =>
      lightPx13.textSub;

  TextStyle get light13textPlaceholder =>
      lightPx13.textPlaceholder;

  TextStyle get light13textNavigation =>
      lightPx13.textNavigation;

  TextStyle get light13textDark =>
      lightPx13.textDark;

  TextStyle get light13danger =>
      lightPx13.danger;

  TextStyle get light13rating =>
      lightPx13.rating;

  TextStyle get light13white =>
      lightPx13.white;

  TextStyle get light13black =>
      lightPx13.black;

  TextStyle get light13grey =>
      lightPx13.grey;

  TextStyle get light13lightgray =>
      lightPx13.lightgray;

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

  TextStyle get light14grey =>
      lightPx14.grey;

  TextStyle get light14lightgray =>
      lightPx14.lightgray;

  TextStyle get light15primary =>
      lightPx15.primary;

  TextStyle get light15primaryLight =>
      lightPx15.primaryLight;

  TextStyle get light15primaryDark =>
      lightPx15.primaryDark;

  TextStyle get light15textMain =>
      lightPx15.textMain;

  TextStyle get light15textSecondary =>
      lightPx15.textSecondary;

  TextStyle get light15textSub =>
      lightPx15.textSub;

  TextStyle get light15textPlaceholder =>
      lightPx15.textPlaceholder;

  TextStyle get light15textNavigation =>
      lightPx15.textNavigation;

  TextStyle get light15textDark =>
      lightPx15.textDark;

  TextStyle get light15danger =>
      lightPx15.danger;

  TextStyle get light15rating =>
      lightPx15.rating;

  TextStyle get light15white =>
      lightPx15.white;

  TextStyle get light15black =>
      lightPx15.black;

  TextStyle get light15grey =>
      lightPx15.grey;

  TextStyle get light15lightgray =>
      lightPx15.lightgray;

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

  TextStyle get light16grey =>
      lightPx16.grey;

  TextStyle get light16lightgray =>
      lightPx16.lightgray;

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

  TextStyle get light18grey =>
      lightPx18.grey;

  TextStyle get light18lightgray =>
      lightPx18.lightgray;

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

  TextStyle get light20grey =>
      lightPx20.grey;

  TextStyle get light20lightgray =>
      lightPx20.lightgray;

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

  TextStyle get light22grey =>
      lightPx22.grey;

  TextStyle get light22lightgray =>
      lightPx22.lightgray;

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

  TextStyle get light24grey =>
      lightPx24.grey;

  TextStyle get light24lightgray =>
      lightPx24.lightgray;

  TextStyle get light25primary =>
      lightPx25.primary;

  TextStyle get light25primaryLight =>
      lightPx25.primaryLight;

  TextStyle get light25primaryDark =>
      lightPx25.primaryDark;

  TextStyle get light25textMain =>
      lightPx25.textMain;

  TextStyle get light25textSecondary =>
      lightPx25.textSecondary;

  TextStyle get light25textSub =>
      lightPx25.textSub;

  TextStyle get light25textPlaceholder =>
      lightPx25.textPlaceholder;

  TextStyle get light25textNavigation =>
      lightPx25.textNavigation;

  TextStyle get light25textDark =>
      lightPx25.textDark;

  TextStyle get light25danger =>
      lightPx25.danger;

  TextStyle get light25rating =>
      lightPx25.rating;

  TextStyle get light25white =>
      lightPx25.white;

  TextStyle get light25black =>
      lightPx25.black;

  TextStyle get light25grey =>
      lightPx25.grey;

  TextStyle get light25lightgray =>
      lightPx25.lightgray;

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

  TextStyle get light26grey =>
      lightPx26.grey;

  TextStyle get light26lightgray =>
      lightPx26.lightgray;

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

  TextStyle get light28grey =>
      lightPx28.grey;

  TextStyle get light28lightgray =>
      lightPx28.lightgray;

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

  TextStyle get light30grey =>
      lightPx30.grey;

  TextStyle get light30lightgray =>
      lightPx30.lightgray;

  TextStyle get light38primary =>
      lightPx38.primary;

  TextStyle get light38primaryLight =>
      lightPx38.primaryLight;

  TextStyle get light38primaryDark =>
      lightPx38.primaryDark;

  TextStyle get light38textMain =>
      lightPx38.textMain;

  TextStyle get light38textSecondary =>
      lightPx38.textSecondary;

  TextStyle get light38textSub =>
      lightPx38.textSub;

  TextStyle get light38textPlaceholder =>
      lightPx38.textPlaceholder;

  TextStyle get light38textNavigation =>
      lightPx38.textNavigation;

  TextStyle get light38textDark =>
      lightPx38.textDark;

  TextStyle get light38danger =>
      lightPx38.danger;

  TextStyle get light38rating =>
      lightPx38.rating;

  TextStyle get light38white =>
      lightPx38.white;

  TextStyle get light38black =>
      lightPx38.black;

  TextStyle get light38grey =>
      lightPx38.grey;

  TextStyle get light38lightgray =>
      lightPx38.lightgray;

  TextStyle get regular7primary =>
      regularPx7.primary;

  TextStyle get regular7primaryLight =>
      regularPx7.primaryLight;

  TextStyle get regular7primaryDark =>
      regularPx7.primaryDark;

  TextStyle get regular7textMain =>
      regularPx7.textMain;

  TextStyle get regular7textSecondary =>
      regularPx7.textSecondary;

  TextStyle get regular7textSub =>
      regularPx7.textSub;

  TextStyle get regular7textPlaceholder =>
      regularPx7.textPlaceholder;

  TextStyle get regular7textNavigation =>
      regularPx7.textNavigation;

  TextStyle get regular7textDark =>
      regularPx7.textDark;

  TextStyle get regular7danger =>
      regularPx7.danger;

  TextStyle get regular7rating =>
      regularPx7.rating;

  TextStyle get regular7white =>
      regularPx7.white;

  TextStyle get regular7black =>
      regularPx7.black;

  TextStyle get regular7grey =>
      regularPx7.grey;

  TextStyle get regular7lightgray =>
      regularPx7.lightgray;

  TextStyle get regular9primary =>
      regularPx9.primary;

  TextStyle get regular9primaryLight =>
      regularPx9.primaryLight;

  TextStyle get regular9primaryDark =>
      regularPx9.primaryDark;

  TextStyle get regular9textMain =>
      regularPx9.textMain;

  TextStyle get regular9textSecondary =>
      regularPx9.textSecondary;

  TextStyle get regular9textSub =>
      regularPx9.textSub;

  TextStyle get regular9textPlaceholder =>
      regularPx9.textPlaceholder;

  TextStyle get regular9textNavigation =>
      regularPx9.textNavigation;

  TextStyle get regular9textDark =>
      regularPx9.textDark;

  TextStyle get regular9danger =>
      regularPx9.danger;

  TextStyle get regular9rating =>
      regularPx9.rating;

  TextStyle get regular9white =>
      regularPx9.white;

  TextStyle get regular9black =>
      regularPx9.black;

  TextStyle get regular9grey =>
      regularPx9.grey;

  TextStyle get regular9lightgray =>
      regularPx9.lightgray;

  TextStyle get regular10primary =>
      regularPx10.primary;

  TextStyle get regular10primaryLight =>
      regularPx10.primaryLight;

  TextStyle get regular10primaryDark =>
      regularPx10.primaryDark;

  TextStyle get regular10textMain =>
      regularPx10.textMain;

  TextStyle get regular10textSecondary =>
      regularPx10.textSecondary;

  TextStyle get regular10textSub =>
      regularPx10.textSub;

  TextStyle get regular10textPlaceholder =>
      regularPx10.textPlaceholder;

  TextStyle get regular10textNavigation =>
      regularPx10.textNavigation;

  TextStyle get regular10textDark =>
      regularPx10.textDark;

  TextStyle get regular10danger =>
      regularPx10.danger;

  TextStyle get regular10rating =>
      regularPx10.rating;

  TextStyle get regular10white =>
      regularPx10.white;

  TextStyle get regular10black =>
      regularPx10.black;

  TextStyle get regular10grey =>
      regularPx10.grey;

  TextStyle get regular10lightgray =>
      regularPx10.lightgray;

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

  TextStyle get regular11grey =>
      regularPx11.grey;

  TextStyle get regular11lightgray =>
      regularPx11.lightgray;

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

  TextStyle get regular12grey =>
      regularPx12.grey;

  TextStyle get regular12lightgray =>
      regularPx12.lightgray;

  TextStyle get regular13primary =>
      regularPx13.primary;

  TextStyle get regular13primaryLight =>
      regularPx13.primaryLight;

  TextStyle get regular13primaryDark =>
      regularPx13.primaryDark;

  TextStyle get regular13textMain =>
      regularPx13.textMain;

  TextStyle get regular13textSecondary =>
      regularPx13.textSecondary;

  TextStyle get regular13textSub =>
      regularPx13.textSub;

  TextStyle get regular13textPlaceholder =>
      regularPx13.textPlaceholder;

  TextStyle get regular13textNavigation =>
      regularPx13.textNavigation;

  TextStyle get regular13textDark =>
      regularPx13.textDark;

  TextStyle get regular13danger =>
      regularPx13.danger;

  TextStyle get regular13rating =>
      regularPx13.rating;

  TextStyle get regular13white =>
      regularPx13.white;

  TextStyle get regular13black =>
      regularPx13.black;

  TextStyle get regular13grey =>
      regularPx13.grey;

  TextStyle get regular13lightgray =>
      regularPx13.lightgray;

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

  TextStyle get regular14grey =>
      regularPx14.grey;

  TextStyle get regular14lightgray =>
      regularPx14.lightgray;

  TextStyle get regular15primary =>
      regularPx15.primary;

  TextStyle get regular15primaryLight =>
      regularPx15.primaryLight;

  TextStyle get regular15primaryDark =>
      regularPx15.primaryDark;

  TextStyle get regular15textMain =>
      regularPx15.textMain;

  TextStyle get regular15textSecondary =>
      regularPx15.textSecondary;

  TextStyle get regular15textSub =>
      regularPx15.textSub;

  TextStyle get regular15textPlaceholder =>
      regularPx15.textPlaceholder;

  TextStyle get regular15textNavigation =>
      regularPx15.textNavigation;

  TextStyle get regular15textDark =>
      regularPx15.textDark;

  TextStyle get regular15danger =>
      regularPx15.danger;

  TextStyle get regular15rating =>
      regularPx15.rating;

  TextStyle get regular15white =>
      regularPx15.white;

  TextStyle get regular15black =>
      regularPx15.black;

  TextStyle get regular15grey =>
      regularPx15.grey;

  TextStyle get regular15lightgray =>
      regularPx15.lightgray;

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

  TextStyle get regular16grey =>
      regularPx16.grey;

  TextStyle get regular16lightgray =>
      regularPx16.lightgray;

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

  TextStyle get regular18grey =>
      regularPx18.grey;

  TextStyle get regular18lightgray =>
      regularPx18.lightgray;

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

  TextStyle get regular20grey =>
      regularPx20.grey;

  TextStyle get regular20lightgray =>
      regularPx20.lightgray;

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

  TextStyle get regular22grey =>
      regularPx22.grey;

  TextStyle get regular22lightgray =>
      regularPx22.lightgray;

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

  TextStyle get regular24grey =>
      regularPx24.grey;

  TextStyle get regular24lightgray =>
      regularPx24.lightgray;

  TextStyle get regular25primary =>
      regularPx25.primary;

  TextStyle get regular25primaryLight =>
      regularPx25.primaryLight;

  TextStyle get regular25primaryDark =>
      regularPx25.primaryDark;

  TextStyle get regular25textMain =>
      regularPx25.textMain;

  TextStyle get regular25textSecondary =>
      regularPx25.textSecondary;

  TextStyle get regular25textSub =>
      regularPx25.textSub;

  TextStyle get regular25textPlaceholder =>
      regularPx25.textPlaceholder;

  TextStyle get regular25textNavigation =>
      regularPx25.textNavigation;

  TextStyle get regular25textDark =>
      regularPx25.textDark;

  TextStyle get regular25danger =>
      regularPx25.danger;

  TextStyle get regular25rating =>
      regularPx25.rating;

  TextStyle get regular25white =>
      regularPx25.white;

  TextStyle get regular25black =>
      regularPx25.black;

  TextStyle get regular25grey =>
      regularPx25.grey;

  TextStyle get regular25lightgray =>
      regularPx25.lightgray;

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

  TextStyle get regular26grey =>
      regularPx26.grey;

  TextStyle get regular26lightgray =>
      regularPx26.lightgray;

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

  TextStyle get regular28grey =>
      regularPx28.grey;

  TextStyle get regular28lightgray =>
      regularPx28.lightgray;

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

  TextStyle get regular30grey =>
      regularPx30.grey;

  TextStyle get regular30lightgray =>
      regularPx30.lightgray;

  TextStyle get regular38primary =>
      regularPx38.primary;

  TextStyle get regular38primaryLight =>
      regularPx38.primaryLight;

  TextStyle get regular38primaryDark =>
      regularPx38.primaryDark;

  TextStyle get regular38textMain =>
      regularPx38.textMain;

  TextStyle get regular38textSecondary =>
      regularPx38.textSecondary;

  TextStyle get regular38textSub =>
      regularPx38.textSub;

  TextStyle get regular38textPlaceholder =>
      regularPx38.textPlaceholder;

  TextStyle get regular38textNavigation =>
      regularPx38.textNavigation;

  TextStyle get regular38textDark =>
      regularPx38.textDark;

  TextStyle get regular38danger =>
      regularPx38.danger;

  TextStyle get regular38rating =>
      regularPx38.rating;

  TextStyle get regular38white =>
      regularPx38.white;

  TextStyle get regular38black =>
      regularPx38.black;

  TextStyle get regular38grey =>
      regularPx38.grey;

  TextStyle get regular38lightgray =>
      regularPx38.lightgray;

  TextStyle get medium7primary =>
      mediumPx7.primary;

  TextStyle get medium7primaryLight =>
      mediumPx7.primaryLight;

  TextStyle get medium7primaryDark =>
      mediumPx7.primaryDark;

  TextStyle get medium7textMain =>
      mediumPx7.textMain;

  TextStyle get medium7textSecondary =>
      mediumPx7.textSecondary;

  TextStyle get medium7textSub =>
      mediumPx7.textSub;

  TextStyle get medium7textPlaceholder =>
      mediumPx7.textPlaceholder;

  TextStyle get medium7textNavigation =>
      mediumPx7.textNavigation;

  TextStyle get medium7textDark =>
      mediumPx7.textDark;

  TextStyle get medium7danger =>
      mediumPx7.danger;

  TextStyle get medium7rating =>
      mediumPx7.rating;

  TextStyle get medium7white =>
      mediumPx7.white;

  TextStyle get medium7black =>
      mediumPx7.black;

  TextStyle get medium7grey =>
      mediumPx7.grey;

  TextStyle get medium7lightgray =>
      mediumPx7.lightgray;

  TextStyle get medium9primary =>
      mediumPx9.primary;

  TextStyle get medium9primaryLight =>
      mediumPx9.primaryLight;

  TextStyle get medium9primaryDark =>
      mediumPx9.primaryDark;

  TextStyle get medium9textMain =>
      mediumPx9.textMain;

  TextStyle get medium9textSecondary =>
      mediumPx9.textSecondary;

  TextStyle get medium9textSub =>
      mediumPx9.textSub;

  TextStyle get medium9textPlaceholder =>
      mediumPx9.textPlaceholder;

  TextStyle get medium9textNavigation =>
      mediumPx9.textNavigation;

  TextStyle get medium9textDark =>
      mediumPx9.textDark;

  TextStyle get medium9danger =>
      mediumPx9.danger;

  TextStyle get medium9rating =>
      mediumPx9.rating;

  TextStyle get medium9white =>
      mediumPx9.white;

  TextStyle get medium9black =>
      mediumPx9.black;

  TextStyle get medium9grey =>
      mediumPx9.grey;

  TextStyle get medium9lightgray =>
      mediumPx9.lightgray;

  TextStyle get medium10primary =>
      mediumPx10.primary;

  TextStyle get medium10primaryLight =>
      mediumPx10.primaryLight;

  TextStyle get medium10primaryDark =>
      mediumPx10.primaryDark;

  TextStyle get medium10textMain =>
      mediumPx10.textMain;

  TextStyle get medium10textSecondary =>
      mediumPx10.textSecondary;

  TextStyle get medium10textSub =>
      mediumPx10.textSub;

  TextStyle get medium10textPlaceholder =>
      mediumPx10.textPlaceholder;

  TextStyle get medium10textNavigation =>
      mediumPx10.textNavigation;

  TextStyle get medium10textDark =>
      mediumPx10.textDark;

  TextStyle get medium10danger =>
      mediumPx10.danger;

  TextStyle get medium10rating =>
      mediumPx10.rating;

  TextStyle get medium10white =>
      mediumPx10.white;

  TextStyle get medium10black =>
      mediumPx10.black;

  TextStyle get medium10grey =>
      mediumPx10.grey;

  TextStyle get medium10lightgray =>
      mediumPx10.lightgray;

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

  TextStyle get medium11grey =>
      mediumPx11.grey;

  TextStyle get medium11lightgray =>
      mediumPx11.lightgray;

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

  TextStyle get medium12grey =>
      mediumPx12.grey;

  TextStyle get medium12lightgray =>
      mediumPx12.lightgray;

  TextStyle get medium13primary =>
      mediumPx13.primary;

  TextStyle get medium13primaryLight =>
      mediumPx13.primaryLight;

  TextStyle get medium13primaryDark =>
      mediumPx13.primaryDark;

  TextStyle get medium13textMain =>
      mediumPx13.textMain;

  TextStyle get medium13textSecondary =>
      mediumPx13.textSecondary;

  TextStyle get medium13textSub =>
      mediumPx13.textSub;

  TextStyle get medium13textPlaceholder =>
      mediumPx13.textPlaceholder;

  TextStyle get medium13textNavigation =>
      mediumPx13.textNavigation;

  TextStyle get medium13textDark =>
      mediumPx13.textDark;

  TextStyle get medium13danger =>
      mediumPx13.danger;

  TextStyle get medium13rating =>
      mediumPx13.rating;

  TextStyle get medium13white =>
      mediumPx13.white;

  TextStyle get medium13black =>
      mediumPx13.black;

  TextStyle get medium13grey =>
      mediumPx13.grey;

  TextStyle get medium13lightgray =>
      mediumPx13.lightgray;

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

  TextStyle get medium14grey =>
      mediumPx14.grey;

  TextStyle get medium14lightgray =>
      mediumPx14.lightgray;

  TextStyle get medium15primary =>
      mediumPx15.primary;

  TextStyle get medium15primaryLight =>
      mediumPx15.primaryLight;

  TextStyle get medium15primaryDark =>
      mediumPx15.primaryDark;

  TextStyle get medium15textMain =>
      mediumPx15.textMain;

  TextStyle get medium15textSecondary =>
      mediumPx15.textSecondary;

  TextStyle get medium15textSub =>
      mediumPx15.textSub;

  TextStyle get medium15textPlaceholder =>
      mediumPx15.textPlaceholder;

  TextStyle get medium15textNavigation =>
      mediumPx15.textNavigation;

  TextStyle get medium15textDark =>
      mediumPx15.textDark;

  TextStyle get medium15danger =>
      mediumPx15.danger;

  TextStyle get medium15rating =>
      mediumPx15.rating;

  TextStyle get medium15white =>
      mediumPx15.white;

  TextStyle get medium15black =>
      mediumPx15.black;

  TextStyle get medium15grey =>
      mediumPx15.grey;

  TextStyle get medium15lightgray =>
      mediumPx15.lightgray;

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

  TextStyle get medium16grey =>
      mediumPx16.grey;

  TextStyle get medium16lightgray =>
      mediumPx16.lightgray;

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

  TextStyle get medium18grey =>
      mediumPx18.grey;

  TextStyle get medium18lightgray =>
      mediumPx18.lightgray;

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

  TextStyle get medium20grey =>
      mediumPx20.grey;

  TextStyle get medium20lightgray =>
      mediumPx20.lightgray;

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

  TextStyle get medium22grey =>
      mediumPx22.grey;

  TextStyle get medium22lightgray =>
      mediumPx22.lightgray;

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

  TextStyle get medium24grey =>
      mediumPx24.grey;

  TextStyle get medium24lightgray =>
      mediumPx24.lightgray;

  TextStyle get medium25primary =>
      mediumPx25.primary;

  TextStyle get medium25primaryLight =>
      mediumPx25.primaryLight;

  TextStyle get medium25primaryDark =>
      mediumPx25.primaryDark;

  TextStyle get medium25textMain =>
      mediumPx25.textMain;

  TextStyle get medium25textSecondary =>
      mediumPx25.textSecondary;

  TextStyle get medium25textSub =>
      mediumPx25.textSub;

  TextStyle get medium25textPlaceholder =>
      mediumPx25.textPlaceholder;

  TextStyle get medium25textNavigation =>
      mediumPx25.textNavigation;

  TextStyle get medium25textDark =>
      mediumPx25.textDark;

  TextStyle get medium25danger =>
      mediumPx25.danger;

  TextStyle get medium25rating =>
      mediumPx25.rating;

  TextStyle get medium25white =>
      mediumPx25.white;

  TextStyle get medium25black =>
      mediumPx25.black;

  TextStyle get medium25grey =>
      mediumPx25.grey;

  TextStyle get medium25lightgray =>
      mediumPx25.lightgray;

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

  TextStyle get medium26grey =>
      mediumPx26.grey;

  TextStyle get medium26lightgray =>
      mediumPx26.lightgray;

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

  TextStyle get medium28grey =>
      mediumPx28.grey;

  TextStyle get medium28lightgray =>
      mediumPx28.lightgray;

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

  TextStyle get medium30grey =>
      mediumPx30.grey;

  TextStyle get medium30lightgray =>
      mediumPx30.lightgray;

  TextStyle get medium38primary =>
      mediumPx38.primary;

  TextStyle get medium38primaryLight =>
      mediumPx38.primaryLight;

  TextStyle get medium38primaryDark =>
      mediumPx38.primaryDark;

  TextStyle get medium38textMain =>
      mediumPx38.textMain;

  TextStyle get medium38textSecondary =>
      mediumPx38.textSecondary;

  TextStyle get medium38textSub =>
      mediumPx38.textSub;

  TextStyle get medium38textPlaceholder =>
      mediumPx38.textPlaceholder;

  TextStyle get medium38textNavigation =>
      mediumPx38.textNavigation;

  TextStyle get medium38textDark =>
      mediumPx38.textDark;

  TextStyle get medium38danger =>
      mediumPx38.danger;

  TextStyle get medium38rating =>
      mediumPx38.rating;

  TextStyle get medium38white =>
      mediumPx38.white;

  TextStyle get medium38black =>
      mediumPx38.black;

  TextStyle get medium38grey =>
      mediumPx38.grey;

  TextStyle get medium38lightgray =>
      mediumPx38.lightgray;

  TextStyle get semiBold7primary =>
      semiBoldPx7.primary;

  TextStyle get semiBold7primaryLight =>
      semiBoldPx7.primaryLight;

  TextStyle get semiBold7primaryDark =>
      semiBoldPx7.primaryDark;

  TextStyle get semiBold7textMain =>
      semiBoldPx7.textMain;

  TextStyle get semiBold7textSecondary =>
      semiBoldPx7.textSecondary;

  TextStyle get semiBold7textSub =>
      semiBoldPx7.textSub;

  TextStyle get semiBold7textPlaceholder =>
      semiBoldPx7.textPlaceholder;

  TextStyle get semiBold7textNavigation =>
      semiBoldPx7.textNavigation;

  TextStyle get semiBold7textDark =>
      semiBoldPx7.textDark;

  TextStyle get semiBold7danger =>
      semiBoldPx7.danger;

  TextStyle get semiBold7rating =>
      semiBoldPx7.rating;

  TextStyle get semiBold7white =>
      semiBoldPx7.white;

  TextStyle get semiBold7black =>
      semiBoldPx7.black;

  TextStyle get semiBold7grey =>
      semiBoldPx7.grey;

  TextStyle get semiBold7lightgray =>
      semiBoldPx7.lightgray;

  TextStyle get semiBold9primary =>
      semiBoldPx9.primary;

  TextStyle get semiBold9primaryLight =>
      semiBoldPx9.primaryLight;

  TextStyle get semiBold9primaryDark =>
      semiBoldPx9.primaryDark;

  TextStyle get semiBold9textMain =>
      semiBoldPx9.textMain;

  TextStyle get semiBold9textSecondary =>
      semiBoldPx9.textSecondary;

  TextStyle get semiBold9textSub =>
      semiBoldPx9.textSub;

  TextStyle get semiBold9textPlaceholder =>
      semiBoldPx9.textPlaceholder;

  TextStyle get semiBold9textNavigation =>
      semiBoldPx9.textNavigation;

  TextStyle get semiBold9textDark =>
      semiBoldPx9.textDark;

  TextStyle get semiBold9danger =>
      semiBoldPx9.danger;

  TextStyle get semiBold9rating =>
      semiBoldPx9.rating;

  TextStyle get semiBold9white =>
      semiBoldPx9.white;

  TextStyle get semiBold9black =>
      semiBoldPx9.black;

  TextStyle get semiBold9grey =>
      semiBoldPx9.grey;

  TextStyle get semiBold9lightgray =>
      semiBoldPx9.lightgray;

  TextStyle get semiBold10primary =>
      semiBoldPx10.primary;

  TextStyle get semiBold10primaryLight =>
      semiBoldPx10.primaryLight;

  TextStyle get semiBold10primaryDark =>
      semiBoldPx10.primaryDark;

  TextStyle get semiBold10textMain =>
      semiBoldPx10.textMain;

  TextStyle get semiBold10textSecondary =>
      semiBoldPx10.textSecondary;

  TextStyle get semiBold10textSub =>
      semiBoldPx10.textSub;

  TextStyle get semiBold10textPlaceholder =>
      semiBoldPx10.textPlaceholder;

  TextStyle get semiBold10textNavigation =>
      semiBoldPx10.textNavigation;

  TextStyle get semiBold10textDark =>
      semiBoldPx10.textDark;

  TextStyle get semiBold10danger =>
      semiBoldPx10.danger;

  TextStyle get semiBold10rating =>
      semiBoldPx10.rating;

  TextStyle get semiBold10white =>
      semiBoldPx10.white;

  TextStyle get semiBold10black =>
      semiBoldPx10.black;

  TextStyle get semiBold10grey =>
      semiBoldPx10.grey;

  TextStyle get semiBold10lightgray =>
      semiBoldPx10.lightgray;

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

  TextStyle get semiBold11grey =>
      semiBoldPx11.grey;

  TextStyle get semiBold11lightgray =>
      semiBoldPx11.lightgray;

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

  TextStyle get semiBold12grey =>
      semiBoldPx12.grey;

  TextStyle get semiBold12lightgray =>
      semiBoldPx12.lightgray;

  TextStyle get semiBold13primary =>
      semiBoldPx13.primary;

  TextStyle get semiBold13primaryLight =>
      semiBoldPx13.primaryLight;

  TextStyle get semiBold13primaryDark =>
      semiBoldPx13.primaryDark;

  TextStyle get semiBold13textMain =>
      semiBoldPx13.textMain;

  TextStyle get semiBold13textSecondary =>
      semiBoldPx13.textSecondary;

  TextStyle get semiBold13textSub =>
      semiBoldPx13.textSub;

  TextStyle get semiBold13textPlaceholder =>
      semiBoldPx13.textPlaceholder;

  TextStyle get semiBold13textNavigation =>
      semiBoldPx13.textNavigation;

  TextStyle get semiBold13textDark =>
      semiBoldPx13.textDark;

  TextStyle get semiBold13danger =>
      semiBoldPx13.danger;

  TextStyle get semiBold13rating =>
      semiBoldPx13.rating;

  TextStyle get semiBold13white =>
      semiBoldPx13.white;

  TextStyle get semiBold13black =>
      semiBoldPx13.black;

  TextStyle get semiBold13grey =>
      semiBoldPx13.grey;

  TextStyle get semiBold13lightgray =>
      semiBoldPx13.lightgray;

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

  TextStyle get semiBold14grey =>
      semiBoldPx14.grey;

  TextStyle get semiBold14lightgray =>
      semiBoldPx14.lightgray;

  TextStyle get semiBold15primary =>
      semiBoldPx15.primary;

  TextStyle get semiBold15primaryLight =>
      semiBoldPx15.primaryLight;

  TextStyle get semiBold15primaryDark =>
      semiBoldPx15.primaryDark;

  TextStyle get semiBold15textMain =>
      semiBoldPx15.textMain;

  TextStyle get semiBold15textSecondary =>
      semiBoldPx15.textSecondary;

  TextStyle get semiBold15textSub =>
      semiBoldPx15.textSub;

  TextStyle get semiBold15textPlaceholder =>
      semiBoldPx15.textPlaceholder;

  TextStyle get semiBold15textNavigation =>
      semiBoldPx15.textNavigation;

  TextStyle get semiBold15textDark =>
      semiBoldPx15.textDark;

  TextStyle get semiBold15danger =>
      semiBoldPx15.danger;

  TextStyle get semiBold15rating =>
      semiBoldPx15.rating;

  TextStyle get semiBold15white =>
      semiBoldPx15.white;

  TextStyle get semiBold15black =>
      semiBoldPx15.black;

  TextStyle get semiBold15grey =>
      semiBoldPx15.grey;

  TextStyle get semiBold15lightgray =>
      semiBoldPx15.lightgray;

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

  TextStyle get semiBold16grey =>
      semiBoldPx16.grey;

  TextStyle get semiBold16lightgray =>
      semiBoldPx16.lightgray;

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

  TextStyle get semiBold18grey =>
      semiBoldPx18.grey;

  TextStyle get semiBold18lightgray =>
      semiBoldPx18.lightgray;

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

  TextStyle get semiBold20grey =>
      semiBoldPx20.grey;

  TextStyle get semiBold20lightgray =>
      semiBoldPx20.lightgray;

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

  TextStyle get semiBold22grey =>
      semiBoldPx22.grey;

  TextStyle get semiBold22lightgray =>
      semiBoldPx22.lightgray;

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

  TextStyle get semiBold24grey =>
      semiBoldPx24.grey;

  TextStyle get semiBold24lightgray =>
      semiBoldPx24.lightgray;

  TextStyle get semiBold25primary =>
      semiBoldPx25.primary;

  TextStyle get semiBold25primaryLight =>
      semiBoldPx25.primaryLight;

  TextStyle get semiBold25primaryDark =>
      semiBoldPx25.primaryDark;

  TextStyle get semiBold25textMain =>
      semiBoldPx25.textMain;

  TextStyle get semiBold25textSecondary =>
      semiBoldPx25.textSecondary;

  TextStyle get semiBold25textSub =>
      semiBoldPx25.textSub;

  TextStyle get semiBold25textPlaceholder =>
      semiBoldPx25.textPlaceholder;

  TextStyle get semiBold25textNavigation =>
      semiBoldPx25.textNavigation;

  TextStyle get semiBold25textDark =>
      semiBoldPx25.textDark;

  TextStyle get semiBold25danger =>
      semiBoldPx25.danger;

  TextStyle get semiBold25rating =>
      semiBoldPx25.rating;

  TextStyle get semiBold25white =>
      semiBoldPx25.white;

  TextStyle get semiBold25black =>
      semiBoldPx25.black;

  TextStyle get semiBold25grey =>
      semiBoldPx25.grey;

  TextStyle get semiBold25lightgray =>
      semiBoldPx25.lightgray;

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

  TextStyle get semiBold26grey =>
      semiBoldPx26.grey;

  TextStyle get semiBold26lightgray =>
      semiBoldPx26.lightgray;

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

  TextStyle get semiBold28grey =>
      semiBoldPx28.grey;

  TextStyle get semiBold28lightgray =>
      semiBoldPx28.lightgray;

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

  TextStyle get semiBold30grey =>
      semiBoldPx30.grey;

  TextStyle get semiBold30lightgray =>
      semiBoldPx30.lightgray;

  TextStyle get semiBold38primary =>
      semiBoldPx38.primary;

  TextStyle get semiBold38primaryLight =>
      semiBoldPx38.primaryLight;

  TextStyle get semiBold38primaryDark =>
      semiBoldPx38.primaryDark;

  TextStyle get semiBold38textMain =>
      semiBoldPx38.textMain;

  TextStyle get semiBold38textSecondary =>
      semiBoldPx38.textSecondary;

  TextStyle get semiBold38textSub =>
      semiBoldPx38.textSub;

  TextStyle get semiBold38textPlaceholder =>
      semiBoldPx38.textPlaceholder;

  TextStyle get semiBold38textNavigation =>
      semiBoldPx38.textNavigation;

  TextStyle get semiBold38textDark =>
      semiBoldPx38.textDark;

  TextStyle get semiBold38danger =>
      semiBoldPx38.danger;

  TextStyle get semiBold38rating =>
      semiBoldPx38.rating;

  TextStyle get semiBold38white =>
      semiBoldPx38.white;

  TextStyle get semiBold38black =>
      semiBoldPx38.black;

  TextStyle get semiBold38grey =>
      semiBoldPx38.grey;

  TextStyle get semiBold38lightgray =>
      semiBoldPx38.lightgray;

  TextStyle get bold7primary =>
      boldPx7.primary;

  TextStyle get bold7primaryLight =>
      boldPx7.primaryLight;

  TextStyle get bold7primaryDark =>
      boldPx7.primaryDark;

  TextStyle get bold7textMain =>
      boldPx7.textMain;

  TextStyle get bold7textSecondary =>
      boldPx7.textSecondary;

  TextStyle get bold7textSub =>
      boldPx7.textSub;

  TextStyle get bold7textPlaceholder =>
      boldPx7.textPlaceholder;

  TextStyle get bold7textNavigation =>
      boldPx7.textNavigation;

  TextStyle get bold7textDark =>
      boldPx7.textDark;

  TextStyle get bold7danger =>
      boldPx7.danger;

  TextStyle get bold7rating =>
      boldPx7.rating;

  TextStyle get bold7white =>
      boldPx7.white;

  TextStyle get bold7black =>
      boldPx7.black;

  TextStyle get bold7grey =>
      boldPx7.grey;

  TextStyle get bold7lightgray =>
      boldPx7.lightgray;

  TextStyle get bold9primary =>
      boldPx9.primary;

  TextStyle get bold9primaryLight =>
      boldPx9.primaryLight;

  TextStyle get bold9primaryDark =>
      boldPx9.primaryDark;

  TextStyle get bold9textMain =>
      boldPx9.textMain;

  TextStyle get bold9textSecondary =>
      boldPx9.textSecondary;

  TextStyle get bold9textSub =>
      boldPx9.textSub;

  TextStyle get bold9textPlaceholder =>
      boldPx9.textPlaceholder;

  TextStyle get bold9textNavigation =>
      boldPx9.textNavigation;

  TextStyle get bold9textDark =>
      boldPx9.textDark;

  TextStyle get bold9danger =>
      boldPx9.danger;

  TextStyle get bold9rating =>
      boldPx9.rating;

  TextStyle get bold9white =>
      boldPx9.white;

  TextStyle get bold9black =>
      boldPx9.black;

  TextStyle get bold9grey =>
      boldPx9.grey;

  TextStyle get bold9lightgray =>
      boldPx9.lightgray;

  TextStyle get bold10primary =>
      boldPx10.primary;

  TextStyle get bold10primaryLight =>
      boldPx10.primaryLight;

  TextStyle get bold10primaryDark =>
      boldPx10.primaryDark;

  TextStyle get bold10textMain =>
      boldPx10.textMain;

  TextStyle get bold10textSecondary =>
      boldPx10.textSecondary;

  TextStyle get bold10textSub =>
      boldPx10.textSub;

  TextStyle get bold10textPlaceholder =>
      boldPx10.textPlaceholder;

  TextStyle get bold10textNavigation =>
      boldPx10.textNavigation;

  TextStyle get bold10textDark =>
      boldPx10.textDark;

  TextStyle get bold10danger =>
      boldPx10.danger;

  TextStyle get bold10rating =>
      boldPx10.rating;

  TextStyle get bold10white =>
      boldPx10.white;

  TextStyle get bold10black =>
      boldPx10.black;

  TextStyle get bold10grey =>
      boldPx10.grey;

  TextStyle get bold10lightgray =>
      boldPx10.lightgray;

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

  TextStyle get bold11grey =>
      boldPx11.grey;

  TextStyle get bold11lightgray =>
      boldPx11.lightgray;

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

  TextStyle get bold12grey =>
      boldPx12.grey;

  TextStyle get bold12lightgray =>
      boldPx12.lightgray;

  TextStyle get bold13primary =>
      boldPx13.primary;

  TextStyle get bold13primaryLight =>
      boldPx13.primaryLight;

  TextStyle get bold13primaryDark =>
      boldPx13.primaryDark;

  TextStyle get bold13textMain =>
      boldPx13.textMain;

  TextStyle get bold13textSecondary =>
      boldPx13.textSecondary;

  TextStyle get bold13textSub =>
      boldPx13.textSub;

  TextStyle get bold13textPlaceholder =>
      boldPx13.textPlaceholder;

  TextStyle get bold13textNavigation =>
      boldPx13.textNavigation;

  TextStyle get bold13textDark =>
      boldPx13.textDark;

  TextStyle get bold13danger =>
      boldPx13.danger;

  TextStyle get bold13rating =>
      boldPx13.rating;

  TextStyle get bold13white =>
      boldPx13.white;

  TextStyle get bold13black =>
      boldPx13.black;

  TextStyle get bold13grey =>
      boldPx13.grey;

  TextStyle get bold13lightgray =>
      boldPx13.lightgray;

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

  TextStyle get bold14grey =>
      boldPx14.grey;

  TextStyle get bold14lightgray =>
      boldPx14.lightgray;

  TextStyle get bold15primary =>
      boldPx15.primary;

  TextStyle get bold15primaryLight =>
      boldPx15.primaryLight;

  TextStyle get bold15primaryDark =>
      boldPx15.primaryDark;

  TextStyle get bold15textMain =>
      boldPx15.textMain;

  TextStyle get bold15textSecondary =>
      boldPx15.textSecondary;

  TextStyle get bold15textSub =>
      boldPx15.textSub;

  TextStyle get bold15textPlaceholder =>
      boldPx15.textPlaceholder;

  TextStyle get bold15textNavigation =>
      boldPx15.textNavigation;

  TextStyle get bold15textDark =>
      boldPx15.textDark;

  TextStyle get bold15danger =>
      boldPx15.danger;

  TextStyle get bold15rating =>
      boldPx15.rating;

  TextStyle get bold15white =>
      boldPx15.white;

  TextStyle get bold15black =>
      boldPx15.black;

  TextStyle get bold15grey =>
      boldPx15.grey;

  TextStyle get bold15lightgray =>
      boldPx15.lightgray;

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

  TextStyle get bold16grey =>
      boldPx16.grey;

  TextStyle get bold16lightgray =>
      boldPx16.lightgray;

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

  TextStyle get bold18grey =>
      boldPx18.grey;

  TextStyle get bold18lightgray =>
      boldPx18.lightgray;

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

  TextStyle get bold20grey =>
      boldPx20.grey;

  TextStyle get bold20lightgray =>
      boldPx20.lightgray;

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

  TextStyle get bold22grey =>
      boldPx22.grey;

  TextStyle get bold22lightgray =>
      boldPx22.lightgray;

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

  TextStyle get bold24grey =>
      boldPx24.grey;

  TextStyle get bold24lightgray =>
      boldPx24.lightgray;

  TextStyle get bold25primary =>
      boldPx25.primary;

  TextStyle get bold25primaryLight =>
      boldPx25.primaryLight;

  TextStyle get bold25primaryDark =>
      boldPx25.primaryDark;

  TextStyle get bold25textMain =>
      boldPx25.textMain;

  TextStyle get bold25textSecondary =>
      boldPx25.textSecondary;

  TextStyle get bold25textSub =>
      boldPx25.textSub;

  TextStyle get bold25textPlaceholder =>
      boldPx25.textPlaceholder;

  TextStyle get bold25textNavigation =>
      boldPx25.textNavigation;

  TextStyle get bold25textDark =>
      boldPx25.textDark;

  TextStyle get bold25danger =>
      boldPx25.danger;

  TextStyle get bold25rating =>
      boldPx25.rating;

  TextStyle get bold25white =>
      boldPx25.white;

  TextStyle get bold25black =>
      boldPx25.black;

  TextStyle get bold25grey =>
      boldPx25.grey;

  TextStyle get bold25lightgray =>
      boldPx25.lightgray;

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

  TextStyle get bold26grey =>
      boldPx26.grey;

  TextStyle get bold26lightgray =>
      boldPx26.lightgray;

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

  TextStyle get bold28grey =>
      boldPx28.grey;

  TextStyle get bold28lightgray =>
      boldPx28.lightgray;

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

  TextStyle get bold30grey =>
      boldPx30.grey;

  TextStyle get bold30lightgray =>
      boldPx30.lightgray;

  TextStyle get bold38primary =>
      boldPx38.primary;

  TextStyle get bold38primaryLight =>
      boldPx38.primaryLight;

  TextStyle get bold38primaryDark =>
      boldPx38.primaryDark;

  TextStyle get bold38textMain =>
      boldPx38.textMain;

  TextStyle get bold38textSecondary =>
      boldPx38.textSecondary;

  TextStyle get bold38textSub =>
      boldPx38.textSub;

  TextStyle get bold38textPlaceholder =>
      boldPx38.textPlaceholder;

  TextStyle get bold38textNavigation =>
      boldPx38.textNavigation;

  TextStyle get bold38textDark =>
      boldPx38.textDark;

  TextStyle get bold38danger =>
      boldPx38.danger;

  TextStyle get bold38rating =>
      boldPx38.rating;

  TextStyle get bold38white =>
      boldPx38.white;

  TextStyle get bold38black =>
      boldPx38.black;

  TextStyle get bold38grey =>
      boldPx38.grey;

  TextStyle get bold38lightgray =>
      boldPx38.lightgray;

}
