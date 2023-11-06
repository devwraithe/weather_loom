import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/location.dart';

abstract class FindLocationState extends Equatable {
  const FindLocationState();

  @override
  List<Object?> get props => [];
}

class FindLocationEmpty extends FindLocationState {}

class FindLocationLoading extends FindLocationState {}

class FindLocationError extends FindLocationState {
  final String message;
  const FindLocationError(this.message);

  @override
  List<Object?> get props => [message];
}

class FindLocationSuccess extends FindLocationState {
  final List<Location> result;
  const FindLocationSuccess(this.result);

  @override
  List<Object?> get props => [result];
}
