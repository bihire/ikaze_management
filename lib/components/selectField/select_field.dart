import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/containers/productList/product_list_container.dart';
import 'package:inventory_controller/models/product/product.dart';
// import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
import 'package:inventory_controller/views/newTransaction/components/quantityInput/quantity_input.dart';
// import 'package:task_force_challenge/common/constants.dart';
// import 'package:task_force_challenge/components/cardLeadingTitle/card_leading_title.dart';

class SelectProduct extends StatefulWidget {
  Function? setProduct;
  Function(String) onChange;
  bool selectable;
  String unitPriceErr;
  ProductModel? product;
  String type;
  SelectProduct(
      {this.selectable = true,
      this.product,
      this.setProduct,
      required this.type,
      required this.unitPriceErr,
      required this.onChange});

  @override
  _SelectProductState createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
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

  void _tripShowModalBottomSheet(context) {
    // showRoundedModalBottomSheet(
    //     context: context,
    //     builder: (context) => _buildBottomSheetChild()
    // );
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              height: height * 0.64,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: 30, maxWidth: width * 0.4),
                      child: Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(bottom: 7),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey,
                          ),
                          height: 5,
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: PopupAppbarScreen(underLine: false),
                  // ),
                  Expanded(
                      child:
                      ProductListContainer(
                          setProduct: widget.setProduct!,
                          selectable: true,
                          product: widget.product)
                          )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 350),
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onTap: !widget.selectable
                    ? () {}
                    : () {
                        _tripShowModalBottomSheet(context);
                      },
                child: Container(
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                              widget.product != null
                                  ? widget.product!.productName
                                  : 'Choose product',
                              style: TextStyle(
                                  color: hardGreyColor,
                                  fontSize: widget.product != null ? 16 : 12,
                                  fontWeight: widget.product != null
                                      ? FontWeight.w500
                                      : FontWeight.w400))),
                      !widget.selectable
                          ? SizedBox(
                              height: 20,
                            )
                          : Container(
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: hardGreyColor,
                                size: 20,
                              ),
                            )
                    ],
                  ),
                ),
              ),
            )),
        SizedBox(
          height: 30,
        ),
        _buildTitle('Unit Price'),
        QuantityInput(
            salePrice: widget.product != null ? widget.product!.unitPrice : 0,
            fixed: widget.type == 'Sold' ? true : false,
            error: widget.unitPriceErr,
            leading: 'rwf',
            onChanged: widget.onChange),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           Container(
        //             width: 100,
        //             decoration: BoxDecoration(
        //               color: lightGreyColor,
        //               borderRadius: BorderRadius.circular(4),
        //             ),
        //             height: 40,
        //           ),
        //           SizedBox(height: 5),
        //           Container(
        //               padding: EdgeInsets.only(right: 4),
        //               child: Text(
        //                 'Unit price',
        //                 style: TextStyle(color: hardGreyColor, fontSize: 12),
        //                 textAlign: TextAlign.right,
        //               ))
        //         ],
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
