import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String error;
  final Color iconColor;
  final String hintText;
  final Color backgroundColor;
  const RoundedPasswordField(
      {Key key,
      this.iconColor,
      this.onChanged,
      this.error,
      @required this.hintText,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        error != null? Text(error, textAlign: TextAlign.left, style: TextStyle(color: Colors.red, fontSize: 11),): SizedBox(),
        TextFieldContainer(
          backgroundColor: backgroundColor,
          child: TextField(
            obscureText: true,
            onChanged: onChanged,
            cursorColor: darkColor,
            decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(
                Icons.lock,
                color: iconColor != null ? iconColor : primaryColor,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: primaryColor,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
