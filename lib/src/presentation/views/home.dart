import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/src/core/utilities/helpers/current_city_helper.dart';
import 'package:open_weather/src/presentation/bloc/forecast/bloc.dart';
import 'package:open_weather/src/presentation/bloc/forecast/event.dart';
import 'package:open_weather/src/presentation/widgets/city_overview.dart';
import 'package:open_weather/src/presentation/widgets/day_forecast.dart';
import 'package:open_weather/src/presentation/widgets/weather_attributes.dart';

import '../../core/constants/imports_barrel.dart';
import '../../core/utilities/helpers/temp_helper.dart';
import '../widgets/daily_forecast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String weather = "";

  void handleWeather(String newWeather) {
    setState(() => weather = newWeather);
  }

  // Get the weather information for the current city
  void currentCityInfo() async {
    final city = await getCurrentCity();
    context.read<WeatherBloc>().add(OnCityChanged(city));
  }

  @override
  void initState() {
    super.initState();
    currentCityInfo();
    _initNewForecast();
  }

  void _initNewForecast() async {
    final coordinates = await getCoordinates();
    context.read<NewForecastBloc>().add(
          OnCoordinatesChange(
            coordinates.latitude.toString(),
            coordinates.longitude.toString(),
          ),
        );
    debugPrint("New forecast initialized!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: weatherImage(weather),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                CityOverview(onWeatherAvailable: handleWeather),
                HourForecast(weather: weather),
                const SizedBox(height: 18),
                const DayForecast(),
                const SizedBox(height: 18),
                const WeatherAttributes(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
