import 'package:flutter/material.dart';
import 'package:inventory_controller/components/bottom_bar_navigation_pattern/animated_bottom_bar.dart';
import 'package:inventory_controller/components/custom_tabs.dart';
import 'package:inventory_controller/components/sticky_list_try.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/new_entry_container.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/new_entry_history_container.dart';
import 'package:inventory_controller/containers/entryPage/SoldEntry/sold_entry_container.dart';
import 'package:inventory_controller/models/productList/product_list.dart';

import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';

class ProductDetail extends StatefulWidget {
  final ProductInfoModel productInfo;
  ProductDetail({
    this.productInfo,
  });
  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State {
  

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
//                 physics: BouncingScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[];
                },
                body: PageView( // this is a pageView container
                  children: <Widget>[
                    CustomScrollView(
                      slivers: [
                       SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ListTile(
                                title: Text('index $index'),
                              );
                            },
                            childCount: 15
                          ),
                        )
                       ]
                    ),
                    CustomScrollView(
                      slivers: [
                       // whatever nonesense, 
                       ]
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
//               child: 
            )
          ],
        ),
      ),
    );
  }
}
