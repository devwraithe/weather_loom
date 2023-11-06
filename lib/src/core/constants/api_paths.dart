class ApiUrls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String geoUrl = 'http://api.openweathermap.org/geo/1.0/';
  static const String apiKey = '&appid=cc95d932d5a45d33a9527d5019475f2c';
  static const String units = '&units=metric';
  static String currentWeatherByName(String city) =>
      '$baseUrl/weather?q=$city$units$apiKey';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
  static String weatherHourlyForecast(num lat, num lon) =>
      '$baseUrl/onecall?lat=$lat&lon=$lon&exclude=daily,minutely,current,alerts$units$apiKey';
  static String weatherDailyForecast(num lat, num lon) =>
      '$baseUrl/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely,current,alerts$units$apiKey';

  static String getLocations(String location) =>
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$location&key=AIzaSyDdNq79JI9z22ta0bOICaQ7iSG0c7kgHHs';
}
