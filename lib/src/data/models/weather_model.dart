import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/weather.dart';

class WeatherModel extends Equatable {
  final num lon, lat;
  final int sunrise, sunset;
  final String cityName, main, description, iconCode, countryAbbr;
  final double temperature, windSpeed, feelsLike;
  final int pressure, humidity;

  const WeatherModel({
    required this.sunrise,
    required this.sunset,
    required this.lon,
    required this.lat,
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.countryAbbr,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        lat: json['coord']["lat"],
        lon: json['coord']["lon"],
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        countryAbbr: json['sys']['country'],
        temperature: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
      );

  Weather toEntity() => Weather(
        lat: lat,
        lon: lon,
        cityName: cityName,
        sunrise: sunrise,
        sunset: sunset,
        feelsLike: feelsLike,
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
        lon,
        lat,
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
