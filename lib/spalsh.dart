import 'package:flutter/material.dart';
import 'routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, AppRoutes.login));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
                child: Icon(
              Icons.cloud,
              size: 80,
            )),
            Text(
              "Weather Report",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
