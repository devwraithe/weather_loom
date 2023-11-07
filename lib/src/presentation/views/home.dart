import 'package:flutter/material.dart';
import 'package:open_weather/src/core/utilities/helpers/current_city_helper.dart';
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
  int temperature = 0;

  void handleTemperature(int newTemperature) {
    setState(() => temperature = newTemperature);
  }

  // Get the weather information for the current city
  void currentCityInfo() async {
    final city = await getCurrentCity();
    debugPrint("My current city is $city");
    context.read<WeatherBloc>().add(OnCityChanged(city));
  }

  @override
  void initState() {
    super.initState();
    currentCityInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: tempColor(temperature),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              children: [
                CityOverview(onTemperatureAvailable: handleTemperature),
                const HourForecast(),
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
