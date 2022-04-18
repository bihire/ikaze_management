// import 'package:companion_app/components/masked_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/text_field_container.dart';
import 'package:inventory_controller/views/homePage/home_menu_page.dart';


class RoundedPhoneNumberField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? error;
  // final Color? iconColor;
  final String? hintText;
  final Color? backgroundColor;
  const RoundedPhoneNumberField(
      {Key? key,
      // this.iconColor,
      this.onChanged,
      this.error,
      @required this.hintText,
      this.backgroundColor})
      : super(key: key);

  @override
  _RoundedPhoneNumberFieldState createState() => _RoundedPhoneNumberFieldState();
}

class _RoundedPhoneNumberFieldState extends State<RoundedPhoneNumberField> {
  // var maskedController = MaskedTextController(mask: '(000) 000-0000');
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.error != null
            ? Text(
                widget.error ?? "",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.red, fontSize: 11),
              )
            : SizedBox(),
        TextFieldContainer(
          backgroundColor: widget.backgroundColor!,
          child: TextField(
            // controller: maskedController,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1),
            onChanged: widget.onChanged,
            cursorColor: darkColor,
            decoration: InputDecoration(
              counterText: "",
              hintText: widget.hintText,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/flag.png'),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '+ 250',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  )
                ],
              ),
              border: InputBorder.none,
            ),
            maxLength: 9,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]{0,8}')),
            ],
          ),
        ),
      ],
    );
  }
}
