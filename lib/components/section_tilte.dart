import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          width: width,
          margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
          child: Text(title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
        );
  }
}
