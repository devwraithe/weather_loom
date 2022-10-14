import 'package:equatable/equatable.dart';

abstract class DailyForecastEvent extends Equatable {
  const DailyForecastEvent();

  @override
  List<Object> get props => [];
}

class DailyForecast extends DailyForecastEvent {
  final num lat, lon;
  const DailyForecast(this.lat, this.lon);

  @override
  List<Object> get props => [lat, lon];
}
