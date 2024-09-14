import 'dart:convert';

import 'package:weather_v2/constants/constants.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  //GET WEATHER DATA
  Future<Map<String, dynamic>> getWeatherData(String locationKey) async {
    final String url =
        '$baseUrl/currentconditions/v1/$locationKey?apikey=$apiKey&details=true';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data[0];
    } else {
      throw Exception('Failed to load weather data: ${response.body}');
    }
  }

  Future<Map<String, dynamic>?> getAirQuality(String locationKey) async {
    final String url =
        '$baseUrl/airquality/v1/currentconditions/$locationKey?apikey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.isNotEmpty ? data[0] : null;
    } else {
      return null;
    }
  }

  Future<String> getLocationKey(String cityName) async {
    final String url =
        '$baseUrl/locations/v1/cities/search?apikey=$apiKey&q=$cityName';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data[0]['Key'];
    } else {
      throw Exception('Failed to load location key: ${response.body}');
    }
  }

  /*Future<void> fetchDate() async {
    final weatherService = WeatherService();
    final today = await weatherService.getTodaysDate();
  }*/

  Future<DateTime> getTodaysDate() async {
    return DateTime.now();
  }
}
