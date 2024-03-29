import 'package:flutter/material.dart';
// import 'package:inventory_controller/components/bottom_bar_navigation_pattern/animated_bottom_bar.dart';
import 'package:inventory_controller/components/custom_tabs.dart';
// import 'package:inventory_controller/components/sticky_list_try.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/new_entry_container.dart';
// import 'package:inventory_controller/containers/entryPage/newEntry/new_entry_history_container.dart';
import 'package:inventory_controller/containers/entryPage/SoldEntry/sold_entry_container.dart';
import 'package:inventory_controller/models/product/product.dart';

// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';

class ProductDetail extends StatefulWidget {
  final ProductInfoModel productInfo;
  ProductDetail({
    required this.productInfo,
  });
  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  DetailSalesContainer(
                    productInfo: widget.productInfo,
                  ),
                  SoldEntryContainer(
                    productInfo: widget.productInfo,
                  )
                ],
              ),
            ),
            Container(
              child: CustomTabs(
                tabs: [
                  Tab(
                    text: "Sold",
                    icon: Icon(Icons.assignment_returned),
                  ),
                  Tab(
                    text: "Supplies",
                    icon: Icon(Icons.apps),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
