import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppTextTheme {
  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w500,
      height: 1.1,
      color: AppColors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    // subtitles
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
  );
}
