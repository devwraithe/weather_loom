import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/hourly_forecast.dart';

class HourlyForecastModel extends Equatable {
  final num time, temp;
  final String icon;

  const HourlyForecastModel({
    required this.time,
    required this.temp,
    required this.icon,
  });

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) =>
      HourlyForecastModel(
        time: json["dt"],
        temp: json["temp"].round(),
        icon: json["weather"][0]["icon"],
      );

  HourlyForecast toEntity() => HourlyForecast(
        time: time,
        temp: temp,
        icon: icon,
      );

  @override
  List<Object?> get props => [
        time,
        temp,
        icon,
      ];
}
