import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // -----------------------------------------------------------------------
      // General
      // -----------------------------------------------------------------------
      fontFamily: 'Rubik',
      scaffoldBackgroundColor: AppColors.white,

      // -----------------------------------------------------------------------
      // Color Scheme
      // -----------------------------------------------------------------------
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        error: AppColors.danger,
        surface: AppColors.white,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.textMain,
        onError: AppColors.white,
      ),

      // -----------------------------------------------------------------------
      // App Bar
      // -----------------------------------------------------------------------
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textMain,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),

      // -----------------------------------------------------------------------
      // Text Theme
      // -----------------------------------------------------------------------
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w700,
          color: AppColors.textMain,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w700,
          color: AppColors.textMain,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),

        headlineLarge: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w700,
          color: AppColors.textMain,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),

        titleLarge: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          color: AppColors.textMain,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          color: AppColors.textMain,
        ),

        bodyLarge: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          color: AppColors.textMain,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          color: AppColors.textSub,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          color: AppColors.textPlaceholder,
        ),

        labelLarge: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          color: AppColors.textMain,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          color: AppColors.textSub,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          color: AppColors.textPlaceholder,
        ),
      ),

      // -----------------------------------------------------------------------
      // Input Decoration
      // -----------------------------------------------------------------------
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,

        hintStyle: const TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          color: AppColors.textPlaceholder,
        ),

        labelStyle: const TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          color: AppColors.textSub,
        ),

        floatingLabelStyle: const TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.textPlaceholder),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.danger),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // -----------------------------------------------------------------------
      // Elevated Button
      // -----------------------------------------------------------------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          textStyle: const TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // -----------------------------------------------------------------------
      // Text Button
      // -----------------------------------------------------------------------
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,

          textStyle: const TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // -----------------------------------------------------------------------
      // Outlined Button
      // -----------------------------------------------------------------------
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,

          side: const BorderSide(color: AppColors.primary),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          textStyle: const TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // -----------------------------------------------------------------------
      // Bottom Navigation Bar
      // -----------------------------------------------------------------------
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.primaryLight,
      ),

      // -----------------------------------------------------------------------
      // Bottom Sheet
      // -----------------------------------------------------------------------
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        modalBackgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),

      // -----------------------------------------------------------------------
      // Divider
      // -----------------------------------------------------------------------
      dividerTheme: const DividerThemeData(
        color: AppColors.textPlaceholder,
        thickness: 1,
        space: 1,
      ),

      // -----------------------------------------------------------------------
      // Icon
      // -----------------------------------------------------------------------
      iconTheme: const IconThemeData(color: AppColors.textMain),

      // -----------------------------------------------------------------------
      // Snack Bar
      // -----------------------------------------------------------------------
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textMain,
        behavior: SnackBarBehavior.floating,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        contentTextStyle: const TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
    );
  }
}
