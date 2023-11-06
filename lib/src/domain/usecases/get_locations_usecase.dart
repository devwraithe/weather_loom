import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/domain/entities/location.dart';
import 'package:open_weather/src/domain/repositories/weather_repository.dart';

class GetLocationsUsecase {
  final WeatherRepository repository;
  GetLocationsUsecase(this.repository);

  Future<Either<Failure, List<Location>>> call(String location) {
    return repository.getLocations(location);
  }
}
