import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/busdetails.dart';

class backend {
  static Map<String, dynamic>? jsonResponse;

  static Future<dynamic> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.106.136:5000/app/vr1/getallbus"),
      );

      print("Response Body: ${response.body}");
      jsonResponse = json.decode(response.body);
      print(jsonResponse?["bus"].length);

      // if (response.statusCode == 200) {
      //   final Map<String, dynamic> jsonResponse = json.decode(response.body);
      //   print("JSON data: $jsonResponse");
      //
      //   return jsonResponse;
      // } else {
      //   print("Error Response: ${response.body}");
      //   return {'error': 'Failed to load data'};
      // }
    } catch (e) {
      print("Error: $e");
      return {'error': 'Error: $e'};
    }
  }
}
