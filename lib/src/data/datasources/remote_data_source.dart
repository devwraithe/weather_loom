import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather/src/core/constants/api_paths.dart';
import 'package:open_weather/src/core/errors/exception.dart';
import 'package:open_weather/src/data/models/daily_forecast_model.dart';
import 'package:open_weather/src/data/models/forecast_model.dart';
import 'package:open_weather/src/data/models/location_model.dart';
import 'package:open_weather/src/data/models/weather_model.dart';

import '../models/new_weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
  Future<List<ForecastModel>> getHourlyForecast(num lat, num lon);
  Future<List<DailyForecastModel>> getDailyForecast(num lat, num lon);
  Future<List<LocationModel>> getLocations(String location);

  Future<NewWeatherModel> forecast(String lat, String lon);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  const RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response = await client.get(
      Uri.parse(
        ApiUrls.currentWeatherByName(cityName),
      ),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ForecastModel>> getHourlyForecast(num lat, num lon) async {
    final response = await client.get(
      Uri.parse(
        ApiUrls.weatherHourlyForecast(lat, lon),
      ),
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)["hourly"] as List;
      return responseData.map((elem) => ForecastModel.fromJson(elem)).toList();
    } else {
      // throw ServerException();
      throw response.body;
    }
  }

  @override
  Future<List<DailyForecastModel>> getDailyForecast(num lat, num lon) async {
    final response = await client.get(
      Uri.parse(
        ApiUrls.weatherDailyForecast(lat, lon),
      ),
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)["daily"] as List;
      return responseData
          .map((elem) => DailyForecastModel.fromJson(elem))
          .toList();
    } else {
      // throw ServerException();
      throw response.body;
    }
  }

  @override
  Future<List<LocationModel>> getLocations(String location) async {
    final response = await client.get(
      Uri.parse(ApiUrls.getLocations(location)),
    );

    if (response.statusCode == 200) {
      final List responseData =
          jsonDecode(response.body)["predictions"] as List;
      return responseData.map((elem) => LocationModel.fromJson(elem)).toList();
    } else {
      throw response.body;
    }
  }

  @override
  Future<NewWeatherModel> forecast(String lat, String lon) async {
    final response = await client.get(
      Uri.parse(ApiUrls.forecast(lat, lon)),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return NewWeatherModel.fromJson(responseData);
    } else {
      throw response.body;
    }
  }
}
