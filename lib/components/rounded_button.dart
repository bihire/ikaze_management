import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final bool loading;
  final bool isBtnClickable;
  final Function press;
  final Color color, textColor;

  RoundedButton({
    Key key,
    this.text,
    this.loading,
    this.isBtnClickable,
    this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

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
        width: size.width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
