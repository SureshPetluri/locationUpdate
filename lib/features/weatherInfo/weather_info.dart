import 'package:flutter/material.dart';
import 'package:weather_information/const.dart';

class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({Key? key}) : super(key: key);

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(Constants.weatherInfo),
      ),
      body: Center(child: Text(Constants.weatherInfo)),
    );
  }
}
