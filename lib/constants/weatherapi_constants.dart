class ApiConstants {
  ApiConstants._();
  static const String _baseUrl = 'https://api.weatherapi.com/v1';

  static const String currentWeatherUrl = '$_baseUrl/current.json';
  static const String searchWeatherUrl = '$_baseUrl/search.json';
}
//https://api.weatherapi.com/v1/current.json?key=1a027914e10649dbb58175924230803&q=Dhaka&aqi=no