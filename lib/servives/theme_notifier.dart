// import 'package:flutter/material.dart';
// import 'package:inventory_controller/servives/shared_preferences.dart';
// // import '../services/storage_manager.dart';

// class ThemeNotifier with ChangeNotifier {
//   final darkTheme = ThemeData(
//     primarySwatch: Colors.grey,
//     primaryColor: Colors.black,
//     brightness: Brightness.dark,
//     backgroundColor: const Color(0xFF212121),
//     accentColor: Colors.white,
//     accentIconTheme: IconThemeData(color: Colors.black),
//     dividerColor: Colors.black12,
//   );

//   final lightTheme = ThemeData(
//     primarySwatch: Colors.grey,
//     primaryColor: Colors.white,
//     brightness: Brightness.light,
//     backgroundColor: const Color(0xFFE5E5E5),
//     accentColor: Colors.black,
//     accentIconTheme: IconThemeData(color: Colors.white),
//     dividerColor: Colors.white54,
//   );

//   late ThemeData _themeData;
//   ThemeData getTheme() => _themeData;

//   ThemeNotifier() {
//     getString('theme').then((value) {
//       print('value read from storage: ' + value.toString());
//       var themeMode = value ?? 'light';
//       if (themeMode == 'light') {
//         _themeData = lightTheme;
//       } else {
//         print('setting dark theme');
//         _themeData = darkTheme;
//       }
//       notifyListeners();
//     });
//   }

//   void setDarkMode() async {
//     _themeData = darkTheme;
//     putString('theme', 'dark');
//     notifyListeners();
//   }

//   void setLightMode() async {
//     _themeData = lightTheme;
//     putString('theme', 'light');
//     notifyListeners();
//   }
// }
