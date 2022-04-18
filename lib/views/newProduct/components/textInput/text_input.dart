import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/views/newProduct/components/textFieldError/text_field_error.dart';
import 'package:inventory_controller/views/newTransaction/components/inputNumFormatter/input_num_formatter.dart';

class TextInput extends StatelessWidget {
  TextInput({Key? key,required this.onChange,required this.error});
  Function(String) onChange;
  String error;
  // final _amountValidator = RegExInputFormatter.withRegex('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldError(error),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    // color: lightGreyColor,
                    border: Border.all(color: hardGreyColor)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: onChange,
                        showCursor: true,
                        autofocus: false,
                        cursorColor: hardGreyColor,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: hardGreyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        // keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.refresh,
                      size: 20,
                      color: hardGreyColor,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoundeBtn extends StatelessWidget {
  final Icon icon;
  final Color color;
  final Function onPressed;
  _RoundeBtn({required this.icon,required this.onPressed,required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(7),
        child: icon);
  }
}
