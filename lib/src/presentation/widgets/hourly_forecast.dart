import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/domain/entities/hourly_forecast.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_text_theme.dart';
import '../../core/constants/api_paths.dart';

class NewHourlyForecast extends StatefulWidget {
  const NewHourlyForecast({
    super.key,
    required this.hourly,
  });

  final List<HourlyForecast> hourly;

  @override
  State<NewHourlyForecast> createState() => _NewHourlyForecastState();
}

class _NewHourlyForecastState extends State<NewHourlyForecast> {
  @override
  Widget build(BuildContext context) {
    const textTheme = AppTextTheme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "24-HOURS FORECAST",
              style: textTheme.labelMedium?.copyWith(
                color: Colors.grey,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 100,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 30),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.hourly.length,
              itemBuilder: (context, index) {
                final hour = widget.hourly[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('ha').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          hour.time.toInt() * 1000,
                          isUtc: false,
                        ),
                      ),
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    CachedNetworkImage(
                      imageUrl: ApiUrls.weatherIcon(
                        hour.icon,
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      width: 36,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${hour.temp.toString()}\u{00B0}c",
                      style: textTheme.bodyMedium,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
