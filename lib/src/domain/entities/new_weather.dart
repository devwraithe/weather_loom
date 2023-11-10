import 'package:equatable/equatable.dart';

class NewWeather extends Equatable {
  final num temperature;

  const NewWeather({
    required this.temperature,
  });

  @override
  List<Object?> get props => [temperature];
}
