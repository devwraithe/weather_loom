import 'package:intl/intl.dart';

String currentDate() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('E, dd MMM');
  final String formattedDate = formatter.format(now);
  return formattedDate;
}
