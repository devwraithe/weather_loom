import 'package:flutter/material.dart';
import 'package:open_weather/src/app.dart';

import 'src/core/utilities/services/service_locator.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(const WeatherLoom());
}
