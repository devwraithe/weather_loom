import 'package:get_it/get_it.dart';
import 'package:open_weather/src/data/datasources/remote_data_source.dart';
import 'package:open_weather/src/data/repositories/weather_repository_impl.dart';
import 'package:open_weather/src/domain/repositories/weather_repository.dart';
import 'package:open_weather/src/domain/usecases/get_current_weather.dart';
import 'package:open_weather/src/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => WeatherBloc(
      locator(),
    ),
  );
  // use case
  locator.registerLazySingleton(
    () => GetCurrentWeather(
      locator(),
    ),
  );
  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
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
