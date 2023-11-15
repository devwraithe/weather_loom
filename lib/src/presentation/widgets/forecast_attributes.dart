import 'package:flutter/material.dart';
import 'package:open_weather/src/domain/entities/new_weather.dart';
import 'package:open_weather/src/presentation/widgets/forecast/attributes/sunset_attribute.dart';
import 'package:open_weather/src/presentation/widgets/forecast/attributes/uvi_attribute.dart';
import 'package:open_weather/src/presentation/widgets/forecast/attributes/wind_attribute.dart';

import 'forecast/attributes/humidity_attribute.dart';
import 'forecast/attributes/pressure_attribute.dart';
import 'forecast/attributes/temp_attribute.dart';

class ForecastAttributes extends StatefulWidget {
  const ForecastAttributes({
    super.key,
    required this.loading,
    required this.attributes,
  });

  final bool loading;
  final NewWeather? attributes;

  @override
  State<ForecastAttributes> createState() => _ForecastAttributesState();
}

class _ForecastAttributesState extends State<ForecastAttributes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              TempAttribute(
                loading: widget.loading,
                feelsLike: widget.attributes!.feelsLike ?? 0,
                humidity: widget.attributes!.humidity ?? 0,
              ),
              const SizedBox(width: 18),
              WindAttribute(
                loading: widget.loading,
                speed: widget.attributes!.windSpeed ?? 0,
                gust: widget.attributes!.windGust ?? 0,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              SunsetAttribute(
                loading: widget.loading,
                sunset: widget.attributes!.sunset,
                sunrise: widget.attributes!.sunrise,
                timezone: widget.attributes!.timezone,
              ),
              const SizedBox(width: 18),
              UviAttribute(
                loading: widget.loading,
                uvi: widget.attributes!.uvIndex ?? 0,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              HumidityAttribute(
                loading: widget.loading,
                humidity: widget.attributes!.humidity ?? 0,
                dewPoint: widget.attributes!.dewPoint ?? 0,
              ),
              const SizedBox(width: 18),
              PressureAttribute(
                loading: widget.loading,
                pressure: widget.attributes!.pressure ?? 0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
