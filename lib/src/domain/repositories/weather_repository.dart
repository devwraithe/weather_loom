import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/domain/entities/location.dart';
import 'package:open_weather/src/domain/entities/weather.dart';

import '../entities/new_weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
  Future<Either<Failure, List<Location>>> getLocations(String location);
  Future<Either<Failure, NewWeather>> forecast(String lat, String lon);
}
