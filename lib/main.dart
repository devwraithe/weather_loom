import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/presentation/bloc/weather/weather_bloc.dart';
import 'src/presentation/views/home.dart';
import 'src/injector.dart' as injector;
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
      ],
      child: MaterialApp(
        title: 'Open Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Gilroy",
          visualDensity: VisualDensity.standard,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 46.18,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
            headline5: TextStyle(
              fontSize: 25.63,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.4,
            ),
            subtitle2: TextStyle(
              fontSize: 18.00,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        home: const Home(),
        onGenerateRoute: routes.controller,
        initialRoute: routes.home,
      ),
    );
  }
}
