import 'package:flutter/material.dart';
import 'package:open_weather/src/config/routes.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/bloc.dart';
import 'package:open_weather/src/presentation/bloc/forecast/bloc.dart';
import 'package:open_weather/src/presentation/views/home.dart';

import '../src/core/utilities/services/service_locator.dart' as injector;
import 'config/theme/app_theme.dart';
import 'core/constants/imports_barrel.dart';

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
        BlocProvider(
          create: (_) => injector.locator<FindLocationBloc>(),
        ),
        BlocProvider(create: (_) => injector.locator<NewForecastBloc>()),
      ],
      child: MaterialApp(
        title: 'Open Weather',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        home: const Home(),
        onGenerateRoute: controller,
        initialRoute: Routes.home,
      ),
    );
  }
}
