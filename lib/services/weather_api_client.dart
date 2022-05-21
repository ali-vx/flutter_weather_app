import 'dart:convert';

import "package:http/http.dart" as http;
import "package:weather_app/model/weather_model.dart";

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=ff5339fe16d1f6575b17011b28f76df4&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJSON(body);
  }
}
