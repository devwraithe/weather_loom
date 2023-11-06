import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/src/data/repositories/forecast_repository_impl.dart';
import 'package:open_weather/src/domain/repositories/forecast_repository.dart';
import 'package:open_weather/src/domain/usecases/get_daily_forecast.dart';
import 'package:open_weather/src/domain/usecases/get_hourly_forecast.dart';
import 'package:open_weather/src/domain/usecases/get_locations_usecase.dart';
import 'package:open_weather/src/presentation/bloc/daily_forecast/bloc.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/bloc.dart';
import 'package:open_weather/src/presentation/bloc/geocoding/forecast_bloc.dart';

import '../../../data/datasources/remote_data_source.dart';
import '../../../data/repositories/weather_repository_impl.dart';
import '../../../domain/repositories/weather_repository.dart';
import '../../../domain/usecases/get_current_weather.dart';
import '../../../presentation/bloc/weather/weather_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => WeatherBloc(
      locator(),
      // locator(),
    ),
  );
  locator.registerFactory(
    () => ForecastBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DailyForecastBloc(
      locator(),
    ),
  );

  locator.registerFactory(
    () => FindLocationBloc(
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(
    () => GetCurrentWeather(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetHourlyForecast(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetDailyForecast(
      locator(),
    ),
  );

  locator.registerLazySingleton(
    () => GetLocationsUsecase(
      locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<ForecastRepository>(
    () => ForecastRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
