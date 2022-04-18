import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: lightGreyColor,
          valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),
        ),
      ),
    );
  }
}
