import 'package:flutter/material.dart';

import '../../core/utilities/constants.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: Constants.fontFamily,
    colorScheme: AppColorScheme.lightColorScheme,
    scaffoldBackgroundColor: AppColorScheme.lightColorScheme.background,
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,
  );
}
