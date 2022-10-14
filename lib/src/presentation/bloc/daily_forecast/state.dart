import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';

abstract class DailyForecastState extends Equatable {
  const DailyForecastState();

  @override
  List<Object?> get props => [];
}

class DailyForecastIsEmpty extends DailyForecastState {}

class DailyForecastIsLoading extends DailyForecastState {}

class DailyForecastHasError extends DailyForecastState {
  final String message;
  const DailyForecastHasError(this.message);

  @override
  List<Object?> get props => [message];
}

class DailyForecastHasData extends DailyForecastState {
  final List<DailyForecast> result;
  const DailyForecastHasData(this.result);

  @override
  List<Object?> get props => [result];
}
