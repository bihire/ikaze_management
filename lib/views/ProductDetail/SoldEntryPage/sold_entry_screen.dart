import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/barChart_with_tab.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:inventory_controller/views/ProductDetail/SoldEntryPage/components/SoldEntryPage.dart';

import 'components/persistent_header.dart';

class SoldEntryScreen extends StatefulWidget {
  const SoldEntryScreen({
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
  State<StatefulWidget> createState() => SoldEntryPageState();
}

class SoldEntryPageState extends State<SoldEntryScreen> with AutomaticKeepAliveClientMixin <SoldEntryScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
                    backgroundColor: Colors.white,
                    pinned: true,
                    titleSpacing: 0,
                    elevation: 3,
                    automaticallyImplyLeading: false,
                    title: Row(
                      children: [
                        Container(
                          child: LeadingButton(
                            color: lightShadeColor,
                            icon: Icons.arrow_back_ios_outlined,
                            iconColor: darkColor,
                            size: 37, // btnShadow: false
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: Text('Lime supply-entries', style: TextStyle(color: Colors.black),)
                          ),
                        ),
                        
                      ],
                    ),
                  ),
          SliverToBoxAdapter(
            child: SoldEntryPage(),
          ),
          
          // SliverPersistentHeader(
          //   delegate: PersistentHeader(
          //     widget: HeaderDatePicker()
          //   ),
          //   pinned: true,
          //   ),
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

  @override
  bool get wantKeepAlive => true;
}
