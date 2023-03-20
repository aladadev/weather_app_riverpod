import 'package:flutter/material.dart';

class MainTempHomeBanner extends StatelessWidget {
  const MainTempHomeBanner({
    super.key,
    required this.thmCxt,
    required this.temperature,
  });

  final ThemeData thmCxt;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 160,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Text(
          '$temperature°c',
          style: thmCxt.textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
