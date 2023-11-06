import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied) {
    throw Exception('Location permission is denied.');
  } else if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permission is permanently denied.');
  } else {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      throw Exception('Failed to get current location: $e');
    }
  }
}
