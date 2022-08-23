import 'package:dartz/dartz.dart';
import 'package:open_weather/src/domain/entities/weather.dart';
import 'package:open_weather/src/data/config/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
