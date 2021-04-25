import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/views/newTransaction/components/inputNumFormatter/input_num_formatter.dart';

class QuantityInput extends StatelessWidget {
  String leading;
  QuantityInput({Key key, @required this.leading});
  final _amountValidator = RegExInputFormatter.withRegex(
      '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                // color: lightGreyColor,
                border: Border.all(color: lightGreyColor)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
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
                      // hintText: '60',
                      // hintStyle: TextStyle(
                      //   color: hardGreyColor,
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      // filled: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    inputFormatters: [_amountValidator],
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                  ),
                ),
                Text(leading),
              ],
            ),
          )),
          SizedBox(
            width: 10,
          ),
          _RoundeBtn(
            icon: Icon(
              Icons.remove,
              size: 17,
              color: primaryLightColor,
            ),
            color: hardGreyColor,
          ),
          SizedBox(
            width: 15,
          ),
          _RoundeBtn(
            icon: const Icon(
              Icons.add,
              size: 17,
              color: primaryLightColor,
            ),
            color: hardGreyColor,
          )
        ],
      ),
    );
  }
}

class _RoundeBtn extends StatelessWidget {
  final Icon icon;
  final Color color;
  final Function onPressed;
  _RoundeBtn({this.icon, this.onPressed, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.3),
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        padding: EdgeInsets.all(7),
        child: icon);
  }
}
