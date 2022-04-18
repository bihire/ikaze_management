import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final bool loading;
  final bool isBtnClickable;
  final Function() press;
  final Color color, textColor;
  final double radius;

  RoundedButton({
    Key? key,
    required this.text,
    required this.loading,
    required this.isBtnClickable,
    required this.press,
    this.radius = 40,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // @override
  // void initState() {
  //   _animationController = new AnimationController(
  //       vsync: this, duration: Duration(milliseconds: 500));
  //   // _animationController.repeat(reverse: true);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _animationController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedOpacity(
      opacity: widget.loading || !widget.isBtnClickable ? .3 : 1,
      duration: Duration(milliseconds: 500),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8 > 220 ? 220 : size.width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: FlatButton(
            padding: EdgeInsets.only(top: 15, right: 30, bottom: 12, left: 30),
            color: widget.color,
            onPressed:
                !widget.loading || widget.isBtnClickable ? widget.press : () {},
            child: widget.loading
                ? Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(primaryLightColor),
                    ),
                  )
                : Container(
                    height: 20,
                    child: Text(
                      widget.text,
                      style: TextStyle(color: widget.textColor),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
