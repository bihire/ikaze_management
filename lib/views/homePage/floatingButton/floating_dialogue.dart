import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/checkbox/checkbox.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/components/round_icon_button.dart';
import 'package:inventory_controller/containers/productList/product_list_container.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
// import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ProductListDialog extends StatefulWidget {
  ProductListDialog({
    required this.loading,
  });
  final bool loading;
  @override
  _ProductListDialogState createState() => _ProductListDialogState();
}

class _ProductListDialogState extends State<ProductListDialog> {
  ScrollController _scrollController = ScrollController();

  var scrollPos = false;
  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(_onScroll);
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Material(
            child: Column(
              children: [
                // PopupAppbarScreen(underLine: scrollPos),
                Expanded(child: ProductListContainer())
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _onScroll() {
  //   final currentScroll = _scrollController.position.pixels;
  //   if (currentScroll > 2 && scrollPos == false) {
  //     setState(() {
  //       scrollPos = true;
  //     });
  //   } else if (currentScroll < 2 && scrollPos == true) {
  //     setState(() {
  //       scrollPos = false;
  //     });
  //   }
  // }
}

class ProductListScreen extends StatelessWidget {
  final Function? setProduct;
  final ProductModel? product;
  final bool loading;
  final bool selectable;
  final List<ProductModel> products;
  final String? error;

  Widget _buildGoToDetailBtn(BuildContext context, int index) {
    return InkWell(
      highlightColor: primaryColor.withOpacity(.4),
      splashColor: primaryColor,
      onTap: () {
        Navigator.popAndPushNamed(context, '/product_sales',
            arguments: ProductInfoModel(products[index].id,
                products[index].productName, products[index].unitPrice));
        // Navigator.of(context).pop();

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ProductDetail(
        //             productInfo: ProductInfoModel(
        //                 products[index].id,
        //                 products[index].productName,
        //                 products[index].unitPrice))));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 3),
        // width: MediaQuery.of(context).size.width * 1,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_right,
              color: lightShadeColor,
              size: 25.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              products[index].productName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoToCheckBoxBtn(BuildContext context, int index) {
    return InkWell(
        highlightColor: primaryColor.withOpacity(.4),
        splashColor: primaryColor,
        onTap: () => setProduct!(products[index], context),
        child: RoundCheckbox.withText(
          name: products[index].productName,
          isChecked: product != null && products[index].id == product!.id
              ? true
              : false,
        ));
  }

  ProductListScreen(
      {required this.loading,
      required this.products,
      required this.error,
      this.product,
      this.setProduct,
      this.selectable = false});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              RoundIconButton(
                onPressed: () {},
                icon: Icons.arrow_back,
              ),
              SizedBox(width: 10,),
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'All Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: hardGreyColor),
                  textAlign: TextAlign.center,
                ),
              )),
              SizedBox(
                width: 60,
              ),
              
            ],
          ),
        ),
        Expanded(child: loading
                ? LoadingIndicator()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                    itemCount: products.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                      );
                    },
                    itemBuilder: (BuildContext ctxt, int index) {
                      return selectable
                          ? _buildGoToCheckBoxBtn(ctxt, index)
                          : _buildGoToDetailBtn(ctxt, index);
                    },
                  ))
        
      ],
    );
  }
}
