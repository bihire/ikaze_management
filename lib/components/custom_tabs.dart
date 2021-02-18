import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/custom_tab_button.dart';

class CustomTabs extends StatefulWidget {
  final TabController controller;
  final List<Tab> tabs;
  CustomTabs({Key key, this.controller, @required this.tabs}) : super(key: key);
  @override
  CustomTabsState createState() => CustomTabsState();
}

class CustomTabsState extends State<CustomTabs> with TickerProviderStateMixin {
  TabController _controller;
  List<GlobalKey> _tabKeys;
  GlobalKey _tabsContainerKey = GlobalKey();
  int _selectedPage = 0;
  int pageNum;

  double _prevAniValue = 0;
  int _aniIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabKeys = widget.tabs.map((Tab tab) => GlobalKey()).toList();
  }

  _onPressed(int index) {
    if (index != _selectedPage) {
      print(index);
      _setCurrentIndex(index);
      _controller.animateTo(index);
    }
  }

  _handleTabAnimation() {
    _aniIndex = ((_controller.animation.value > _prevAniValue)
            ? _controller.animation.value
            : _prevAniValue)
        .round();
    if (!_controller.indexIsChanging && _aniIndex != _selectedPage) {
      print(_aniIndex);
      setState(() {
        _setCurrentIndex(_aniIndex);
      });
    }
    _prevAniValue = _controller.animation.value;
  }

  _setCurrentIndex(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Widget> _buildTabItems(List<Tab> tabs) {
    double width = MediaQuery.of(context).size.width;
    List<Widget> items = [];
    for (var i = 0; i < tabs.length; i++) {
      items.add(
        CustomTabButton(
            key: _tabKeys[i],
            name: tabs[i].text,
            color: primaryLightColor,
            icon: tabs[i].icon,
            pageNum: i,
            width: width / tabs.length,
            onPressed: _onPressed,
            selectedPage: _selectedPage),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      _controller = widget.controller ?? DefaultTabController.of(context);
      // this will execute the function every time there's a swipe animation
      _controller.animation.addListener(_handleTabAnimation);
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildTabItems(widget.tabs));
  }

  // _scrollTo(int index) {
  //   // get the screen width. This is used to check if we have an element off screen
  //   RenderBox tabsContainer =
  //       _tabsContainerKey.currentContext.findRenderObject();
  //   double screenWidth = tabsContainer.size.width;

  //   // get the button we want to scroll to
  //   RenderBox renderBox = _tabKeys[index].currentContext.findRenderObject();
  //   // get its size
  //   double size = renderBox.size.width;
  //   // and position
  //   double position = renderBox.localToGlobal(Offset.zero).dx;

  //   // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
  //   double offset = (position + size / 2) - screenWidth / 2;

  //   // if the button is to the left of the middle
  //   if (offset < 0) {
  //     // get the first button
  //     renderBox = _tabKeys[0].currentContext.findRenderObject();
  //     // get the position of the first button of the TabBar
  //     position = renderBox.localToGlobal(Offset(-20.0, 0.0)).dx;

  //     // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
  //     if (position > offset) offset = position;
  //   } else {
  //     // if the button is to the right of the middle

  //     // get the last button
  //     renderBox = _tabKeys.last.currentContext.findRenderObject();
  //     // get its position
  //     position = renderBox.localToGlobal(Offset.zero).dx;
  //     // and size
  //     size = renderBox.size.width;

  //     // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
  //     if (position + size < screenWidth) screenWidth = position + size;

  //     // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
  //     if (position + size - offset < screenWidth) {
  //       offset = position + size - screenWidth;
  //     }
  //   }

  //   // scroll the calculated ammount
  //   _scrollController.animateTo(offset + _scrollController.offset,
  //       duration: new Duration(milliseconds: widget.duration),
  //       curve: Curves.easeInOut);
  // }
}