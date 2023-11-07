import '../../../core/constants/imports_barrel.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {
        final cityName = event.cityName;
        emit(WeatherLoading());
        final result = await _getCurrentWeather.call(cityName);
        result.fold(
          (failure) => emit(
            WeatherError(failure.message),
          ),
          (data) {
            emit(WeatherHasData(data));
          },
        );
      },
    );
  }
}
