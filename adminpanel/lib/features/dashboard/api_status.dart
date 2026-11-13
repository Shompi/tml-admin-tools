import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiStatus extends StatefulWidget {
  const ApiStatus({super.key});

  @override
  _ApiStatusState createState() => _ApiStatusState();
}

class _ApiStatusState extends State<ApiStatus> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TMLApiResponse {
  final String message;
  final int code;
  final String date;
  final TMLApiResponseData data;

  const TMLApiResponse({
    required this.message,
    required this.code,
    required this.date,
    required this.data,
  });

  factory TMLApiResponse.fromJson(Map<String, dynamic> json) {
    return TMLApiResponse(
      message: json['message'] as String,
      code: json['code'] as int,
      date: json['date'] as String,
      data: TMLApiResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class TMLApiResponseData {
  final String platform;
  final String arch;
  final TMLApiResponseSensors sensors;

  const TMLApiResponseData({
    required this.platform,
    required this.arch,
    required this.sensors,
  });

  factory TMLApiResponseData.fromJson(Map<String, dynamic> json) {
    return TMLApiResponseData(
      platform: json['platform'] as String,
      arch: json['arch'] as String,
      sensors: TMLApiResponseSensors.fromJson(
        json['sensors'] as Map<String, dynamic>,
      ),
    );
  }
}

class TMLApiResponseSensors {
  final List<String> cpu_temp;

  TMLApiResponseSensors({required this.cpu_temp});

  factory TMLApiResponseSensors.fromJson(Map<String, dynamic> json) {
    return TMLApiResponseSensors(
      cpu_temp: (json['cpu_temp'] as List).cast<String>(),
    );
  }
}

Future<TMLApiResponse> getApiStatus() async {
  final res = await http.get(Uri.parse("https://api.shompiflen.party"));
  final json = jsonDecode(res.body) as Map<String, dynamic>;

  return TMLApiResponse.fromJson(json);
}
