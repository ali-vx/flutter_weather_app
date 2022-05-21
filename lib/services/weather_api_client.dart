import 'dart:convert';

import "package:http/http.dart" as http;
import "package:weather_app/model/weather_model.dart";

class WeatherApiClient {
  String apiKey = "Your_API_Key";
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJSON(body);
  }
}
