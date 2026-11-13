import 'package:adminpanel/features/dashboard/api_status.dart';
import 'package:flutter/material.dart';

class ApiStatusWidget extends StatefulWidget {
  const ApiStatusWidget({super.key});

  @override
  State<ApiStatusWidget> createState() => _ApiStatusWidgetState();
}

class _ApiStatusWidgetState extends State<ApiStatusWidget> {
  late Future<TMLApiStatus> _apiStatus;
  final TextStyle _textStyle = TextStyle(
    color: Colors.amberAccent,
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  @override
  void initState() {
    super.initState();
    _apiStatus = getApiStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<TMLApiStatus>(
        future: _apiStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text(
              "Ocurrió un error al conectar con la API, ¿La api está offline?",
              style: _textStyle,
            );
          }

          return Text(snapshot.data!.message, style: _textStyle);
        },
      ),
    );
  }
}
