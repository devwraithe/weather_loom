import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String secText, mainText;

  const Location({
    required this.secText,
    required this.mainText,
  });

  @override
  List<Object?> get props => [
        secText,
        mainText,
      ];
}
