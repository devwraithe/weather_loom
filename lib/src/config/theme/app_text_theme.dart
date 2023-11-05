import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppTextTheme {
  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w500,
      height: 1.1,
    ),
    displayMedium: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    // subtitles
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 13,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    ),
  );
}
