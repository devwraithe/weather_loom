import 'package:flutter/material.dart';
import 'package:open_weather/src/core/utilities/constants.dart';
import 'package:open_weather/src/core/utilities/helpers/current_date_helper.dart';

import '../../core/constants/imports_barrel.dart';

class CityOverview extends StatefulWidget {
  const CityOverview({super.key});

  @override
  State<CityOverview> createState() => _CityOverviewState();
}

class _CityOverviewState extends State<CityOverview> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const DataLoader(height: 0.4);
        }
        if (state is WeatherHasData) {
          final result = state.result;

          final num _lat = result.lat;
          final num _lon = result.lon;

          context.read<ForecastBloc>().add(HourlyForecast(_lat, _lon));
          context.read<DailyForecastBloc>().add(DailyForecast(_lat, _lon));

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result.cityName,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  "${result.temperature.round()}${Constants.deg}",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  capitalizeLetter(state.result.description),
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
        return const SizedBox();
      },
    );
  }
}
