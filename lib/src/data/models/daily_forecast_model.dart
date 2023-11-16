import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';

class DailyForecastModel extends Equatable {
  final int dailyTime;
  final num dailyMinTemp, dailyMaxTemp;
  final String dailyIcon;

  const DailyForecastModel({
    required this.dailyTime,
    required this.dailyMinTemp,
    required this.dailyMaxTemp,
    required this.dailyIcon,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) =>
      DailyForecastModel(
        dailyTime: json["dt"],
        dailyMinTemp: json['temp']['min'],
        dailyMaxTemp: json['temp']['max'],
        dailyIcon: json["weather"][0]["icon"],
      );

  DailyForecast toEntity() => DailyForecast(
        dailyTime: dailyTime,
        dailyMinTemp: dailyMinTemp,
        dailyMaxTemp: dailyMaxTemp,
        dailyIcon: dailyIcon,
      );

  @override
  List<Object?> get props => [
        dailyTime,
        dailyMinTemp,
        dailyMaxTemp,
        dailyIcon,
      ];
}
