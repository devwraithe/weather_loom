import 'package:equatable/equatable.dart';

abstract class NewForecastEvent extends Equatable {
  const NewForecastEvent();
  @override
  List<Object> get props => [];
}

class OnCoordinatesChange extends NewForecastEvent {
  final String lat, lon;
  const OnCoordinatesChange(this.lat, this.lon);

  @override
  List<Object> get props => [lat, lon];
}
