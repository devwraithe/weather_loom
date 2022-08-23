import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/presentation/bloc/weather_bloc.dart';
import 'package:open_weather/src/presentation/views/home.dart';
import 'injector.dart' as dep_inject;
import 'src/config/routes.dart' as routes;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep_inject.init();
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
          create: (_) => dep_inject.locator<WeatherBloc>(),
        ),
      ],
      child: const MaterialApp(
        title: 'Starbucks Reimagined',
        debugShowCheckedModeBanner: false,
        home: Home(),
        onGenerateRoute: routes.controller,
        initialRoute: routes.home,
      ),
    );
  }
}
