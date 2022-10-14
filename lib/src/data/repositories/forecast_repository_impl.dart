import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:open_weather/src/core/errors/exception.dart';
import 'package:open_weather/src/core/errors/failure.dart';
import 'package:open_weather/src/data/datasources/remote_data_source.dart';
import 'package:open_weather/src/domain/entities/daily_forecast.dart';
import 'package:open_weather/src/domain/entities/forecast.dart';
import 'package:open_weather/src/domain/repositories/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final RemoteDataSource remoteDataSource;
  ForecastRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Forecast>>> getHourlyForecast(
      num lat, num lon) async {
    try {
      final result = await remoteDataSource.getHourlyForecast(lat, lon);
      return Right(result.map((elem) => elem.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, List<DailyForecast>>> getDailyForecast(
      num lat, num lon) async {
    try {
      final result = await remoteDataSource.getDailyForecast(lat, lon);
      return Right(result.map((elem) => elem.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }
}
