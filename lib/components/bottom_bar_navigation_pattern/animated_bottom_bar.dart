// import 'package:flutter/material.dart';

// class AnimatedBottomBar extends StatefulWidget {
//   final List<BarItem> barItems;
//   final Duration animationDuration;
//   final Function onBarTap;
//   final BarStyle barStyle;
//   final int selectedIndex;

//   AnimatedBottomBar(
//       {this.barItems,
//       this.selectedIndex = 0,
//       this.animationDuration = const Duration(milliseconds: 500),
//       this.onBarTap,
//       this.barStyle});

//   @override
//   _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
// }

// class _AnimatedBottomBarState extends State<AnimatedBottomBar>
//     with TickerProviderStateMixin {
//   int selectedBarIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 10.0,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 10.0,
//           top: 6.0,
//           left: 6.0,
//           right: 6.0,
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: _buildBarItems(),
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildBarItems() {
//     List<Widget> _barItems = List();
//     for (int i = 0; i < widget.barItems.length; i++) {
//       BarItem item = widget.barItems[i];
//       bool isSelected = selectedBarIndex == i;
//       _barItems.add(InkWell(
//         splashColor: Colors.transparent,
//         onTap: () {
//           setState(() {
//             selectedBarIndex = i;
//             widget.onBarTap(selectedBarIndex);
//           });
//         },
//         child: AnimatedContainer(
//           padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
//           duration: widget.animationDuration,
//           decoration: BoxDecoration(
//               color: isSelected
//                   ? item.color.withOpacity(0.15)
//                   : Colors.transparent,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: Row(
//             children: <Widget>[
//               Icon(
//                 item.iconData,
//                 color: isSelected ? item.color : Color(0xFF595959),
//                 size: widget.barStyle.iconSize,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               AnimatedSize(
//                 duration: widget.animationDuration,
//                 curve: Curves.easeInOut,
//                 vsync: this,
//                 child: Text(
//                   item.text,
//                   style: TextStyle(
//                       color: isSelected ? item.color : Color(0xFFBFBFBF),
//                       fontWeight: isSelected
//                           ? widget.barStyle.fontWeight
//                           : FontWeight.w400,
//                       fontSize: widget.barStyle.fontSize),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ));
//     }
//     return _barItems;
//   }
// }

// class BarStyle {
//   final double fontSize, iconSize;
//   final FontWeight fontWeight;

//   BarStyle(
//       {this.fontSize = 16.0,
//       this.iconSize = 22,
//       this.fontWeight = FontWeight.w600});
// }

// class BarItem {
//   String text;
//   IconData iconData;
//   Color color;

//   BarItem({this.text, this.iconData, this.color});
// }
library bottom_navy_bar;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavyBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  final BarStyle barStyle;

  BottomNavyBar({
    Key key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 22,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.barStyle,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    @required this.items,
    @required this.onItemSelected,
    this.curve = Curves.linear,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
    assert(curve != null);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key key,
    @required this.item,
    @required this.isSelected,
    @required this.backgroundColor,
    @required this.animationDuration,
    @required this.itemCornerRadius,
    @required this.iconSize,
    this.curve = Curves.linear,
  })  : assert(isSelected != null),
        assert(item != null),
        assert(backgroundColor != null),
        assert(animationDuration != null),
        assert(itemCornerRadius != null),
        assert(iconSize != null),
        assert(curve != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width:  130 ,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: 130,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor == null
                            ? item.activeColor
                            : item.inactiveColor,
                  ),
                  child: item.icon,
                ),
                // if (isSelected)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        child: item.title,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;

  BottomNavyBarItem({
    @required this.icon,
    @required this.title,
    this.activeColor = const Color(0xFFBEB501),
    this.textAlign,
    this.inactiveColor,
  }) {
    assert(icon != null);
    assert(title != null);
  }
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  BarStyle(
      {this.fontSize = 16.0,
      this.iconSize = 22,
      this.fontWeight = FontWeight.w600});
}