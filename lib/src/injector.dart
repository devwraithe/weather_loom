import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import './data/datasources/remote_data_source.dart';
import './data/repositories/weather_repository_impl.dart';
import './domain/repositories/weather_repository.dart';
import './domain/usecases/get_current_weather.dart';
import './presentation/bloc/weather/weather_bloc.dart';

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
