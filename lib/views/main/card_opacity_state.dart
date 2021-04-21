
import 'package:flutter/material.dart';

class CardOpacityWidget extends StatefulWidget {
  // final Stream<double> stream;
  final double opacity;
  CardOpacityWidget({this.opacity});
  @override
  State<StatefulWidget> createState() => CardOpacityWidgetState();
}

class CardOpacityWidgetState extends State<CardOpacityWidget> {

  // double opacityToDisplay = 0.0;
  // void _updateSeconds(double newOpacity) {
  //   setState(() {
  //     opacityToDisplay = newOpacity;
  //   });
  // }


  @override
  void initState() {
    super.initState();
    // if (this.mounted) {
    //   // widget.stream.listen((opacity) {
    //   //   _updateSeconds(opacity);
    //   // });
    //   print(widget.opacity);
    // }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AbsorbPointer(
      absorbing: widget.opacity>0.0 ? true : false,
      child: Container(
        // key: Key('$index'),
          width: width,
          color: Color(0xFF000000).withOpacity(widget.opacity)
      ),
    );
  }
}