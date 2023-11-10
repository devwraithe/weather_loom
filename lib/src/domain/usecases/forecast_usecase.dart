import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/domain/repositories/weather_repository.dart';

import '../entities/new_weather.dart';

class ForecastUsecase {
  final WeatherRepository repository;
  ForecastUsecase(this.repository);

  Future<Either<Failure, NewWeather>> call(String lat, String lon) {
    return repository.forecast(lat, lon);
  }
}
