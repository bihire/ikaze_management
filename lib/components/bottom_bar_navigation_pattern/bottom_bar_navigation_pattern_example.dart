import 'package:flutter/material.dart';
import 'package:inventory_controller/components/bottom_bar_navigation_pattern/animated_bottom_bar.dart';

class BottomBarNavigationPatternExample extends StatefulWidget {
  // final List<BarItem> barItems = [
  //   BarItem(
  //     text: "Sold-entries",
  //     iconData: Icons.assignment_returned,
  //     color: Color(0xFFBEB501),
  //   ),
  //   BarItem(
  //     text: "New-entries",
  //     iconData: Icons.favorite_border,
  //     color: Color(0xFFBEB501),
  //   ),
  // ];

  @override
  _BottomBarNavigationPatternExampleState createState() =>
      _BottomBarNavigationPatternExampleState();
}

class _BottomBarNavigationPatternExampleState
    extends State<BottomBarNavigationPatternExample> {
  int selectedBarIndex = 0;
  late PageController _pageController;

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
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => selectedBarIndex= index);
          },
          children: <Widget>[
            Container(color: Colors.blueGrey,),
            Container(color: Colors.red,),
          ],
        ),
      ),
      // AnimatedContainer(
      //   color: widget.barItems[selectedBarIndex].color,
      //   duration: const Duration(milliseconds: 300),
      // ),
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
      ));
        // )
    //   AnimatedBottomBar(
    //       selectedIndex: selectedBarIndex,
    //       // onItemSelected: (index) {
    //       //   setState(() => selectedBarIndex = index);
    //       //   _pageController.jumpToPage(index);
    //       // },
    //       barItems: widget.barItems,
    //       animationDuration: const Duration(milliseconds: 150),
    //       barStyle: BarStyle(
    //         // fontSize: 20.0,
    //         // iconSize: 30.0
    //       ),
    //       onBarTap: (index) {
    //         setState(() => selectedBarIndex = index);
    //         _pageController.jumpToPage(index);
    //       }),
    // );
  }
}
