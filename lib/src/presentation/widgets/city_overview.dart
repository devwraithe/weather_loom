import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:open_weather/src/config/theme/app_text_theme.dart';

import '../../config/theme/app_colors.dart';
import '../../core/constants/imports_barrel.dart';
import '../../core/utilities/constants.dart';
import '../../core/utilities/helpers/current_date_helper.dart';

class CityOverview extends StatelessWidget {
  const CityOverview({
    super.key,
    required this.condition,
    required this.temp,
    required this.location,
    this.onPressed,
  });

  final String condition, temp, location;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const textTheme = AppTextTheme.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 60, top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
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
            ),
          ),
          const SizedBox(height: 40),
          Text(
            location,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Text(
            "$temp${Constants.deg}",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 4),
          Text(
            capitalizeLetter(condition),
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Text(
            currentDate(),
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
