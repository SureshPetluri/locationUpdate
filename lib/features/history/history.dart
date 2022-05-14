import 'package:flutter/material.dart';

import '../../const.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.history),
      ),
      body: const Center(child: Text(Constants.history)),
    );
  }
}
