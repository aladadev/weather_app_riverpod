import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/weather_constants.dart';
import 'package:weather_app/constants/weatherapi_constants.dart';
import 'package:weather_app/models/weather_model.dart';

// Current Weather Provider
final currentWeatherProvider =
    FutureProvider.family<CurrentWeatherModel?, String?>((ref, cityName) async {
  if (cityName == null) {
    return null;
  }

  final params = {
    'key': AppConstants.weatherApiKey,
    'q': cityName,
    'aqi': 'no',
  };
  final url = Uri.parse(ApiConstants.currentWeatherUrl)
      .replace(queryParameters: params);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final currentWeatherJson = json.decode(response.body);
    final currentWeather = CurrentWeatherModel.fromJson(currentWeatherJson);
    return currentWeather;
  } else {
    EasyLoading.showError('Api fetching status code !=200');
    return null;
  }
});

/// Search City List Provider

final searchWeatherProvider =
    FutureProvider.family<List<SearchWeatherModel>, String?>(
        (ref, queryString) async {
  print('query: $queryString');
  final params = {
    'key': AppConstants.weatherApiKey,
    'q': queryString,
  };
  if (queryString == null) {
    return [];
  }

  final url =
      Uri.parse(ApiConstants.searchWeatherUrl).replace(queryParameters: params);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return searchWeatherModelFromJson(response.body);
  }
  return [];
});
