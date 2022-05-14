import 'package:flutter/material.dart';
import 'package:weather_information/components/button.dart';
import 'package:weather_information/const.dart';
import 'package:weather_information/features/otp/otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "MobileNumber is Required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: Constants.enterMob,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              text: Constants.verify,
              press: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => OtpScreen(
                                mobileNumber: _mobileController.text,
                              )));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
