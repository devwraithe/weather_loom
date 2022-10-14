import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/domain/usecases/get_daily_forecast.dart';
import 'package:open_weather/src/domain/usecases/get_hourly_forecast.dart';
import 'package:open_weather/src/presentation/bloc/geocoding/forecast_event.dart';
import 'package:open_weather/src/presentation/bloc/geocoding/forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetHourlyForecast _getHourlyForecast;

  ForecastBloc(this._getHourlyForecast) : super(ForecastIsEmpty()) {
    on<HourlyForecast>(
      (event, emit) async {
        final num lat = event.lat;
        final num lon = event.lon;
        emit(ForecastIsLoading());
        final result = await _getHourlyForecast.call(lat, lon);
        result.fold(
          (failure) => emit(
            ForecastHasError(failure.message),
          ),
          (data) => emit(
            ForecastHasData(data),
          ),
        );
      },
    );
  }
}
