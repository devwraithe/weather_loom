import 'package:open_weather/src/presentation/bloc/forecast/event.dart';
import 'package:open_weather/src/presentation/bloc/forecast/state.dart';

import '../../../core/constants/imports_barrel.dart';
import '../../../domain/usecases/forecast_usecase.dart';

class NewForecastBloc extends Bloc<NewForecastEvent, NewForecastState> {
  final ForecastUsecase _forecastUsecase;

  NewForecastBloc(this._forecastUsecase) : super(NewForecastInitial()) {
    on<OnCoordinatesChange>(
      (event, emit) async {
        final lat = event.lat;
        final lon = event.lon;

        emit(NewForecastLoading());

        final result = await _forecastUsecase.call(lat, lon);
        result.fold(
          (failure) => emit(NewForecastError(failure.message)),
          (data) => emit(NewForecastLoaded(data)),
        );
      },
    );
  }
}
