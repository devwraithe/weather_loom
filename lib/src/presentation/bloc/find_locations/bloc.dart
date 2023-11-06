import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/event.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/state.dart';

import '../../../domain/usecases/get_locations_usecase.dart';

class FindLocationBloc extends Bloc<FindLocationsEvent, FindLocationState> {
  final GetLocationsUsecase _usecase;

  FindLocationBloc(this._usecase) : super(FindLocationEmpty()) {
    on<OnLocationChange>(
      (event, emit) async {
        final location = event.location;
        emit(FindLocationLoading());
        final result = await _usecase.call(location);
        result.fold(
          (failure) => emit(FindLocationError(failure.message)),
          (data) => emit(FindLocationSuccess(data)),
        );
      },
    );
  }
}
