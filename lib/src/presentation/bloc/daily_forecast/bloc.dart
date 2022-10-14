import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/domain/usecases/get_daily_forecast.dart';
import 'package:open_weather/src/presentation/bloc/daily_forecast/event.dart';
import 'package:open_weather/src/presentation/bloc/daily_forecast/state.dart';

class DailyForecastBloc extends Bloc<DailyForecastEvent, DailyForecastState> {
  final GetDailyForecast _getDailyForecast;

  DailyForecastBloc(this._getDailyForecast) : super(DailyForecastIsEmpty()) {
    on<DailyForecast>(
      (event, emit) async {
        final num lat = event.lat;
        final num lon = event.lon;
        emit(DailyForecastIsLoading());
        final result = await _getDailyForecast.call(lat, lon);
        result.fold(
          (failure) => emit(
            DailyForecastHasError(failure.message),
          ),
          (data) => emit(
            DailyForecastHasData(data),
          ),
        );
      },
    );
  }
}
