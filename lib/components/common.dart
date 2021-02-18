import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:inventory_controller/common/debouncer.dart';
import 'package:inventory_controller/components/container_transition.dart';
import 'package:animations/animations.dart';
import 'package:inventory_controller/components/custom_appbar.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/product_range.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key key,
    @required this.title,
    @required this.slivers,
    @required this.isDataLoading,
    @required this.isNextPageAvailable,
    this.loadNextPage,
    this.reverse = false,
  }) : super(key: key);

  final String title;
  final List<Widget> slivers;
  final bool reverse;
  final bool isDataLoading;
  final bool isNextPageAvailable;
  final Function loadNextPage;

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return DefaultStickyHeaderController(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.pixels >=
                  scrollNotification.metrics.maxScrollExtent &&
              !isDataLoading &&
              isNextPageAvailable) {
            _debouncer.run(() => loadNextPage());
          }
          return true;
        },
        child: CustomScrollView(
          slivers: slivers,
          reverse: reverse,
        ),
      ),
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

    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 7.0, left: 7.0, right: 7.0),
        padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 7.0),
                  alignment: Alignment.centerLeft,
        child: OpenContainer(
        closedBuilder: (_, openContainer) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]),
                width: width,
            height: 40,
            child: Center(child: Text('Search by range here...', style: TextStyle(color: Colors.grey[500]),),),
          );
        },
        openColor: Color(0xFFBEB501),
        closedElevation: 0,
        // closedShape: ,
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        // closedColor: Color(0xFFBEB501).withOpacity(0.2),
        openBuilder: (_, closeContainer) {
          return ProductRange();
          
        }),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text('today', style: TextStyle(color: Colors.white),),
      )
    ],);
    ;
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Container(
    //         margin: EdgeInsets.only(top: 7.0),
    //         // color: Colors.white,
    //         // decoration: BoxDecoration(
    //         //   borderRadius: BorderRadius.circular(20),
    //         //   color: color,
    //         //   boxShadow: [
    //         //     BoxShadow(
    //         //       color: Colors.grey.withOpacity(0.5),
    //         //       spreadRadius: 1,
    //         //       blurRadius: 7,
    //         //       offset: Offset(2, 3), // changes position of shadow
    //         //     ),
    //         //   ],
    //         // ),

    //         padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 7.0),
    //         alignment: Alignment.centerLeft,

    //         child: InkWell(
    //           child: Container(
    //           color: Colors.white,
    //           child: Container(
    //           decoration: BoxDecoration(
    //             // border: Border.all(color: Color(0xFFBEB501)),
    //             color: Color(0xFFBEB501).withOpacity(0.2),
    //             borderRadius: BorderRadius.all(
    //                 Radius.circular(5.0) //                 <--- border radius here
    //             ),
    //           ),
    //           width: width,

    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
    //                 child:  Column(
    //                 children: <Widget>[
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: <Widget>[
    //                       Padding(
    //                         padding: EdgeInsets.only(right: 7.0),
    //                         child: Text(
    //                           "From",
    //                           style: TextStyle(
    //                               fontSize: 16.0,
    //                               fontWeight: FontWeight.w600),
    //                           textAlign: TextAlign.right,
    //                         ),
    //                       ),
    //                       // Text(
    //                       //   "kg",
    //                       //   style: TextStyle(
    //                       //       fontSize: 18.0, fontWeight: FontWeight.w600),
    //                       //   textAlign: TextAlign.right,
    //                       // ),
    //                     ],
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text(
    //                         "2020-07-12",
    //                         style: TextStyle(
    //                             fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
    //                         textAlign: TextAlign.right,
    //                       ),
    //                     ],
    //                   ),

    //                   ]
    //                 ),
    //               ),
    //               Container(
    //                 child:  Column(
    //                 children: <Widget>[
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: <Widget>[
    //                       Padding(
    //                         padding: EdgeInsets.only(right: 7.0),
    //                         child: Text(
    //                           "To",
    //                           style: TextStyle(
    //                               fontSize: 16.0,
    //                               fontWeight: FontWeight.w600),
    //                           textAlign: TextAlign.right,
    //                         ),
    //                       ),
    //                       // Text(
    //                       //   "kg",
    //                       //   style: TextStyle(
    //                       //       fontSize: 18.0, fontWeight: FontWeight.w600),
    //                       //   textAlign: TextAlign.right,
    //                       // ),
    //                     ],
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text(
    //                         "2020-07-12",
    //                         style: TextStyle(
    //                             fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
    //                         textAlign: TextAlign.right,
    //                       ),
    //                     ],
    //                   ),

    //                   ]
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         ),
    //         onTap: () {
    //                 Navigator.of(context).push(
    //                   MaterialPageRoute<void>(
    //                     builder: (BuildContext context) {
    //                       return OpenContainerTransformDemo();
    //                     },
    //                   ),
    //                 );
    //               },
    //         ),

    //         )
    //   ],
    // );
  }
}
