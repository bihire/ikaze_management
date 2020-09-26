import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key key,
    @required this.title,
    @required this.slivers,
    this.reverse = false,
  }) : super(key: key);

  final String title;
  final List<Widget> slivers;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return DefaultStickyHeaderController(
      child: CustomScrollView(
        slivers: slivers,
        reverse: reverse,
      ),
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text(title),
      //   ),
      //   body: CustomScrollView(
      //     slivers: slivers,
      //     reverse: reverse,
      //   ),
      //   floatingActionButton: const _FloatingActionButton(),
      // ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.adjust),
      backgroundColor: Colors.green,
      onPressed: () {
        final double offset =
            DefaultStickyHeaderController.of(context).stickyHeaderScrollOffset;
        PrimaryScrollController.of(context).animateTo(
          offset,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    this.index,
    this.title,
    this.color = Colors.white,
  }) : super(key: key);

  final String title;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          
          padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 7.0),
          alignment: Alignment.centerLeft,
          child: Text(
            title ?? 'today',
            style: const TextStyle(color: Color(0xFFBEB501)),
          ),
        )
      ],
    );
  }
}

class HeaderDatePicker extends StatelessWidget {
  // const HeaderDatePicker({
  //   Key key,
  //   this.title,
  //   this.color = Colors.white,
  // }) : super(key: key);

  // final String title;
  // final int index;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 7.0),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20),
          //   color: color,
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withOpacity(0.5),
          //       spreadRadius: 1,
          //       blurRadius: 7,
          //       offset: Offset(2, 3), // changes position of shadow
          //     ),
          //   ],
          // ),
          
          padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 7.0),
          alignment: Alignment.centerLeft,
          child: Container(
            width: width,
            color: Colors.white,
            child: Center(child: Text(
            'bruh',
            style: const TextStyle(color: Color(0xFFBEB501)),
          ),),
          )
          
        )
      ],
    );
  }
}
