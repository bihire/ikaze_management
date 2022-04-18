import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/main.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/utils/http_error.dart';

// String token =
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJmYW50YXN0aWM3QGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6ImJpaGlyZSIsInJvbGUiOiJzdXBlci1hZG1pbmlzdHJhdG9yIiwiaW1hZ2VfdXJsIjpudWxsLCJpYXQiOjE2MjEwMDEzNDF9.tjyPIcdDc0H79eKyIeOrDefUVEWY_bX5A00M6liwLhc';

String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJmYW50YXN0aWM3QGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6ImJpaGlyZSIsInJvbGUiOiJhZG1pbmlzdHJhdG9yIiwiaW1hZ2VfdXJsIjpudWxsLCJpYXQiOjE2MzIwOTgyODR9.DlEXJT-EzJzgI53A8YUrRaBAaYZkb1gK5ot705J3Bm0';

class WebClient {
  static String baseUrl = 'http://192.168.1.72:5000/api';

  const WebClient();

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw InvalidInputException(json.decode(response.body)['error']);
      case 403:
        throw UnauthorisedException(json.decode(response.body)['error']);
      case 404:
        throw json.decode(response.body)['message'];
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }

  Future<dynamic> get(String path) async {
    final String? token = await getString('token');
    final Map<String, String> map = {};
    if (token == null) {
      throw map['message'] = 'no token available';
    }
    final requestHeaders = {
      // "content-type": "application/json",
      "token": "token $token",
    };
    try {
      final http.Response response = await http.Client()
          .get(Uri.parse('$baseUrl$path'), headers: requestHeaders);
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> authpost(String path, Map<String, dynamic> data) async {
    try {
      final http.Response response = await http.Client().post(
        Uri.parse('$baseUrl$path'),
        body: data,
      );
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    // final String? token = await getString('token');
    final Map<String, String> map = {};
    if (token == null) {
      throw map['message'] = 'no token available';
    }

    final requestHeaders = {
      "content-type": "application/json",
      'Authorization': 'Bearer $token',
    };

    try {
      print('post start');
      final http.Response response = await http.Client()
          .post(Uri.parse('$baseUrl$path'), body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Bearer $token',
      });
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(String path, Map<String, dynamic> data) async {
    final String? token = await storage.read(key: 'token');
    final Map<String, String> map = {};
    if (token == null) {
      throw map['message'] = 'no token available';
    }

    try {
      final http.Response response = await http.Client()
          .put(Uri.parse('$baseUrl$path'), body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Bearer $token',
      });
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> delete(String path) async {
    // final storage = new FlutterSecureStorage();
    // final token = await storage.read(key: 'token');
    await new Future.delayed(const Duration(seconds: 5));
    final requestHeaders = {"content-type": "application/json"};
    requestHeaders['token'] =
        'token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJmYW50YXN0aWM3QGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6ImJpaGlyZSIsInJvbGUiOiJzdXBlci1hZG1pbmlzdHJhdG9yIiwiaW1hZ2VfdXJsIjpudWxsLCJpYXQiOjE2MjEwMDEzNDF9.tjyPIcdDc0H79eKyIeOrDefUVEWY_bX5A00M6liwLhc';

    final http.Response response = await http.Client()
        .delete(Uri.parse('$baseUrl$path'), headers: requestHeaders);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw json.decode(response.body);
    }
  }
}
