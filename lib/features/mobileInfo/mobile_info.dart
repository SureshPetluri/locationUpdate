import 'package:flutter/material.dart';

import '../../const.dart';

class MobileInfoScreen extends StatelessWidget {
  const MobileInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.userInfo),
      ),
      body: const Center(child: Text(Constants.userInfo)),
    );
  }
}
