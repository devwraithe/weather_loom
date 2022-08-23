import 'package:dartz/dartz.dart';
import 'package:open_weather/src/domain/entities/weather.dart';
import 'package:open_weather/src/domain/repositories/weather_repository.dart';
import 'package:open_weather/src/data/config/failure.dart';

class GetCurrentWeather {
  final WeatherRepository repository;
  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> call(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
