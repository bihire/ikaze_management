import 'package:flutter/material.dart';
import 'package:inventory_controller/components/bottom_bar_navigation_pattern/animated_bottom_bar.dart';
import 'package:inventory_controller/components/custom_tabs.dart';
import 'package:inventory_controller/components/sticky_list_try.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/new_entry_container.dart';
import 'package:inventory_controller/containers/entryPage/SoldEntry/sold_entry_container.dart';

import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State {
  int selectedBarIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  Material(
          child: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  // SliverPersistentHeader(
                  //   delegate: PersistentHeader(
                  //     widget: 
                  //     CustomTabs(
                  //       tabs: [
                  //         Tab(
                  //           text: "Products",
                  //         ),
                  //         Tab(
                  //           text: "Shops",
                  //         ),
                  //       ],
                  //     )
                  //   ),
                  //   pinned: true,
                  // ),
                  
                ];
              },
              body: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        NewEntryContainer(),
                        SoldEntryContainer()
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
          
      ),
    );
    // PageView(
          
    //       controller: _pageController,
    //       onPageChanged: (index) {
    //         setState(() => selectedBarIndex= index);
    //       },
    //       children: <Widget>[
    //         Expanded(
    //           child: NewEntryContainer()),
    //         Expanded(
    //           child: 
    //           // Example()
    //           SoldEntryContainer()
    //         ),
    //       ],
    //     );
    
    // Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     title: Text('Lime new-entries', style: TextStyle(color: Colors.black),),
    //   ),
    //   body: SizedBox(
    //     child: 
    //   ),
    //   bottomNavigationBar: BottomNavyBar(
    //     selectedIndex: selectedBarIndex,
    //     onItemSelected: (index) {
    //       setState(() => selectedBarIndex = index);
    //       _pageController.jumpToPage(index);
    //     },
    //     items: <BottomNavyBarItem>[
    //       BottomNavyBarItem(
    //         title: Text('Sold-entries'),
    //         icon: Icon(Icons.assignment_returned)
    //       ),
    //       BottomNavyBarItem(
    //         title: Text('New-entries'),
    //         icon: Icon(Icons.apps)
    //       ),
    //     ],
    //     ),
    // );
  }
}
