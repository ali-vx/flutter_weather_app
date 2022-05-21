import 'package:flutter/material.dart';

Widget currentWeather(
    IconData icon, String temp, String location, String description) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 64,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '$temp°',
          style: const TextStyle(
            fontSize: 45,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          location,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "${description[0].toUpperCase()}${description.substring(1)}",
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
