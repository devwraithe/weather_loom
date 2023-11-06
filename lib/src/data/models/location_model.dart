import 'package:equatable/equatable.dart';
import 'package:open_weather/src/domain/entities/location.dart';

class LocationModel extends Equatable {
  final String secText, mainText;

  const LocationModel({
    required this.secText,
    required this.mainText,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        secText: json['structured_formatting']["secondary_text"],
        mainText: json['structured_formatting']['main_text'],
      );

  Location toEntity() => Location(
        secText: secText,
        mainText: mainText,
      );

  @override
  List<Object?> get props => [
        secText,
        mainText,
      ];
}
