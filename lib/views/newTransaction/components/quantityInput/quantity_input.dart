import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/views/newProduct/components/textFieldError/text_field_error.dart';
import 'package:inventory_controller/views/newTransaction/components/inputNumFormatter/input_num_formatter.dart';

class QuantityInput extends StatefulWidget {
  String leading;
  int? salePrice;
  bool fixed;
  String error;
  Function(String) onChanged;
  QuantityInput(
      {Key? key,
      required this.leading,
      required this.onChanged,
      this.fixed = false,
      this.salePrice,
      required this.error});

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  final _amountValidator = RegExInputFormatter.withRegex(
      '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');
  TextEditingController _controller = TextEditingController();

  void _incrementPrice() {
    setState(() {
      _controller =
          TextEditingController(text: '${int.parse(_controller.text) + 1}');
    });
  }

  void _decrementPrice() {
    setState(() {
      _controller =
          TextEditingController(text: '${int.parse(_controller.text) - 1}');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildFixedPrice() {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                decoration:
                    BoxDecoration(
                      // border: Border.all(color: lightGreyColor),
                      borderRadius: BorderRadius.circular(4),
                      color: lightGreyColor
                    ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('${widget.salePrice}', style: TextStyle(
                        color: hardGreyColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.right,
                      )
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.leading,
                      style: TextStyle(color: hardGreyColor.withOpacity(.6)),
                    ),
                  ],
                ),
              );
  }

  Widget _buildPriceInput() {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration:
                    BoxDecoration(border: Border.all(color: hardGreyColor)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: widget.onChanged,
                        controller: _controller,
                        showCursor: true,
                        autofocus: false,
                        cursorColor: hardGreyColor,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: hardGreyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        // keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: '0',
                          hintStyle: TextStyle(
                              color: hardGreyColor.withOpacity(.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
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
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.leading,
                      style: TextStyle(color: hardGreyColor.withOpacity(.6)),
                    ),
                  ],
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldError(widget.error),
          Row(
            children: [
              Expanded(
                  child: 
                  widget.fixed ? _buildFixedPrice()
                  : _buildPriceInput()
                  ),
              SizedBox(
                width: 10,
              ),
              AnimatedOpacity(
                opacity: !widget.fixed ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: _RoundeBtn(
                icon: Icon(
                  Icons.remove,
                  size: 17,
                  color: primaryLightColor,
                ),
                color: hardGreyColor,
                onPressed: !widget.fixed ? _decrementPrice:  () {},
              ),
              ),
              
              SizedBox(
                width: 15,
              ),
              
              AnimatedOpacity(
                opacity: !widget.fixed ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: _RoundeBtn(
                  icon: const Icon(
                    Icons.add,
                    size: 17,
                    color: primaryLightColor,
                  ),
                  color: hardGreyColor,
                  onPressed: !widget.fixed ? _incrementPrice: () {},
                ),
              )
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
  final Function() onPressed;
  _RoundeBtn({required this.icon, required this.onPressed,required this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
          child: icon),
    );
  }
}

