import 'package:equatable/equatable.dart';

import '../../domain/entities/new_weather.dart';

class NewWeatherModel extends Equatable {
  final num temperature;

  const NewWeatherModel({
    required this.temperature,
  });

  factory NewWeatherModel.fromJson(Map<String, dynamic> json) {
    return NewWeatherModel(
      temperature: json['current']['temp'].round(),
    );
  }

  NewWeather toEntity() {
    return NewWeather(
      temperature: temperature,
    );
  }

  @override
  List<Object?> get props => [temperature];
}
