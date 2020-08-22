import 'package:flutter/material.dart';
import 'package:inventory_controller/servives/TransactionService.dart';
import './pages/home.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => TransactionService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ikaze management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
