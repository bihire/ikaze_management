import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/barChart_with_tab.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/top_summary_card.dart';

import 'components/persistent_header.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({
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
  State<StatefulWidget> createState() => NewEntryPageState();
}

class NewEntryPageState extends State<NewEntryScreen> {
  
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
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: Text('Lime new-entries', style: TextStyle(color: Colors.black),)
                          ),
                        ),
                        // Container(
                        //   child: LeadingButton(
                        //     color: lightShadeColor,
                        //     icon: Icons.qr_code_scanner_rounded,
                        //     iconColor: darkColor,
                        //     size: 37, // btnShadow: false
                        //   ),
                        // ),
                      ],
                    ),
                  ),
          SliverToBoxAdapter(
            child: TopSummaryCard(),
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
