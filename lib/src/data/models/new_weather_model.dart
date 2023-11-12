import 'package:equatable/equatable.dart';
import 'package:open_weather/src/data/models/daily_forecast_model.dart';
import 'package:open_weather/src/data/models/hourly_forecast_model.dart';

import '../../domain/entities/new_weather.dart';

class NewWeatherModel extends Equatable {
  final num? temp,
      pressure,
      humidity,
      windSpeed,
      windGust,
      windDeg,
      feelsLike,
      uvIndex,
      sunset,
      sunrise,
      dewPoint;
  final String? timezone, condition, description, icon;
  final List<HourlyForecastModel>? hourlyForecast;
  final List<DailyForecastModel>? dailyForecast;

  const NewWeatherModel({
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

  factory NewWeatherModel.fromJson(Map<String, dynamic> json) {
    final List<HourlyForecastModel> hourlyForecast = [];
    if (json['hourly'] != null) {
      json['hourly'].forEach((forecast) {
        hourlyForecast.add(
          HourlyForecastModel.fromJson(forecast),
        );
      });
    }

    final List<DailyForecastModel> dailyForecast = [];
    if (json['daily'] != null) {
      json['daily'].forEach((forecast) {
        dailyForecast.add(
          DailyForecastModel.fromJson(forecast),
        );
      });
    }

    return NewWeatherModel(
      temp: json['current']['temp'].round() ?? 0,
      pressure: json['current']['pressure'] ?? 0,
      humidity: json['current']['humidity'] ?? 0,
      windSpeed: json['current']['wind_speed'] ?? 0,
      windDeg: json['current']['wind_deg'] ?? 0,
      windGust: json['current']['wind_gust'] ?? 0,
      feelsLike: json['current']['feels_like'].round() ?? 0,
      uvIndex: json['current']['uvi'].round() ?? 0,
      sunset: json['current']['sunset'] ?? 0,
      sunrise: json['current']['sunrise'] ?? 0,
      dewPoint: json['current']['dew_point'].round() ?? 0,
      timezone: json['timezone'] ?? "",
      condition: json['current']['weather'][0]['main'] ?? "",
      description: json['current']['weather'][0]['description'] ?? "",
      icon: json['current']['weather'][0]['icon'] ?? "",
      hourlyForecast: hourlyForecast,
      dailyForecast: dailyForecast,
    );
  }

  NewWeather toEntity() {
    return NewWeather(
      temp: temp,
      pressure: pressure,
      humidity: humidity,
      windSpeed: windSpeed,
      windDeg: windDeg,
      windGust: windGust,
      feelsLike: feelsLike,
      uvIndex: uvIndex,
      sunset: sunset,
      sunrise: sunrise,
      dewPoint: dewPoint,
      timezone: timezone,
      condition: condition,
      description: description,
      icon: icon,
      hourlyForecast: hourlyForecast!.map((forecast) {
        return forecast.toEntity();
      }).toList(),
      dailyForecast: dailyForecast!.map((forecast) {
        return forecast.toEntity();
      }).toList(),
    );
  }

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
