import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:open_weather/src/core/utilities/helpers/current_city_helper.dart';
import 'package:open_weather/src/core/utilities/helpers/current_location_helper.dart';
import 'package:open_weather/src/presentation/bloc/forecast/state.dart';
import 'package:open_weather/src/presentation/widgets/forecast_attributes.dart';
import 'package:open_weather/src/presentation/widgets/shimmer/attributes_shimmer.dart';
import 'package:open_weather/src/presentation/widgets/shimmer/hourly_shimmer.dart';
import 'package:timezone/data/latest.dart' as timezone;

import '../../config/theme/app_text_theme.dart';
import '../../core/constants/imports_barrel.dart';
import '../../core/utilities/helpers/temp_helper.dart';
import '../../core/utilities/helpers/ui_helpers.dart';
import '../bloc/find_locations/bloc.dart';
import '../bloc/find_locations/event.dart';
import '../bloc/find_locations/state.dart';
import '../bloc/forecast/bloc.dart';
import '../bloc/forecast/event.dart';
import '../widgets/city_overview.dart';
import '../widgets/hourly_forecast.dart';
import '../widgets/loading/overview_loading.dart';
import '../widgets/location_item.dart';
import '../widgets/new_daily_forecast.dart';
import '../widgets/shimmer/daily_shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String condition = "";
  String? currentLocation;

  @override
  void initState() {
    super.initState();
    timezone.initializeTimeZones();
    _getCurrentWeather();
  }

  void _getCurrentWeather() async {
    final coordinates = await getCurrentLocation();
    currentLocation = await convertCoordinates(
      coordinates.latitude,
      coordinates.longitude,
    );
    print(coordinates);
    context.read<NewForecastBloc>().add(
          OnCoordinatesChange(
            coordinates.latitude.toString(),
            coordinates.longitude.toString(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            weatherImage(condition),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: AppColors.black.withOpacity(0.5),
          ),
          BlocConsumer<NewForecastBloc, NewForecastState>(
            listener: (context, state) {
              if (state is NewForecastLoaded) {
                setState(() => condition = state.result.condition!);
              }
            },
            builder: (context, state) {
              final loading = state is NewForecastLoading;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    state is NewForecastLoaded
                        ? CityOverview(
                            condition: state.result.description,
                            temp: state.result.temp.toString(),
                            location: currentLocation!,
                            onPressed: () => _locationsList(),
                          )
                        : const OverviewLoading(),
                    const SizedBox(height: 18),
                    state is NewForecastLoaded
                        ? NewHourlyForecast(
                            timezone: state.result.timezone,
                            forecast: state.result.hourlyForecast)
                        : const HourlyShimmer(),
                    const SizedBox(height: 18),
                    state is NewForecastLoaded
                        ? NewDailyForecast(daily: state.result.dailyForecast)
                        : const DailyShimmer(),
                    const SizedBox(height: 18),
                    state is NewForecastLoaded
                        ? ForecastAttributes(
                            loading: loading,
                            attributes: state.result,
                          )
                        : const AttributesShimmer(),
                    const SizedBox(height: 22),
                    Text(
                      "Weather for $currentLocation",
                      style: AppTextTheme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Trigger the bottom sheet for list
  _locationsList() {
    TextEditingController search = TextEditingController();

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
              TextFormField(
                controller: search,
                style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                  height: 1.34,
                  color: AppColors.black,
                ),
                decoration: InputDecoration(
                  hintStyle: AppTextTheme.textTheme.bodyLarge?.copyWith(
                    height: 1.34,
                    color: AppColors.grey,
                  ),
                  hintText: "Look for a location",
                  isDense: true,
                  labelStyle: AppTextTheme.textTheme.bodyLarge?.copyWith(
                    height: 1.34,
                    color: AppColors.black,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  filled: true,
                  fillColor: AppColors.lightGray,
                  enabledBorder: UiHelpers.inputBorder(AppColors.lightGray),
                  border: UiHelpers.inputBorder(AppColors.lightGray),
                ),
                onChanged: (v) async {
                  context
                      .read<FindLocationBloc>()
                      .add(OnLocationChange(search.text));
                },
              ),
              const SizedBox(height: 28),
              BlocBuilder<FindLocationBloc, FindLocationState>(
                builder: (context, state) {
                  if (state is FindLocationLoading) {
                    return Container(
                      margin: const EdgeInsets.only(top: 180),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: AppColors.black,
                      ),
                    );
                  } else if (state is FindLocationError) {
                    return Container(
                      margin: const EdgeInsets.only(top: 180),
                      alignment: Alignment.center,
                      child: Text(state.message),
                    );
                  } else if (state is FindLocationSuccess) {
                    return Column(
                      children: [
                        for (final location in state.result)
                          LocationItem(
                            title: location.mainText,
                            subtitle: location.secText,
                            onPressed: () async {
                              currentLocation = location.mainText;
                              List<Location> coordinates =
                                  await locationFromAddress(location.mainText);
                              context.read<NewForecastBloc>().add(
                                    OnCoordinatesChange(
                                      coordinates[0].latitude.toString(),
                                      coordinates[0].longitude.toString(),
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                          ),
                      ],
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(top: 180),
                      alignment: Alignment.center,
                      child: Text(
                        "Start typing to find location",
                        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
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
