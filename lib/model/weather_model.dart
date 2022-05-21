class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feelsLike,
      this.pressure});
  Weather.fromJSON(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json["main"]['temp'];
    wind = json["wind"]['speed'];
    pressure = json["main"]['pressure'];
    humidity = json["main"]['humidity'];
    feelsLike = json["main"]['feels_like'];
  }
}
