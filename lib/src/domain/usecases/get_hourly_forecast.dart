import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/domain/entities/forecast.dart';
import 'package:open_weather/src/domain/repositories/forecast_repository.dart';

class GetHourlyForecast {
  final ForecastRepository repository;
  GetHourlyForecast(this.repository);

  Future<Either<Failure, List<Forecast>>> call(num lat, num lon) {
    return repository.getHourlyForecast(lat, lon);
  }
}
