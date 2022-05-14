import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_information/routes/route_names.dart';
import 'package:weather_information/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.initial,
      routes: routes,
    );
  }
}
