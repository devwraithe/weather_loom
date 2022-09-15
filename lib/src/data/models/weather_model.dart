import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/weather.dart';

class WeatherModel extends Equatable {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final String countryAbbr;
  final double temperature;
  final int pressure;
  final int humidity;
  final double windSpeed;

  const WeatherModel({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.countryAbbr,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        countryAbbr: json['sys']['country'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'sys': {
          'country': countryAbbr,
        },
        'name': cityName,
        'wind': {
          'speed': windSpeed,
        }
      };

  Weather toEntity() => Weather(
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        countryAbbr: countryAbbr,
        temperature: temperature,
        pressure: pressure,
        humidity: humidity,
        windSpeed: windSpeed,
      );

  @override
  List<Object?> get props => [
        cityName,
        main,
        description,
        iconCode,
        countryAbbr,
        temperature,
        pressure,
        humidity,
        windSpeed,
      ];
}
