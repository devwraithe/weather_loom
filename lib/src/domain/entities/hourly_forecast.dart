import 'package:equatable/equatable.dart';

class HourlyForecast extends Equatable {
  final num time, temp;
  final String icon;

  const HourlyForecast({
    required this.time,
    required this.temp,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        time,
        temp,
        icon,
      ];
}
