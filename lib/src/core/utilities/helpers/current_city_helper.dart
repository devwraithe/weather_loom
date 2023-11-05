import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'current_location_helper.dart';

Future<String> getCurrentCity() async {
  try {
    // Get the current location
    Position position = await getCurrentLocation();

    // Use geocoding to get the city name from latitude and longitude
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      // Extract the city name from the placemarks
      String city = placemarks[0].locality ?? 'Unknown';
      return city;
    } else {
      return 'Unknown';
    }
  } catch (e) {
    // Handle any exceptions that may occur during location retrieval or geocoding
    throw Exception('Failed to get current city: $e');
  }
}
