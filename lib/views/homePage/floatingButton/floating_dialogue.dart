import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/containers/productList/product_list_container.dart';
import 'package:inventory_controller/models/productList/product_list.dart';
import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ProductListDialog extends StatefulWidget {
  ProductListDialog({
    this.loading,
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
                PopupAppbarScreen(underLine: scrollPos),
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
  final bool loading;
  final List<ProductModel> products;
  final bool error;

  void _loadpageState() {}

  ProductListScreen(
      {@required this.loading, @required this.products, @required this.error});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return loading
        ? ListView.separated(
            separatorBuilder: (ctx, i) {
              return Divider(
                height: 1,
              );
            },
            itemBuilder: (ctx, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.radio_button_unchecked,
                      color: primaryColor,
                      size: 7.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    SkeletonAnimation(
                      shimmerColor: Colors.white24,
                      child: Container(
                        width: (width) - 90,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 4,
          )
        : ListView.separated(
            // physics: BouncingScrollPhysics(
            //     parent: const AlwaysScrollableScrollPhysics()), // new
            // controller: _scrollController,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            itemCount: products.length,
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
              );
            },
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                highlightColor: primaryColor.withOpacity(.4),
                splashColor: primaryColor,
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductDetail()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 3),
                  // width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.radio_button_unchecked,
                        color: primaryColor,
                        size: 7.0,
                      ),
                      SizedBox(
                        width: 20.0,
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
            },
          );
  }
}
