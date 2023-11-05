import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  } catch (e) {
    throw Exception('Failed to get current location: $e');
  }
}
