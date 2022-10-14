import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/forecast.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();

  @override
  List<Object?> get props => [];
}

class ForecastIsEmpty extends ForecastState {}

class ForecastIsLoading extends ForecastState {}

class ForecastHasError extends ForecastState {
  final String message;
  const ForecastHasError(this.message);

  @override
  List<Object?> get props => [message];
}

class ForecastHasData extends ForecastState {
  final List<Forecast> result;
  const ForecastHasData(this.result);

  @override
  List<Object?> get props => [result];
}
