import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_text_theme.dart';
import '../../core/utilities/helpers/icons_helper.dart';

class NewDailyForecast extends StatefulWidget {
  const NewDailyForecast({
    super.key,
    required this.daily,
  });

  final List<DailyForecast> daily;

  @override
  State<NewDailyForecast> createState() => _NewDailyForecastState();
}

class _NewDailyForecastState extends State<NewDailyForecast> {
  @override
  Widget build(BuildContext context) {
    const textTheme = AppTextTheme.textTheme;

    return Container(
      height: 430,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 6),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "7-DAYS FORECAST",
            style: textTheme.labelMedium?.copyWith(
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 14),
          Column(
            children: [
              for (var day in widget.daily)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          DateFormat('MMMM d,EEEE').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          day.dailyTime.toInt() * 1000,
                                          isUtc: false)) ==
                                  DateFormat('MMMM d,EEEE')
                                      .format(DateTime.now())
                              ? "Today"
                              : DateFormat.EEEE().format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      day.dailyTime.toInt() * 1000,
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
                          child: Image.asset(
                            getCustomIcon(day.dailyIcon),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
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
        ],
      ),
    );
  }
}
