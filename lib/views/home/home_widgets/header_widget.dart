import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.city, required this.lastUpdated});
  final String city;
  final String lastUpdated;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
          child: Row(
            children: [
              const Icon(
                Icons.location_city_rounded,
              ),
              Text(
                city,
                softWrap: true,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 22, right: 20, bottom: 10),
          child: Text(
            lastUpdated,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
