import 'package:equatable/equatable.dart';

import '../../domain/entities/new_weather.dart';

class NewWeatherModel extends Equatable {
  final num temp, pressure, humidity, windSpeed;
  final String condition, description, icon;

  const NewWeatherModel({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.icon,
  });

  factory NewWeatherModel.fromJson(Map<String, dynamic> json) {
    return NewWeatherModel(
      temp: json['current']['temp'].round(),
      pressure: json['current']['pressure'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_speed'],
      condition: json['current']['weather'][0]['main'],
      description: json['current']['weather'][0]['description'],
      icon: json['current']['weather'][0]['icon'],
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
      ];
}
