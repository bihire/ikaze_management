import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/newProductBloc/new_product_bloc.dart';
import 'package:inventory_controller/blocs/newTransactionBloc/new_transaction_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/dropDownSelect/drop_down_select.dart';
import 'package:inventory_controller/components/errorContainer/error_container.dart';
import 'package:inventory_controller/components/rounded_button.dart';
import 'package:inventory_controller/components/selectField/select_field.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/views/newProduct/components/textFieldError/text_field_error.dart';
import 'package:inventory_controller/views/newTransaction/components/quantityInput/quantity_input.dart';

class NewTransactionBody extends StatefulWidget {
  NewProductState? state;
  // VoidCallback copyWith;
  // VoidCallback updateState;
  NewTransactionBody({Key? key, this.state}) : super(key: key);

  @override
  NewTransactionBodyState createState() => NewTransactionBodyState();
}

class NewTransactionBodyState extends State<NewTransactionBody> {
  final newTransactionBloc = NewTransactionBloc();
  int price = 0;
  late ProductModel? product;
  int quantity = 0;
  List<String> items = ['Sold', 'Supply'];
  List<String> paidWithOpt = ['CASH', 'MTN momo', 'AIRTEL money'];
  late String type, paidWith;

  String productErr = '';
  String qtyErr = '';
  String priceErr = '';
  // String quantityErr = '';

  void _updateTheProduct(ProductModel value, BuildContext ctxt) {
    setState(() {
      product = value;
    });
    Navigator.pop(ctxt);
  }

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
  void initState() {
    type = items[0];
    product = widget.state != null ? widget.state!.product : null;
    paidWith = paidWithOpt[0];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    newTransactionBloc.close();
  }

  void validateForm() {
    if (product == null || (type == 'Supply' && price == 0) || quantity == 0) {
      if (product == null) {
        productErr = '* product is required';
      }
      if (type == 'Supply' && price == 0) {
        priceErr = '* price must be more than 0';
      }
      if (quantity == 0 || quantity < 0) {
        qtyErr = '* quantity must be more than 0';
      }
      setState(() {});
    } else {
      // final createTransaction =
      //     BlocProvider.of<NewTransactionBloc>(
      //         context);
      print('bro it works in way');

      // createTransaction.add(CreateTransaction(
      //     product!.id,
      //     quantity,
      //     price,
      //     type,
      //     paidWith,
      //     context));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<NewTransactionBloc, NewTransactionState>(
        bloc: newTransactionBloc,
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                // call this method here to hide soft keyboard
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Material(
                color: primaryLightColor,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 70),
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Let\'s add 1st stock',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: darkColor),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Errorcontainer(
                      error: state.error,
                      scrollTop: (){},
                      close: () {
                        final cancelTransactionError =
                            BlocProvider.of<NewTransactionBloc>(context);

                        cancelTransactionError.add(CancelTransactionError());
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    _buildTitle('Product Name'),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldError(productErr),
                          SelectProduct(
                              setProduct: _updateTheProduct,
                              type: type,
                              unitPriceErr: priceErr,
                              selectable: widget.state == null ? true : false,
                              product: product,
                              onChange: (String value) {
                                setState(() {
                                  price = int.parse(value == '' ? '0' : value);
                                  priceErr = '';
                                });
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildTitle('Entry Type'),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropDownSelect(
                              items: items,
                              unitQty: type,
                              onChanged: (String? value) => setState(() {
                                type = value!;
                                priceErr = '';
                              }),
                            ),
                          ],
                        )),
                    _buildTitle('Paid Using'),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropDownSelect(
                              items: paidWithOpt,
                              unitQty: paidWith,
                              onChanged: (String? value) => setState(() {
                                paidWith = value!;
                              }),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    _buildTitle('Quantity'),
                    QuantityInput(
                        error: qtyErr,
                        leading: 'kg',
                        // widget.state!.product!.unitQuantity == 'Kilogram'
                        //     ? 'kg'
                        //     : widget.state!.product!.unitQuantity,
                        onChanged: (String value) => {
                              setState(() {
                                quantity = int.parse(value == '' ? '0' : value);
                                qtyErr = '';
                              })
                            }),
                    SizedBox(
                      height: 40,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       margin: EdgeInsets.symmetric(horizontal: 20),
                    //       child: RoundedButton(
                    //         loading: state is NewTransactionLoading,
                    //         radius: 4,
                    //         isBtnClickable: true,
                    //         text: "CREATE TRANSACTION",
                    //         press: () => validateForm(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ));
        });

    
  }
}
