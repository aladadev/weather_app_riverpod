import 'package:flutter/material.dart';

class HomeBottomHeader extends StatelessWidget {
  const HomeBottomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            height: 3,
            width: 40,
            color: const Color.fromARGB(255, 200, 196, 195),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Weather Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
