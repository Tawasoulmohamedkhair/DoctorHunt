import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  // حسب تصميم 375 x 812
  double w(double value) => width * value / 375;
  double h(double value) => height * value / 812;
  double sp(double value) => (width * value / 375).clamp(11, 24);
  double r(double value) => width * value / 375;

  // اختياري
  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;
}
