import 'package:flutter/material.dart';

class DailyTotal extends StatefulWidget {
  DailyTotal({
    required this.isDataLoading,
    required this.noError,
  });

  final bool isDataLoading;
  final bool noError;
  @override
  _DailyTotalState createState() => _DailyTotalState();
}

class _DailyTotalState extends State<DailyTotal> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
