import 'package:equatable/equatable.dart';

class NewWeather extends Equatable {
  final num temp, pressure, humidity, windSpeed;
  final String condition, description, icon;

  const NewWeather({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.icon,
  });

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
