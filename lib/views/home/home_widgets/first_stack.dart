import 'package:flutter/material.dart';

enum WeatherState {
  hot,
  normal,
  cold,
}

class HomepageFirstStack extends StatelessWidget {
  HomepageFirstStack({
    super.key,
    required this.weatherState,
  });

  final WeatherState weatherState;
  String imageLink =
      'https://images.unsplash.com/photo-1603729451468-c29f7f414a3c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNhcnRvb24lMjB2aWxsYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1000&q=100';

  @override
  Widget build(BuildContext context) {
    switch (weatherState) {
      case WeatherState.normal:
        imageLink =
            'https://images.unsplash.com/photo-1617478636464-7ea9804bbf58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVhdXRpZnVsJTIwd2VhdGhlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=100';
        break;
      case WeatherState.cold:
        imageLink =
            'https://images.unsplash.com/photo-1612119276551-be9efb8ea36a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y29sZCUyMHdlYXRoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=80';
        break;
      case WeatherState.hot:
        imageLink =
            'https://images.unsplash.com/photo-1561647784-2f9c43b07a0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGhvdCUyMHdlYXRoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=80';
        break;
    }

    return Image.network(
      imageLink,
      fit: BoxFit.cover,
    );

    // return Container(

    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: NetworkImage(imageLink),
    //       fit: BoxFit.cover,
    //     ),
    //   ),

    //   // height: wholeHeight,
    // );
  }
}
