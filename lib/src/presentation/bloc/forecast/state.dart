import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/new_weather.dart';

abstract class NewForecastState extends Equatable {
  const NewForecastState();
  @override
  List<Object?> get props => [];
}

class NewForecastInitial extends NewForecastState {}

class NewForecastLoading extends NewForecastState {}

class NewForecastError extends NewForecastState {
  final String message;
  const NewForecastError(this.message);

  @override
  List<Object?> get props => [message];
}

class NewForecastLoaded extends NewForecastState {
  final NewWeather result;
  const NewForecastLoaded(this.result);

  @override
  List<Object?> get props => [result];
}
