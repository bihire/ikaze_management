import 'package:flutter/material.dart';

class TextFieldError extends StatelessWidget {
  TextFieldError(this.error);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(error, style: TextStyle(color: Colors.redAccent, fontSize: 12),),
    );
  }
}
