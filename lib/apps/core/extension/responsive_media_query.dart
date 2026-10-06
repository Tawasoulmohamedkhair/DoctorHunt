import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  // Full screen size
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  // Safe area adjusted sizes
  double get _paddingHorizontal =>
      MediaQuery.paddingOf(this).left + MediaQuery.paddingOf(this).right;
  double get _paddingVertical =>
      MediaQuery.paddingOf(this).top + MediaQuery.paddingOf(this).bottom;
  double get safeWidth => (width - _paddingHorizontal).clamp(0, width);
  double get safeHeight => (height - _paddingVertical).clamp(0, height);

  // حسب تصميم 375 x 812 (mobile Figma reference)
  // استخدم المساحات الآمنة كأساس للحسابات لتجنب قص المحتوى خلف الـ safe area
  double w(double value) => safeWidth * value / 375;
  double h(double value) => safeHeight * value / 812;

  // نصوص: احترم textScaleFactor لكن احتفظ بنفس حدود القيمة السابقة
  double sp(double value) {
    final base = safeWidth * value / 375;
    final scaled = MediaQuery.textScalerOf(this).scale(base);
    return scaled.clamp(11, 24);
  }

  double r(double value) => safeWidth * value / 375;

  // Breakpoints
  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;
}
