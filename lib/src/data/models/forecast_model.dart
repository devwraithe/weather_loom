import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/forecast.dart';

class ForecastModel extends Equatable {
  final int time;
  final double temp;
  final String icon;

  const ForecastModel({
    required this.time,
    required this.temp,
    required this.icon,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        time: json["dt"],
        temp: json["temp"].toDouble(),
        icon: json["weather"][0]["icon"],
      );

  Forecast toEntity() => Forecast(
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
