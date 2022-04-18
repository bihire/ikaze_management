import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/onScrollShadow/onscrollshadow_cubit.dart';
import 'package:inventory_controller/blocs/newProductBloc/new_product_bloc.dart';
import 'package:inventory_controller/common/constants.dart';

import 'package:inventory_controller/components/dropDownSelect/drop_down_select.dart';
import 'package:inventory_controller/components/errorContainer/error_container.dart';
import 'package:inventory_controller/components/formContainer/form_container.dart';
import 'package:inventory_controller/utils/debounce.dart';
import 'package:inventory_controller/views/newProduct/components/textFieldError/text_field_error.dart';
import 'package:inventory_controller/views/newProduct/components/textInput/text_input.dart';
import 'package:inventory_controller/views/newTransaction/components/quantityInput/quantity_input.dart';

class NewProductBody extends StatefulWidget {
  NewProductState state;
  final NewProductBloc newProductBloc;
  NewProductBody({Key? key, required this.state, required this.newProductBloc})
      : super(key: key);

  @override
  NewProductBodyState createState() => NewProductBodyState();
}

class NewProductBodyState extends State<NewProductBody> {
  final newProductBloc = NewProductBloc();
  final regalphanumeric = RegExp(r'^([a-zA-Z0-9]{3,25})+$');
  // final regnumeric = RegExp(r'^([0-9]{3,25})+$');
  final Debouncer debounce = Debouncer(milliseconds: 500);
  final GlobalKey<FormContainerState> globalErrorKey = new GlobalKey<FormContainerState>();
  String title = '';
  int unitPrice = 0;
  List<String> items = ['Kilogram', 'Item', 'Package'];
  late String unitQty;

  late ScrollController _scrollController;
  String titleErr = '';
  String unitPriceErr = '';
  String unitQtyErr = '';

  late OnscrollshadowCubit onscrollshadowCubit;

  @override
  void initState() {
    onscrollshadowCubit = OnscrollshadowCubit();
    unitQty = items[0];
    _scrollController = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.extentBefore == 0.0 &&
        onscrollshadowCubit.state.isShadow == true) {
      onscrollshadowCubit.removeShadow();
    } else if (_scrollController.position.extentBefore != 0.0 &&
        onscrollshadowCubit.state.isShadow == false) {
      onscrollshadowCubit.addShadow();
    }
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

  void scrollToTop() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      globalErrorKey.currentState!.controller.animateTo(
          globalErrorKey.currentState!.controller.position.minScrollExtent,
          duration: const Duration(milliseconds: 600),
          curve: Curves.decelerate);
    });
  }

  @override
  void dispose() {
    super.dispose();
    newProductBloc.close();
  }

  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FormContainer(
      key: globalErrorKey,
      appBar: AppBar(
          backgroundColor: primaryLightColor,
          // titleSpacing: widget.appBar.titleSpacing,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 4,
          shadowColor: lightGreyColor,
          automaticallyImplyLeading: true),
        error: widget.newProductBloc.state.error,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 40, bottom: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Add Product +',
              style: TextStyle(
                  fontSize: 27, fontWeight: FontWeight.w700, color: darkColor),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(
          child: Errorcontainer(
            scrollTop: scrollToTop,
            error: widget.state is NewProductError ? widget.state.error : null,
            close: () => {},
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: size.height * 0.03),
        ),
        SliverToBoxAdapter(
          child: _buildTitle('Product Name'),
        ),
        SliverToBoxAdapter(
          child: TextInput(
            error: titleErr,
            onChange: (String value) {
              setState(() {
                title = value;
                titleErr = '';
              });
            },
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: _buildTitle('Unit Quantity'),
        ),
        SliverToBoxAdapter(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldError(unitQtyErr),
                  DropDownSelect(
                    items: items,
                    unitQty: unitQty,
                    onChanged: (String? value) => setState(() {
                      unitQty = value!;
                      unitQtyErr = '';
                    }),
                  ),
                ],
              )),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: _buildTitle('Unit Price'),
        ),
        SliverToBoxAdapter(
          child: QuantityInput(
              error: unitPriceErr,
              leading: 'rwf',
              onChanged: (String value) => {
                    setState(() {
                      unitPrice = int.parse(value == '' ? '0' : value);
                      unitPriceErr = '';
                    })
                  }),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 140,
          ),
        ),
        // SliverToBoxAdapter(
        //   child: ,
        // ),
      ],
    );
  }

  void validateProduct() {
    if (title == '' ||
        (title != '' && regalphanumeric.hasMatch(title) == false) ||
        unitPrice == 0 ||
        unitPrice < 0) {
      if (title == '') {
        titleErr = '* title is required';
      }
      if (title != '' && regalphanumeric.hasMatch(title) == false) {
        titleErr =
            '* title must be an alphanumeric and between 3 - 25 characters';
      }
      if (unitPrice == 0 || unitPrice < 0) {
        unitPriceErr = '* unit price must be bigger than 0';
      }
      setState(() {});
    } else {
      debounce.run(() =>
          widget.newProductBloc.add(CreateProduct(title, unitPrice, unitQty)));
    }
  }
}
