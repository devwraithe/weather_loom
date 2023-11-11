import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:open_weather/src/config/theme/app_text_theme.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  final String title, subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const textTheme = AppTextTheme.textTheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(TablerIcons.map_pin),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
