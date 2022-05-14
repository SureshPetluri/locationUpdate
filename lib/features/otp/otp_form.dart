import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_information/routes/route_names.dart';

import '../../components/widgets.dart';

class OtpForm extends StatefulWidget {
  final String mobileNumber;

  const OtpForm({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
  TextEditingController pin6 = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    _verifyPhoneNumber();
  }

  var _verificationId = "";
  Future _verifyPhoneNumber() async {
    print("verify phone number is called");
    _auth.verifyPhoneNumber(
        phoneNumber: "+917095311956",
        verificationCompleted: (phonesAuthCredentials) async {
          print("to verify phonesAuthCredentials $phonesAuthCredentials ");
        },
        verificationFailed: (verificationFailed) async {
          print("to verify verificationFailed $verificationFailed ");
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            print("to verify code sent $verificationId $resendingToken");
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {
          print("to verify verificationFailed $verificationId ");
        });
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  Future _sendCodeToFirebase({String? code}) async {
    print("code sent firebase $code");
    if (_verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code!);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            setState(() {
              //Clear textField
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50,
                child: TextFormField(
                  autofocus: true,
                  controller: pin1,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 50,
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  controller: pin2,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: 50,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  controller: pin3,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: 50,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  controller: pin4,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode),
                ),
              ),
              SizedBox(
                width: 50,
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  controller: pin5,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode),
                ),
              ),
              SizedBox(
                width: 50,
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  controller: pin6,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin6FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _sendCodeToFirebase(
                  code:
                      "${pin1.text}${pin2.text}${pin3.text}${pin4.text}${pin5.text}${pin6.text}"
                          .trim());
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
