import 'package:flutter/material.dart';
import 'package:inventory_controller/components/bottom_bar_navigation_pattern/animated_bottom_bar.dart';
import 'package:inventory_controller/components/sticky_list_try.dart';
import 'package:inventory_controller/containers/homePage/sold_entry_container.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Lime new-entries', style: TextStyle(color: Colors.black),),
      ),
      body: SizedBox(
        child: PageView(
          
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => selectedBarIndex= index);
          },
          children: <Widget>[
            
            ListView(
              shrinkWrap: true,
              children: <Widget>[
              
              // Container(color: Colors.purple, child: NewEntryPage(),),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                  alignment: Alignment.topLeft,
                  child: NewEntryPage()),
            ],),
            Expanded(
              child: 
              // Example()
              SoldEntryContainer()
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedBarIndex,
        onItemSelected: (index) {
          setState(() => selectedBarIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Sold-entries'),
            icon: Icon(Icons.assignment_returned)
          ),
          BottomNavyBarItem(
            title: Text('New-entries'),
            icon: Icon(Icons.apps)
          ),
        ],
        ),
    );
  }
}
