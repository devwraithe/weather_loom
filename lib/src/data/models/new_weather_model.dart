import 'package:equatable/equatable.dart';
import 'package:open_weather/src/data/models/daily_forecast_model.dart';
import 'package:open_weather/src/data/models/hourly_forecast_model.dart';

import '../../domain/entities/new_weather.dart';

class NewWeatherModel extends Equatable {
  final num temp, pressure, humidity, windSpeed;
  final String condition, description, icon;
  final List<HourlyForecastModel> hourlyForecast;
  final List<DailyForecastModel> dailyForecast;

  const NewWeatherModel({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.icon,
    required this.hourlyForecast,
    required this.dailyForecast,
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
      temp: json['current']['temp'].round(),
      pressure: json['current']['pressure'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_speed'],
      condition: json['current']['weather'][0]['main'],
      description: json['current']['weather'][0]['description'],
      icon: json['current']['weather'][0]['icon'],
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
      condition: condition,
      description: description,
      icon: icon,
      hourlyForecast: hourlyForecast.map((forecast) {
        return forecast.toEntity();
      }).toList(),
      dailyForecast: dailyForecast.map((forecast) {
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
        condition,
        description,
        icon,
        hourlyForecast,
        dailyForecast,
      ];
}
