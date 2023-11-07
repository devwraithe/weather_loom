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

import '../../core/constants/imports_barrel.dart';

class CityOverview extends StatefulWidget {
  const CityOverview({
    super.key,
    required this.onTemperatureAvailable,
  });

  final Function(int) onTemperatureAvailable;

  @override
  State<CityOverview> createState() => _CityOverviewState();
}

class _CityOverviewState extends State<CityOverview> {
  // In your widget, when the temperature is available:
  void updateTemperature(int temperature) {
    widget.onTemperatureAvailable(temperature);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherHasData) {
          updateTemperature(state.result.temperature);
        }
      },
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
            padding: const EdgeInsets.only(bottom: 60, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _locationsList(),
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(right: 18),
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
}
