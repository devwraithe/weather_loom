import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';
import 'package:open_weather/src/domain/entities/hourly_forecast.dart';

class NewWeather extends Equatable {
  final num? temp,
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
  final String? timezone, condition, description, icon;
  final List<HourlyForecast>? hourlyForecast;
  final List<DailyForecast>? dailyForecast;

  const NewWeather({
    this.temp,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.feelsLike,
    this.uvIndex,
    this.sunset,
    this.sunrise,
    this.dewPoint,
    this.timezone,
    this.condition,
    this.description,
    this.icon,
    this.hourlyForecast,
    this.dailyForecast,
  });

  @override
  List<Object?> get props => [
        temp,
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
