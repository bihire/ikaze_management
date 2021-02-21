import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/containers/homePage/daily_total.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/barChart_with_tab.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';


import 'components/persistent_header.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({
    Key key,
    this.loading,
    this.isNextPageAvailable,
    this.transactions,
    this.refresh,
    this.loadNextPage,
    this.noError,
  });

  final bool loading;
  final bool isNextPageAvailable;
  final transactions;
  final Function refresh;
  final Function loadNextPage;
  final bool noError;
  @override
  State<StatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //           backgroundColor: Colors.white,
          //           pinned: true,
          //           titleSpacing: 0,
          //           elevation: 3,
          //           automaticallyImplyLeading: false,
          //           title: Row(
          //             children: [
          //               Container(
          //                 child: LeadingButton(
          //                   color: lightShadeColor,
          //                   icon: Icons.arrow_back_ios_outlined,
          //                   iconColor: darkColor,
          //                   size: 37, // btnShadow: false
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Container(
          //                   padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          //                   child: Text('Lime new-entries', style: TextStyle(color: Colors.black),)
          //                 ),
          //               ),
          //               Container(
          //                 child: LeadingButton(
          //                   color: lightShadeColor,
          //                   icon: Icons.more_horiz_outlined,
          //                   iconColor: darkColor,
          //                   size: 37, // btnShadow: false
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          SliverToBoxAdapter(
            child: Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      padding:EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                      
                      width: MediaQuery.of(context).size.width * 1,
                      child: DailyTotal()
                      ),
          ),
          SliverToBoxAdapter(
            child: Example(),
          ),
          SliverPersistentHeader(
            delegate: PersistentHeader(
              widget: HeaderDatePicker()
            ),
            pinned: true,
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return MoneyTransactionModelListItem(
                itemIndex: index, transaction: widget.transactions[index]);
                
            }, 
            childCount: widget.transactions.length
            ),
            
            )
          
        ],
      ),
    );
  }
}
