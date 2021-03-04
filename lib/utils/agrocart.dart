import 'package:flutter/material.dart';

class AgrocartUniversal {
  static const String app_name = "agrocart";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = false;
  static Color contrastColor = Color(0xff8EE80E);
  static Color contrastColorLight = Color(0xffcff597);

  static List<BoxShadow> customBoxShadow = [
    BoxShadow(
        color: Colors.black.withOpacity(0.075),
        blurRadius: 7,
        offset: Offset(
          7,
          7,
        )),
    BoxShadow(
        color: Colors.black.withOpacity(0.015),
        blurRadius: 7,
        offset: Offset(
          -7,
          -7,
        )),
  ];
}
