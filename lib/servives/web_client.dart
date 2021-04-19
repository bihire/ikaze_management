import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class WebClient {
  static String baseUrl = 'http://192.168.43.56:5000/api';

  const WebClient();

  Future<dynamic> get(String path) async {
    await new Future.delayed(const Duration(seconds: 5));
    final http.Response response = await http.Client().get('$baseUrl$path');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    // await new Future.delayed(const Duration(seconds: 5));
    final http.Response response = await http.Client().post(
      '$baseUrl$path',
      body: data,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw json.decode(response.body);
    }
  }
}
