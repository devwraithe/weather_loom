import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:open_weather/src/config/theme/app_text_theme.dart';

import '../../core/constants/imports_barrel.dart';

class HourForecast extends StatefulWidget {
  const HourForecast({
    super.key,
    required this.temperature,
  });

  final int temperature;

  @override
  State<HourForecast> createState() => _HourForecastState();
}

class _HourForecastState extends State<HourForecast> {
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
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "24-HOUR FORECAST",
              style: textTheme.labelMedium?.copyWith(
                color: Colors.grey,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 18),
          BlocBuilder<ForecastBloc, ForecastState>(
              builder: (context, state) => state is ForecastIsLoading
                  ? const DataLoader(height: 0.2)
                  : state is ForecastHasData
                      ? SizedBox(
                          height: 100,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 30),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.result.length,
                            itemBuilder: (context, index) {
                              final hour = state.result[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('ha').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        hour.time * 1000,
                                        isUtc: false,
                                      ),
                                    ),
                                    style: textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    // imageUrl: ApiUrls.weatherIcon(
                                    //   hour.icon,
                                    // ),
                                    widget.temperature < 20
                                        ? 'assets/icons/cloud.png'
                                        : 'assets/icons/night-rain.png',

                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    width: 36,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${state.result[index].temp.round().toString()}\u{00B0}c",
                                    style: textTheme.bodyMedium,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : state is ForecastHasError
                          ? const ErrorResponse(
                              height: 0.2,
                              title: "24 Hour Forecast is Unavailable!")
                          : const ErrorResponse(
                              height: 0.2,
                              title: "Preparing 24 Hour Forecast...")),
        ],
      ),
    );
  }
}
