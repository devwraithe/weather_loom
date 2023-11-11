import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:open_weather/src/core/utilities/helpers/current_city_helper.dart';
import 'package:open_weather/src/presentation/bloc/forecast/state.dart';

import '../../core/constants/imports_barrel.dart';
import '../../core/utilities/helpers/temp_helper.dart';
import '../bloc/forecast/bloc.dart';
import '../bloc/forecast/event.dart';
import '../widgets/city_overview.dart';

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
  // void currentCityInfo() async {
  //   final city = await getCurrentCity();
  //   context.read<WeatherBloc>().add(OnCityChanged(city));
  // }

  @override
  void initState() {
    super.initState();
    // currentCityInfo();
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
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: AppColors.black.withOpacity(0.6),
            ),
            BlocBuilder<NewForecastBloc, NewForecastState>(
              builder: (context, state) {
                if (state is NewForecastLoading) {
                  return const CupertinoActivityIndicator();
                } else if (state is NewForecastError) {
                  return Text(state.message);
                } else if (state is NewForecastLoaded) {
                  final weather = state.result;

                  return Column(
                    children: [
                      CityOverview(
                        condition: weather.description,
                        temp: weather.temp.toString(),
                      ),
                      Text("Something: ${state.result.temp}"),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            // Column(
            //   children: [
            //     // CityOverview(onWeatherAvailable: handleWeather),
            //     // HourForecast(weather: weather),
            //     // const SizedBox(height: 18),
            //     // const DayForecast(),
            //     // const SizedBox(height: 18),
            //     // const WeatherAttributes(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
