import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final num lon, lat;
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final String countryAbbr;
  final double temperature, windSpeed, feelsLike;
  final int pressure, humidity, sunrise, sunset;

  const Weather({
    required this.lon,
    required this.lat,
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.countryAbbr,
    required this.feelsLike,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
        lon,
        lat,
        cityName,
        main,
        description,
        feelsLike,
        iconCode,
        countryAbbr,
        temperature,
        pressure,
        humidity,
        windSpeed,
      ];
}
