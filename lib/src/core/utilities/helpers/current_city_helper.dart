import 'package:geocoding/geocoding.dart';

Future<String> convertCoordinates(double lat, double long) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    if (placemarks.isNotEmpty) {
      String location = placemarks[0].locality ?? 'Unknown';
      return location;
    } else {
      return 'Unknown';
    }
  } catch (e) {
    throw Exception('Unable to convert coordinates: $e');
  }
}
