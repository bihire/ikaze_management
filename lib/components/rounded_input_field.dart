import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String error;
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.iconColor,
    this.error,
    this.backgroundColor,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

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
            onChanged: onChanged,
            cursorColor: darkColor,
            decoration: InputDecoration(
              icon: Icon(
                icon,
                color: iconColor != null ? iconColor: primaryColor,
              ),
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
