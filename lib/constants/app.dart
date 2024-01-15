// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static int versionCode = 0; //Updated from env.json file.
  static String versionName = ""; //Updated from env.json file.
  static String name = "boilerplate"; //Updated from env.json file.
  static String apiBaseUrl = "";

  ///Updated from env.json file.

  static get context => navigatorKey.currentContext;
}
