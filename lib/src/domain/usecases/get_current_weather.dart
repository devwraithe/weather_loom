import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/domain/entities/weather.dart';
import 'package:open_weather/src/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;
  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> call(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
