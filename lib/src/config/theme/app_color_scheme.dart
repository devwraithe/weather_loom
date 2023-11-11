import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppColorScheme {
  static const light = ColorScheme.light(
    primary: AppColors.white,
    secondary: AppColors.black,
    background: Colors.white,
  );

  static const dark = ColorScheme.dark(
    primary: AppColors.black,
    secondary: AppColors.white,
    background: AppColors.black,
  );
}
