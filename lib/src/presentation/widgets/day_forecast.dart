import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_text_theme.dart';
import '../../core/constants/imports_barrel.dart';

class DayForecast extends StatefulWidget {
  const DayForecast({super.key});

  @override
  State<DayForecast> createState() => _DayForecastState();
}

class _DayForecastState extends State<DayForecast> {
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
      child: // 16 Days Forecast
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "7 Days Forecast",
              style: textTheme.subtitle2?.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 18),
          BlocBuilder<DailyForecastBloc, DailyForecastState>(
              builder: (context, state) => state is DailyForecastIsLoading
                  ? const DataLoader(height: 0.2)
                  : state is DailyForecastHasData
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            children: [
                              for (var day in state.result)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          DateFormat('MMMM d,EEEE').format(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          day.dailyTime
                                                                  .toInt() *
                                                              1000,
                                                          isUtc: false)) ==
                                                  DateFormat('MMMM d,EEEE')
                                                      .format(DateTime.now())
                                              ? "Today"
                                              : DateFormat.EEEE().format(
                                                  DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          day.dailyTime
                                                                  .toInt() *
                                                              1000,
                                                          isUtc: false),
                                                ),
                                          style: textTheme.bodyText1?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                          child: Image.network(
                                            ApiUrls.weatherIcon(
                                              day.dailyIcon,
                                            ),
                                            width: 36,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "${day.dailyMinTemp.round().toString()}\u{00B0}c to ${day.dailyMaxTemp.round().toString()}\u{00B0}c",
                                          textAlign: TextAlign.end,
                                          style: textTheme.bodyText1?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        )
                      : state is DailyForecastHasError
                          ? const ErrorResponse(
                              height: 0.2,
                              title: "7 Days Forecast is Unavailable!")
                          : const ErrorResponse(
                              height: 0.2,
                              title: "Preparing 7 Days Forecast...")),
        ],
      ),
    );
  }
}
