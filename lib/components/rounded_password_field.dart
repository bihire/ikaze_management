import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool visibility;
  final Function() changeVisibility;
  final Color? iconColor, backgroundColor;
  final String? hintText, error;
  const RoundedPasswordField(
      {Key? key,
      this.iconColor,
      required this.onChanged,
      this.error,
      this.visibility = false ,
      required this.hintText,
      required this.changeVisibility,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        error != null? Text(error!, textAlign: TextAlign.left, style: TextStyle(color: Colors.red, fontSize: 11),): SizedBox(),
        TextFieldContainer(
          backgroundColor: backgroundColor!,
          child: TextField(
            obscureText: visibility,
            onChanged: onChanged,
            cursorColor: darkColor,
            decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(
                Icons.lock,
                color: iconColor != null ? iconColor : primaryColor,
              ),
              suffixIcon: Transform.translate(
                offset: Offset(15, 0),
                child: IconButton(
                          icon: Icon(
                // Based on passwordVisible state choose the icon
                 visibility
                 ? Icons.visibility
                 : Icons.visibility_off,
                 color: primaryColor,
                 ),
                          onPressed: changeVisibility,
                          ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
