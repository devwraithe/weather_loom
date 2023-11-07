import 'package:flutter/material.dart';

Color tempColor(int temperature) {
  if (temperature < 0) {
    return const Color(0xFF0000FF); // Deep blue for extremely cold temperatures
  } else if (temperature >= 0 && temperature < 10) {
    return const Color(0xFF3498DB); // Light blue for very cold temperatures
  } else if (temperature >= 10 && temperature < 20) {
    return const Color(0xFF2ECC71); // Green for cold to moderate temperatures
  } else if (temperature >= 20 && temperature < 30) {
    return const Color(0xFFE67E22); // Orange for warm temperatures
  } else if (temperature >= 30) {
    return const Color(0xFFE74C3C); // Red for hot temperatures
  } else {
    return const Color(0xFF808080); // Gray for unknown or invalid temperature
  }
}
