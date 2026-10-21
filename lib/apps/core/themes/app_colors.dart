import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary
  static const Color primary = Color(0xFF0EBE7F);
  static const Color primaryLight = Color(0xFF07D9AD);
  static const Color primaryDark = Color(0xFF006C49);

  // Text
  static const Color textMain = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF333333);
  static const Color textSub = Color(0xFF677294);
  static const Color textPlaceholder = Color(0xFF7B8490);
  static const Color textNavigation = Color(0xFF858EA9);
  static const Color textselected = Color(0xffD5E6E1);
  static const Color textDark = Color(0xFF17202A);

  // Status
  static const Color danger = Color(0xFFFF0000);

  // Rating
  static const Color rating = Color(0xFFF6D060);

  // Common
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color cyan = Color(0xFF0EBE7E);
  static const Color yellow = Color(0xFFFE7F44);
  static const Color moderate = Color(0xFF2753F3);
  static const Color red = Color(0xFFBA1A1A);
  static const Color redaura = Color(0xFFFF484C);
  static const Color pink = Color(0xffFFDAD6);
  static const Color grey = Color(0xff777EA5);
  static const Color lightgrey = Color(0xffE8F0E8);
  static const Color rockblue = Color(0xff94A3B8);
  static const Color darkgray = Color(0xffC4C4C4);
  static const Color borderunselected = Color(0xffE6ECEA);
  static const Color lightGreys = Color(0xffE8F0E8);
  static const Color success = Color(0xFF10C98B);
  static const Color successDark = Color(0xFF078B5A);
  static const Color successGreen = Color(0xFF219653);
  static const Color textDeep = Color(0xFF161D19);
  static const Color textMuted = Color(0xFF52625E);
  static const Color surfaceMint = Color(0xFFE8F8F3);
  static const Color surfaceGreen = Color(0xFFF3FBF4);
  static const Color surfaceGreenAlt = Color(0xFFE5EEE8);
  static const Color surfaceSlate = Color(0xFFF1F5F9);
  static const Color surfaceRed = Color(0xFFFFEEEE);
  static const Color borderMuted = Color(0x66BBCABF);
  static const Color dangerSurface = Color(0x4CFFDAD6);
  static const Color shadow = Color(0x0C000000);
  static const Color slate = Color(0xFF1E293B);
  static const Color slateBlue = Color(0xFF94A3B8);
  static const Color dangerMuted = Color(0xFFD9534F);
  static const drawerTop = Color(0xFF6F7FA1);
  static const drawerBottom = Color(0xFF536184);
  static const drawerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [drawerTop, drawerBottom],
  );
}
