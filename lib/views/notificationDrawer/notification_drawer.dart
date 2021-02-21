import 'package:flutter/material.dart';

class NotificationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
          child: Drawer(
            child: Container(
          color: Colors.white,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
