import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_info.dart';
import 'package:weather_app/views/current_weather.dart';
import 'package:weather_app/model/weather_model.dart';

void main() => runApp(const MyApp());

var cityName = "Islamabad";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data = Weather();
  Future<void> getData(String city) async {
    data = await client.getCurrentWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Positioned.fill(
          child: Image(
            image: AssetImage(isDay()),
            fit: BoxFit.cover,
          ),
        ),
        FutureBuilder(
          future: getData(cityName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.only(top: 40.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search City",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xdd212121),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSubmitted: (String value) {
                        cityName = value;
                        setState(() {});
                      },
                    ),
                  ),
                  currentWeather(getWeatherIcon(data!.id), "${data!.temp}",
                      "${data!.cityName}", "${data!.description}"),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Additonal Info",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  additionalInfo("${data!.wind}", "3${data!.humidity}",
                      "${data!.pressure}", "${data!.feelsLike}"),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          },
        ),
      ]),
    );
  }
}

String isDay() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'assets/day.png';
  }
  return 'assets/night.jpg';
}

IconData getWeatherIcon(int? condition) {
  if (condition! < 300) {
    return Icons.cloudy_snowing;
  } else if (condition < 400) {
    return Icons.cloudy_snowing;
  } else if (condition < 600) {
    return Icons.ac_unit;
  } else if (condition < 700) {
    return Icons.snowing;
  } else if (condition < 800) {
    return Icons.foggy;
  } else if (condition == 800) {
    return Icons.wb_sunny;
  } else if (condition <= 804) {
    return Icons.cloud;
  } else {
    return Icons.wb_sunny;
  }
}
