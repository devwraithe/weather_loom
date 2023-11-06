import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../config/theme/app_colors.dart';
import '../../core/constants/imports_barrel.dart';

class WeatherAttributes extends StatefulWidget {
  const WeatherAttributes({super.key});

  @override
  State<WeatherAttributes> createState() => _WeatherAttributesState();
}

class _WeatherAttributesState extends State<WeatherAttributes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) => state is WeatherLoading
                ? const DataLoader(height: 0.4)
                : state is WeatherHasData
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Attribute(
                                title: "WIND",
                                value:
                                    "${state.result.windSpeed.toString()} MPH",
                              ),
                              Attribute(
                                title: "HUMIDITY",
                                value: "${state.result.humidity.toString()}%",
                              ),
                              Attribute(
                                title: "PRESSURE",
                                value:
                                    "${state.result.pressure.toString()} inHg",
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Attribute(
                                title: "SUNRISE",
                                value: DateFormat('h:mma').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    state.result.sunrise.toInt() * 1000,
                                    isUtc: false,
                                  ),
                                ),
                              ),
                              Attribute(
                                title: "SUNSET",
                                value: DateFormat('h:mma').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    state.result.sunset.toInt() * 1000,
                                    isUtc: false,
                                  ),
                                ),
                              ),
                              Attribute(
                                title: "FEELS LIKE",
                                value:
                                    "${state.result.feelsLike.round().toString()}\u{00B0}c",
                              ),
                            ],
                          ),
                          const SizedBox(height: 26),
                        ],
                      )
                    : state is ForecastHasError
                        ? const ErrorResponse(
                            height: 0.4, title: "Attributes are Unavailable!")
                        : const ErrorResponse(
                            height: 0.4, title: "Preparing Attributes...")),
      ),
    );
  }
}
