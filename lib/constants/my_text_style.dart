import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle getBodyCustom(
      {Color? color,
      FontWeight? fontWeight = FontWeight.w600,
      double? fontSize}) {
    return TextStyle(
        fontFamily: '.SF Pro Text',
        height: 1.4,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color);
  }

  static TextStyle getBodyLarge({
    Color? color,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
        fontFamily: '.SF Pro Text',
        height: 1.4,
        fontWeight: fontWeight,
        fontSize: 22,
        color: color);
  }

  static TextStyle getBodyMedium({
    Color? color,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
        fontFamily: '.SF Pro Text',
        height: 1.4,
        fontWeight: fontWeight,
        fontSize: 16,
        color: color);
  }

  static TextStyle getBodySmall({
    Color? color,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
        fontFamily: '.SF Pro Text',
        height: 1.4,
        fontWeight: fontWeight,
        fontSize: 14,
        color: color);
  }
}
