import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../config/theme/app_colors.dart';

class Constants {
  // String Constants
  static String socketError = "No Internet Connection";
  static String unknownError = "Something went wrong";
  static String timeoutError = "Timeout";
  static String fontFamily = 'Satoshi';
  static String passwordResetSuccess = 'Please check your inbox for a mail';
  static String deg = "\u{00B0}";

  static String emptyFlashcardsList = "No flashcards added yet!";

  // Double Constants
  static double inputRadius = 8;

  // Other Constants
  static AutovalidateMode validateMode = AutovalidateMode.onUserInteraction;
  static SizedBox prefixSpace = const SizedBox(width: 20);
  static EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 24,
  );
  static Container listIcon = Container(
    alignment: Alignment.topRight,
    margin: const EdgeInsets.only(
      right: 18,
      top: 16,
    ),
    child: const Icon(
      TablerIcons.list,
      color: AppColors.white,
      size: 26,
    ),
  );
}
