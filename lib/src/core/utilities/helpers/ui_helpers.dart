import 'package:flutter/material.dart';
import 'package:open_weather/src/config/theme/app_text_theme.dart';

class UiHelpers {
  // For input-related widgets
  static inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  static attributeText(String key, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key.toString(),
          style: AppTextTheme.textTheme.bodyMedium,
        ),
        Text(
          value.toString(),
          style: AppTextTheme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
