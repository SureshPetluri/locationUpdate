import 'package:flutter/material.dart';

import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  final String mobileNumber;
  const OtpScreen({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: Body(mobileNumber: mobileNumber),
    );
  }
}

class Body extends StatelessWidget {
  final String mobileNumber;
  const Body({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "OTP Verification",
              ),
              Text("We sent your code to +91 $mobileNumber"),
              buildTimer(),
              const OtpForm(mobileNumber: ""),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(minutes: 2),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
