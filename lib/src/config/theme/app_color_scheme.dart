import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppColorScheme {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.black,
    secondary: AppColors.white,
    tertiary: AppColors.grey,
    background: AppColors.white,
  );
}
