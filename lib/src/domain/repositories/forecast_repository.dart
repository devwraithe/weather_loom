import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';
import 'package:open_weather/src/domain/entities/forecast.dart';

abstract class ForecastRepository {
  Future<Either<Failure, List<Forecast>>> getHourlyForecast(
      num lat, num lon);
  Future<Either<Failure, List<DailyForecast>>> getDailyForecast(
      num lat, num lon);
}
