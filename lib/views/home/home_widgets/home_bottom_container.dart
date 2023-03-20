// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import 'home_bottom_header.dart';
import 'weather_all_timestamp.dart';

class HomeBottomContainer extends StatelessWidget {
  const HomeBottomContainer({
    Key? key,
    required this.condition,
    required this.windkph,
    required this.feels,
    required this.humidity,
  }) : super(key: key);
  final String windkph, feels, humidity, condition;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    return ClipPath(
        clipper: ProsteBezierCurve(
          position: ClipPosition.top,
          list: [
            BezierCurveSection(
              start: Offset(screenWidth, 0),
              top: Offset(screenWidth / 2, 30),
              end: const Offset(0, 0),
            ),
          ],
        ),
        child: Container(
          height: size.height * 0.3,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 31, 29, 29),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const HomeBottomHeader(),
              WeatherTodayAllStamps(
                condition: condition,
                feels: feels,
                humidity: humidity,
                windkph: windkph,
              ),
            ],
          ),
        ));
  }
}
