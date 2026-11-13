import 'package:adminpanel/features/dashboard/api_status_widget.dart';
import 'package:adminpanel/features/dashboard/clock.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Hora Actual",
            style: TextStyle(
              color: Color.fromARGB(100, 100, 100, 0),
              fontSize: 48,
            ),
          ),
          Clock(),
          ApiStatusWidget()
        ],
      ),
    );
  }
}
