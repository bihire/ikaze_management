import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/dropDownSelect/drop_down_select.dart';
import 'package:inventory_controller/components/selectField/select_field.dart';
import 'package:inventory_controller/views/newTransaction/components/quantityInput/quantity_input.dart';

class NewTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: primaryLightColor,
      ),
      backgroundColor: primaryLightColor,
      body: ListView(
        padding: EdgeInsets.only(bottom: 70),
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Add transaction',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: darkColor),
            ),
          ),
          // AddImage(),
          SizedBox(height: 20,),
          SelectProduct(),
          SizedBox(height: 20,),
          Container( margin: EdgeInsets.symmetric(horizontal: 20),child: DropDownSelect()),
          SizedBox(height: 30,),
          QuantityInput(),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    color: primaryColor,
                    onPressed: () {},
                    child: Text(
                      'CREATE TRANSACTION',
                      style: TextStyle(
                          color: primaryLightColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
