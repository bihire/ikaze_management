import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/blocs/newProductBloc/new_product_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/rounded_button.dart';
// import 'package:inventory_controller/components/dropDownSelect/drop_down_select.dart';
// import 'package:inventory_controller/components/selectField/select_field.dart';
import 'package:inventory_controller/views/newProduct/components/body.dart';
// import 'package:inventory_controller/views/newProduct/components/textInput/text_input.dart';
import 'package:inventory_controller/views/newTransaction/components/body.dart';
// import 'package:inventory_controller/views/newTransaction/components/quantityInput/quantity_input.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  final productkey = new GlobalKey<NewProductBodyState>();
  bool _isLoggedIn = false;
  final newProductBloc = NewProductBloc();

  void _updateTransitionType(SharedAxisTransitionType newType) {
    setState(() {
      _transitionType = newType;
    });
  }

  // void _createProduct(a, b, c) {
  //   final createProduct = BlocProvider.of<NewProductBloc>(context);

  //   createProduct.add(CreateProduct(a, b, c));
  // }

  @override
  void dispose() {
    super.dispose();
    newProductBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      
      backgroundColor: primaryLightColor,
      body: BlocProvider(
        create: (BuildContext context) => newProductBloc,
        child: BlocBuilder<NewProductBloc, NewProductState>(
          bloc: newProductBloc,
          builder: (context, state) {
            return PageTransitionSwitcher(
              duration: const Duration(milliseconds: 1500),
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: _transitionType,
                );
              },
              child: state is NewProductLoaded
                  ? NewTransactionBody(
                      state: state,
                    )
                  : NewProductBody(
                      key: productkey,
                      state: state,
                      newProductBloc: newProductBloc),
            );
          },
        ),
      ),
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
                      text: "CREATE PRODUCT",
                      press: () {
                        productkey.currentState!.validateProduct();
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
