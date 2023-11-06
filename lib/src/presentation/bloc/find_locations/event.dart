import 'package:equatable/equatable.dart';

abstract class FindLocationsEvent extends Equatable {
  const FindLocationsEvent();

  @override
  List<Object> get props => [];
}

class OnLocationChange extends FindLocationsEvent {
  final String location;
  const OnLocationChange(this.location);

  @override
  List<Object> get props => [location];
}
