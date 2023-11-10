import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:open_weather/src/config/theme/app_text_theme.dart';
import 'package:open_weather/src/core/utilities/constants.dart';
import 'package:open_weather/src/core/utilities/helpers/current_date_helper.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/bloc.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/event.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/state.dart';
import 'package:open_weather/src/presentation/widgets/location_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants/imports_barrel.dart';

class CityOverview extends StatefulWidget {
  const CityOverview({
    super.key,
    required this.onWeatherAvailable,
  });

  final Function(String) onWeatherAvailable;

  @override
  State<CityOverview> createState() => _CityOverviewState();
}

class _CityOverviewState extends State<CityOverview> {
  // In your widget, when the temperature is available:
  void updateWeather(String weather) {
    widget.onWeatherAvailable(weather);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherHasData) {
          updateWeather(state.result.main);
        }
      },
      builder: (context, state) {
        if (state is WeatherLoading) {
          return _buildShimmerLoader();
        }
        if (state is WeatherHasData) {
          final result = state.result;

          final num _lat = result.lat;
          final num _lon = result.lon;

          context.read<ForecastBloc>().add(HourlyForecast(_lat, _lon));
          context.read<DailyForecastBloc>().add(DailyForecast(_lat, _lon));

          return Padding(
            padding: const EdgeInsets.only(bottom: 60, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _locationsList(),
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

  // Trigger the bottom sheet for list
  _locationsList() {
    TextEditingController search = TextEditingController();

    dispose() {
      super.dispose();
      search.dispose();
    }

    return showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Locations",
                style: AppTextTheme.textTheme.headlineLarge?.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 20),
              // TextFormField(
              //   controller: search,
              //   onFieldSubmitted: (v) async {
              //     context.read<WeatherBloc>().add(
              //           OnCityChanged(v),
              //         );
              //     Navigator.pop(context);
              //   },
              // ),
              TextFormField(
                controller: search,
                onChanged: (v) async {
                  context
                      .read<FindLocationBloc>()
                      .add(OnLocationChange(search.text));
                  // Navigator.pop(context);
                },
              ),
              const SizedBox(height: 28),
              BlocBuilder<FindLocationBloc, FindLocationState>(
                builder: (context, state) {
                  if (state is FindLocationLoading) {
                    return const CircularProgressIndicator(
                      color: AppColors.black,
                    );
                  } else if (state is FindLocationError) {
                    return Text(state.message);
                  } else if (state is FindLocationSuccess) {
                    return Column(
                      children: [
                        for (final location in state.result)
                          LocationItem(
                            title: location.mainText,
                            subtitle: location.secText,
                          ),
                      ],
                    );
                  } else {
                    return const Text(
                      "Start typing to find location",
                      style: TextStyle(color: Colors.black),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Shimmer loading effect
  _buildShimmerLoader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 14,
              width: 140,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 10,
              width: 70,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
