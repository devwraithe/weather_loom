import 'package:equatable/equatable.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class HourlyForecast extends ForecastEvent {
  final num lat, lon;
  const HourlyForecast(this.lat, this.lon);

  @override
  List<Object> get props => [lat, lon];
}
