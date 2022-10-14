import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/config/theme.dart';
import 'src/presentation/bloc/weather/weather_bloc.dart';
import 'src/presentation/views/home.dart';
import 'package:open_weather/src/presentation/bloc/geocoding/forecast_bloc.dart';
import 'package:open_weather/src/presentation/bloc/daily_forecast/bloc.dart';
import 'src/core/utilities/services/service_locator.dart' as injector;
import 'src/config/routes.dart' as routes;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injector.init();
  runApp(
    const OpenWeather(),
  );
}

class OpenWeather extends StatelessWidget {
  const OpenWeather({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector.locator<WeatherBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.locator<ForecastBloc>(),
        ),
        BlocProvider(
          create: (_) => injector.locator<DailyForecastBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Open Weather',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const Home(),
        onGenerateRoute: routes.controller,
        initialRoute: routes.home,
      ),
    );
  }
}
