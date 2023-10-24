import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';
import '../../models/weather_data_daily.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: MyColors.cardColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              forecast,
              style: MyTextStyle.getBodyMedium(
                  color: MyColors.textColorWhite,
                  fontWeight: FontWeight.normal),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40,
                        child: Text(getDay(weatherDataDaily.daily[index].dt),
                            style: MyTextStyle.getBodyMedium(
                              color: MyColors.textColorWhite,
                            )),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                            "assets/images/png/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text("H: ${weatherDataDaily.daily[index].temp!.max}°",
                          style: MyTextStyle.getBodyMedium(
                            color: MyColors.textColorWhite,
                          )),
                      Text("L: ${weatherDataDaily.daily[index].temp!.min}°",
                          style: MyTextStyle.getBodyMedium(
                            color: MyColors.textColorWhite,
                          )),
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
