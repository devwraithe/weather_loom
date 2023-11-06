import 'package:flutter/material.dart';
import 'package:open_weather/src/app.dart';

import 'src/core/utilities/services/service_locator.dart' as injector;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injector.init();
  runApp(
    const OpenWeather(),
  );
}
