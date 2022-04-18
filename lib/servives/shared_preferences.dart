import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

void sharedPrefInit() async {
  try {
    /// Checks if shared preference exist
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.getString("app-name");
  } catch (err) {
    /// setMockInitialValues initiates shared preference
    /// Adds app-name
    SharedPreferences.setMockInitialValues({});
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("app-name", "my-app");
  }
}

/// Adding an integer value
dynamic putInt(key, val) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setInt("$key", val);
  return _res;
}

/// Adding a string value
dynamic putString(key, val) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setString("$key", val);
  return _res;
}

/// Adding a list or object
/// Use import 'dart:convert'; for jsonEncode
dynamic putJson(key, val) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var valString = jsonEncode(val);
  var _res = prefs.setString("$key", valString);
  return _res;
}

/// Get integer value
/// Argument [key]
dynamic getInt(key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  int? _res = prefs.getInt("$key");
  return _res;
}

/// Get string value
/// Argument [key]
dynamic getString(key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String? _res = prefs.getString("$key");
  return _res;
}

// Get list or object
// Use import 'dart:convert'; for jsonEncode
// Argument [key]
dynamic getJson(key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String? jsonString = prefs.getString("$key");
  var _res = jsonDecode(jsonString!);
  return _res;
}

Future reset() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  prefs.clear();
}
