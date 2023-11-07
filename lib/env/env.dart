import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: 'PLACES_API_KEY')
  static const placesApiKey = _Env.placesApiKey;
  @EnviedField(varName: 'OPEN_WEATHER_KEY')
  static const openWeatherApiKey = _Env.openWeatherApiKey;
}
