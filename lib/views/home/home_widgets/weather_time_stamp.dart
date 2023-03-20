import 'package:flutter/material.dart';

class WeatherTodayTimeStamp extends StatelessWidget {
  const WeatherTodayTimeStamp({
    super.key,
    required this.icon,
    required this.time,
    required this.temp,
  });
  final IconData icon;
  final String time;
  final String temp;
  @override
  Widget build(BuildContext context) {
    final thmCxt = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: const Color.fromARGB(255, 111, 207, 92),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              time,
              style: thmCxt.textTheme.labelSmall!.copyWith(
                color: Colors.black87,
                fontSize: 10,
              ),
            ),
          ),
          Text(
            '$temp°',
            style: thmCxt.textTheme.labelMedium!.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
