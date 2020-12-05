import 'package:flutter/material.dart';

class PopupAppbarScreen extends StatefulWidget {
  PopupAppbarScreen({
    this.underLine,
    // this.store
  });
  final bool underLine;

  @override
  _PopupAppbarScreenState createState() => _PopupAppbarScreenState();
}

class _PopupAppbarScreenState extends State<PopupAppbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: widget.underLine == true
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ]
            : [],
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Icon(Icons.arrow_back), Icon(Icons.refresh)],
      ),
    );
  }
}
