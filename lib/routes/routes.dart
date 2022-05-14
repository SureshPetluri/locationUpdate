import 'package:flutter/cupertino.dart';
import 'package:weather_information/features/history/history.dart';
import 'package:weather_information/features/mobileInfo/mobile_info.dart';
import 'package:weather_information/features/weatherInfo/weather_info.dart';

import '../features/login/login.dart';
import '../features/map/map.dart';
import 'route_names.dart';
import '../spalsh.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  AppRoutes.splash: ((context) => const SplashScreen()),
  AppRoutes.login: ((context) => const LoginScreen()),
  AppRoutes.home: ((context) => MapScreen()),
  AppRoutes.weatherInfo: ((context) => const WeatherInfoScreen()),
  AppRoutes.history: ((context) => const History()),
  AppRoutes.mobileInfo: ((context) => const MobileInfoScreen()),
};
