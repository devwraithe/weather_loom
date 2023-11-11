import 'package:flutter/material.dart';
import 'package:open_weather/src/presentation/views/home.dart';

class Routes {
  static const String home = '/';
}

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    default:
      throw ('the specified route is unavailable!');
  }
}
