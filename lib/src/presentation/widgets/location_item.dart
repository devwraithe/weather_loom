import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:open_weather/src/config/theme/app_text_theme.dart';
import 'package:open_weather/src/core/constants/imports_barrel.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    const textTheme = AppTextTheme.textTheme;

    return GestureDetector(
      onTap: () async {
        context.read<WeatherBloc>().add(OnCityChanged(title));
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(TablerIcons.map_pin),
            const SizedBox(width: 16),
            Container(
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
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
