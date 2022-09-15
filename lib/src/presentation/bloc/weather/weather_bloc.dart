import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_current_weather.dart';
import '../../bloc/weather/weather_event.dart';
import '../../bloc/weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  List? locationData = [];

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
          (data) => emit(
            WeatherHasData(data),
          ),
        );
      },
    );
  }
}
