import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInfo(
    String wind, String humidity, String pressure, String feelsLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Wind",
                  style: infoFont,
                ),
                const SizedBox(height: 18.0),
                Text(
                  "Pressure",
                  style: infoFont,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  wind,
                  style: titleFont,
                ),
                const SizedBox(height: 18.0),
                Text(
                  pressure,
                  style: titleFont,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Humidity",
                  style: infoFont,
                ),
                const SizedBox(height: 18.0),
                Text(
                  "Feels Like",
                  style: infoFont,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  humidity,
                  style: titleFont,
                ),
                const SizedBox(height: 18.0),
                Text(
                  feelsLike,
                  style: titleFont,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
