
 import 'package:flutter/material.dart';

  class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      // height: 100.0,
      child: Container(
        margin: EdgeInsets.all(0),
        // color: Colors.blue,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}