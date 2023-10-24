import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../components/current_weather_widget.dart';
import '../components/daily_data_forecast.dart';
import '../components/header_widget.dart';
import '../components/hourly_data_widget.dart';
import '../constants/constants.dart';
import '../controllers/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.put(WeatherController());

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Obx(() => controller.checkLoading().isTrue
            ? buildLoading()
            : buildWeatherDetails(controller)),
      ),
    );
  }

  Widget buildWeatherDetails(WeatherController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          HeaderWidget(
            weatherDataCurrent: controller.getData().getCurrentWeather(),
          ),
          CurrentWeatherWidget(
            weatherDataCurrent: controller.getData().getCurrentWeather(),
          ),
          const SizedBox(height: 20),
          HourlyDataWidget(
              weatherDataHourly: controller.getData().getHourlyWeather()),
          const SizedBox(height: 20),
          DailyDataForecast(
            weatherDataDaily: controller.getData().getDailyWeather(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Lottie.asset(iconLogo), const CircularProgressIndicator()],
      ),
    );
  }
}
