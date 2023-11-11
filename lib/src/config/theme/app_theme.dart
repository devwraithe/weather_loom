import 'package:flutter/material.dart';

import '../../core/utilities/constants.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static final light = ThemeData(
    fontFamily: Constants.fontFamily,
    colorScheme: AppColorScheme.light,
    scaffoldBackgroundColor: AppColorScheme.light.background,
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,
  );

  static final dark = ThemeData(
    fontFamily: Constants.fontFamily,
    colorScheme: AppColorScheme.dark,
    scaffoldBackgroundColor: AppColorScheme.dark.background,
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,
  );
}
