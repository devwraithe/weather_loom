import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:open_weather/src/domain/entities/weather.dart';
import 'package:open_weather/src/domain/usecases/get_current_weather.dart';
import 'package:open_weather/src/presentation/bloc/weather_event.dart';
import 'package:open_weather/src/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;
  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {
        final cityName = event.cityName;
        emit(WeatherLoading());
        final result = await _getCurrentWeather.call(cityName);
        result.fold(
          (failure) => emit(WeatherError(failure.message)),
          (data) => emit(WeatherHasData(data)),
        );
      },
      // transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  // EventTransformer<T> debounce<T>(Duration duration) {
  //   return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  // }
}
