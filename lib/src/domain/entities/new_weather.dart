import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';
import 'package:open_weather/src/domain/entities/hourly_forecast.dart';

class NewWeather extends Equatable {
  final num temp,
      pressure,
      humidity,
      windSpeed,
      windDeg,
      windGust,
      feelsLike,
      uvIndex,
      sunset,
      sunrise,
      dewPoint;
  final String timezone, condition, description, icon;
  final List<HourlyForecast> hourlyForecast;
  final List<DailyForecast> dailyForecast;

  const NewWeather({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.feelsLike,
    required this.uvIndex,
    required this.sunset,
    required this.sunrise,
    required this.dewPoint,
    required this.timezone,
    required this.condition,
    required this.description,
    required this.icon,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  @override
  List<Object?> get props => [
        temp!,
        pressure,
        humidity,
        windSpeed,
        windDeg,
        windGust,
        feelsLike,
        uvIndex,
        sunset,
        sunrise,
        dewPoint,
        timezone,
        condition,
        description,
        icon,
        hourlyForecast,
        dailyForecast,
      ];
}
