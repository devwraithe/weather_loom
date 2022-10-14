import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';
import 'package:open_weather/src/domain/repositories/forecast_repository.dart';

class GetDailyForecast {
  final ForecastRepository repository;
  GetDailyForecast(this.repository);

  Future<Either<Failure, List<DailyForecast>>> call(num lat, num lon) {
    return repository.getDailyForecast(lat, lon);
  }
}
