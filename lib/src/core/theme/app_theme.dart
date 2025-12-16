import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static ThemeData buildAppTheme({required BuildContext context}) {
    return ThemeData(
      fontFamily: 'Inter',
      primarySwatch: Colors.blue,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.secondary,
      canvasColor: AppColors.secondary,
      iconTheme: const IconThemeData(color: AppColors.primary, size: 24),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
        shadowColor: Colors.transparent,
        surfaceTintColor: AppColors.secondary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: AppColors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelStyle: TextStyle(
          color: AppColors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ).copyWith(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.black),
        ),
        //contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
      textTheme: _buildTextTheme(),
    );
  }



  static TextTheme _buildTextTheme() {
    return TextTheme(
      bodyLarge: _buildTextStyle( // Used in Design
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      bodyMedium: _buildTextStyle( // Used in Design
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      bodySmall: _buildTextStyle( // Used in Design
        color: AppColors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      displayLarge: _buildTextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      displayMedium: _buildTextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      displaySmall: _buildTextStyle(
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      headlineLarge: _buildTextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      // headlineMedium: _buildTextStyle(
      //   color: AppColors.black,
      //   fontSize: 26,
      //   fontWeight: FontWeight.w600,
      //   letterSpacing: 0,
      //   fontFamily: 'Poppins',
      // ),
      headlineSmall: _buildTextStyle( // Used in Design
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      labelLarge: _buildTextStyle( // Used in Design
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      labelMedium: _buildTextStyle( // Used in Design
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      labelSmall: _buildTextStyle( // Used in Design
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        fontFamily: 'Inter',
      ),
      // titleLarge: _buildTextStyle( // Used in Design
      //   color: AppColors.black,
      //   fontSize: 24,
      //   fontWeight: FontWeight.w500,
      //   letterSpacing: 0,
      //   fontFamily: 'Poppins',
      // ),
      // titleMedium: _buildTextStyle( // Used in Design
      //   color: AppColors.black,
      //   fontSize: 20,
      //   fontWeight: FontWeight.w500,
      //   letterSpacing: 0,
      //   fontFamily: 'Poppins',
      // ),
      // titleSmall: _buildTextStyle( // Used in Design
      //   color: AppColors.black,
      //   fontSize: 16,
      //   fontWeight: FontWeight.w500,
      //   letterSpacing: 0,
      //   fontFamily: 'Poppins',
      // ),
    );
  }

  static TextStyle _buildTextStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    double? letterSpacing,
    String? fontFamily,
    double? height,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      height: height,
      decoration: TextDecoration.none,
      decorationColor: color,
    );
  }

}