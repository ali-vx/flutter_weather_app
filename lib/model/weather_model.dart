class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;
  int? id;
  String? description;

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feelsLike,
      this.pressure,
      this.id,
      this.description});
  Weather.fromJSON(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json["main"]['temp'];
    wind = json["wind"]['speed'];
    pressure = json["main"]['pressure'];
    humidity = json["main"]['humidity'];
    feelsLike = json["main"]['feels_like'];
    id = json["weather"][0]['id'];
    description = json["weather"][0]['description'];
  }
}
