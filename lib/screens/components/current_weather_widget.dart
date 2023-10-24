import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: currentWeatherMoreDetailsWidget(),
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIconDetail(icon: iconSun),
            buildIconDetail(
              icon: iconWind,
              color: MyColors.iconGrey,
            ),
            buildIconDetail(icon: iconClound),
            buildIconDetail(
              icon: iconHumidity,
              color: MyColors.iconRed,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildDetail(text: "${weatherDataCurrent.current.feelsLike}"),
            buildDetail(text: "${weatherDataCurrent.current.windSpeed}km/h"),
            buildDetail(text: "${weatherDataCurrent.current.clouds}%"),
            buildDetail(text: "${weatherDataCurrent.current.humidity}%"),
          ],
        )
      ],
    );
  }

  Widget buildDetail({required String text}) {
    return SizedBox(
      height: 20,
      width: 60,
      child: Text(text,
          textAlign: TextAlign.center,
          style: MyTextStyle.getBodySmall(
            color: MyColors.textColorWhite,
          )),
    );
  }

  Widget buildIconDetail({required String icon, Color? color}) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: MyColors.cardColor, borderRadius: BorderRadius.circular(15)),
      child: Image.asset(
        icon,
        color: color,
      ),
    );
  }
}
