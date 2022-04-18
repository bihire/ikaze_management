import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/newTransactionBloc/new_transaction_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/dropDownSelect/drop_down_select.dart';
import 'package:inventory_controller/components/rounded_button.dart';
import 'package:inventory_controller/components/selectField/select_field.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/views/newTransaction/components/body.dart';
import 'package:inventory_controller/views/newTransaction/components/quantityInput/quantity_input.dart';

class NewTransactionPage extends StatefulWidget {
  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  final newTransactionBloc = NewTransactionBloc();
  final formkey = new GlobalKey<NewTransactionBodyState>();
  
  Widget _buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: hardGreyColor),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    newTransactionBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: primaryLightColor,
      ),
      backgroundColor: primaryLightColor,
      body: BlocBuilder<NewTransactionBloc, NewTransactionState>(
          bloc: newTransactionBloc,
          builder: (context, state) {
            return NewTransactionBody(
              key: formkey,
                // copyWith: copyWith, updateState: setTheState
                );
          }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[100]!))
            ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.white54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: RoundedButton(
                      radius: 4,
                      loading: false,
                      isBtnClickable: true,
                      text: "CREATE TRANSACTION",
                      press: () {
                        formkey.currentState!.validateForm();
                        
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
