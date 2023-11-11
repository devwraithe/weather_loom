import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/hourly_forecast.dart';

class NewWeather extends Equatable {
  final num temp, pressure, humidity, windSpeed;
  final String condition, description, icon;
  final List<HourlyForecast> hourlyForecast;

  const NewWeather({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.icon,
    required this.hourlyForecast,
  });

  @override
  List<Object?> get props => [
        temp,
        pressure,
        humidity,
        windSpeed,
        condition,
        description,
        icon,
        hourlyForecast,
      ];
}
