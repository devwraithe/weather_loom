import 'package:flutter/material.dart';
import 'package:open_weather/src/config/routes.dart';
import 'package:open_weather/src/presentation/bloc/find_locations/bloc.dart';
import 'package:open_weather/src/presentation/bloc/forecast/bloc.dart';
import 'package:open_weather/src/presentation/views/home.dart';

import '../src/core/utilities/services/service_locator.dart' as injector;
import 'config/theme/app_theme.dart';
import 'core/constants/imports_barrel.dart';

class WeatherLoom extends StatelessWidget {
  const WeatherLoom({Key? key}) : super(key: key);
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
        title: 'WeatherLoom',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        themeMode: ThemeMode.light,
        onGenerateRoute: controller,
        home: const Home(),
        initialRoute: Routes.home,
      ),
    );
  }
}
