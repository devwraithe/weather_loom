import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

String convertTimestamp(int timestamp, {String? timeZone}) {
  timeZone ??= 'UTC';

  // Get the time zone
  final location = tz.getLocation(timeZone);

  // Convert the timestamp to a DateTime in the specified time zone
  final dateTime =
      tz.TZDateTime.fromMillisecondsSinceEpoch(location, timestamp * 1000);

  // Format the DateTime as a time string
  final formattedTime = DateFormat.jm().format(dateTime);

  return formattedTime;
}
