import 'package:flutter/material.dart';

import 'weather_time_stamp.dart';

class WeatherTodayAllStamps extends StatelessWidget {
  const WeatherTodayAllStamps({
    super.key,
    required this.windkph,
    required this.feels,
    required this.humidity,
    required this.condition,
  });
  final String windkph, feels, humidity, condition;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: WeatherTodayTimeStamp(
              icon: Icons.wind_power_rounded, time: 'WindKph', temp: windkph),
        ),
        Expanded(
          child: WeatherTodayTimeStamp(
              icon: Icons.adjust_rounded, time: 'Feels', temp: feels),
        ),
        Expanded(
          child: WeatherTodayTimeStamp(
              icon: Icons.analytics_rounded, time: 'Humidity', temp: humidity),
        ),
        Expanded(
          child: WeatherTodayTimeStamp(
              icon: Icons.agriculture_rounded,
              time: 'Condition',
              temp: condition),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
