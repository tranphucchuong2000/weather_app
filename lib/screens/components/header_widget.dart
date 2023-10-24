import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';
import '../../controllers/weather_controller.dart';
import '../../models/weather_data_current.dart';

class HeaderWidget extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const HeaderWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final WeatherController controller = Get.put(WeatherController());

  @override
  void initState() {
    getAddress(
      controller.getLattitude().value,
      controller.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.administrativeArea!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          date,
          style: MyTextStyle.getBodyMedium(
            fontWeight: FontWeight.w300,
            color: MyColors.textColorWhite,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          city,
          style: MyTextStyle.getBodyLarge(
              color: MyColors.textColorWhite, fontWeight: FontWeight.w400),
        ),
        Text(
          "${widget.weatherDataCurrent.current.temp!.toInt()}°",
          style: MyTextStyle.getBodyCustom(
            fontWeight: FontWeight.w300,
            fontSize: 68,
            color: MyColors.textColorWhite,
          ),
        ),
        Text(
          "${widget.weatherDataCurrent.current.weather![0].description!.capitalize}",
          style: MyTextStyle.getBodyLarge(
            fontWeight: FontWeight.w400,
            color: MyColors.textColorWhite,
          ),
        ),
      ],
    );
  }
}
