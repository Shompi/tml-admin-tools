import 'package:flutter/material.dart';

import 'dart:async';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  ClockState createState() => ClockState();
}

class ClockState extends State<Clock> {
  String _time = "Getting Current Time...";

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        _time = TimeOfDay.now().format(context);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _time,
        style: TextStyle(
          color: Color.fromARGB(100, 100, 100, 0),
          fontSize: 96,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
