import 'dart:convert';

import '../constants/constants.dart';
import '../models/weather_data.dart';
import '../models/weather_data_current.dart';
import '../models/weather_data_daily.dart';
import '../models/weather_data_hourly.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    print("WeatherDataCurrent.fromJson(jsonString) :${jsonString}");
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}
