import 'package:flutter/material.dart';
import 'package:inventory_controller/components/sticky_header_list.dart';

class ListSticky extends StatelessWidget {
  const ListSticky({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Item(
      text: 'List Example',
      builder: (_) => const ListExample(),
    );
    // ListView(
    //   children: <Widget>[

    // _Item(
    //   text: 'Grid Example',
    //   builder: (_) => const GridExample(),
    // ),
    // _Item(
    //   text: 'Not Sticky Example',
    //   builder: (_) => const NotStickyExample(),
    // ),
    // _Item(
    //   text: 'Side Header Example',
    //   builder: (_) => const SideHeaderExample(),
    // ),
    // _Item(
    //   text: 'Animated Header Example',
    //   builder: (_) => const AnimatedHeaderExample(),
    // ),
    // _Item(
    //   text: 'Reverse List Example',
    //   builder: (_) => const ReverseExample(),
    // ),
    // _Item(
    //   text: 'Mixing other slivers',
    //   builder: (_) => const MixSliversExample(),
    // ),
    //   ],
    // );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key key,
    @required this.text,
    @required this.builder,
  }) : super(key: key);

  final String text;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: InkWell(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: builder)),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
