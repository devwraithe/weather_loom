import 'package:flutter/material.dart';

class UiHelpers {
  // For input-related widgets
  static inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
