import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/dropDownSelect/drop_down_select.dart';
import 'package:inventory_controller/components/selectField/select_field.dart';
import 'package:inventory_controller/views/newProduct/components/textInput/text_input.dart';
import 'package:inventory_controller/views/newTransaction/components/quantityInput/quantity_input.dart';

class NewProductPage extends StatelessWidget {
  Widget _buildTitle(String title) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: hardGreyColor),),);
  }

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
              'Add Product +',
              style: TextStyle(
                  fontSize: 27, fontWeight: FontWeight.w700, color: darkColor),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _buildTitle('Product Name'),
          TextInput(),
          SizedBox(
            height: 20,
          ),
          _buildTitle('Unit Quantity'),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: DropDownSelect(items: ['Kilogram(Kg)', 'Item', 'Package'],)),
          SizedBox(
            height: 20,
          ),
          _buildTitle('Unit Price'),
          QuantityInput(leading: 'rwf',),
          // SelectProduct(),
          // SizedBox(
          //   height: 20,
          // ),
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: 20),
          //     child: DropDownSelect()),
          SizedBox(
            height: 30,
          ),
          // QuantityInput(),
          // SizedBox(
          //   height: 40,
          // ),
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
                      'CREATE PRODUCT',
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
