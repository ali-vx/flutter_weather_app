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
      backgroundColor: const Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(cityName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
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
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                    "${data!.cityName}"),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Additonal Info",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xdd212121),
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
    );
  }
}
