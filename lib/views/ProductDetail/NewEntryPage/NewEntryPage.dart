import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/new_entry_container.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/chartSlide/detail_chart_slide.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/barChart_with_tab.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';

import 'components/persistent_header.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({
    Key key,
    this.loading,
    this.dailyTotal,
    this.refresh,
    this.loadNextPage,
    this.error,
  });
  // final  productInfo;
  // ProductDetail({
  //   this.productInfo,
  // });

  final bool loading;
  final String dailyTotal;
  final Function refresh;
  final Function loadNextPage;
  final bool error;
  @override
  State<StatefulWidget> createState() => NewEntryPageState();
}

class NewEntryPageState extends State<NewEntryScreen> with AutomaticKeepAliveClientMixin <NewEntryScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
                      body: CustomScrollView(
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
                              child: Text('Lime new-entries', style: TextStyle(color: Colors.black),)
                            ),
                          ),
                          Container(
                            child: LeadingButton(
                              color: lightShadeColor,
                              icon: Icons.more_horiz_outlined,
                              iconColor: darkColor,
                              size: 37, // btnShadow: false
                            ),
                          ),
                        ],
                      ),
                    ),
            SliverToBoxAdapter(
              child: TopSummaryCard(
                loading: widget.loading,
                dailyTotal: widget.dailyTotal,
                error: widget.error,
              ),
              // NewDetailContainer(),
            ),
            SliverToBoxAdapter(
              child: ProductDetailChartScreens(),
            ),
            SliverPersistentHeader(
              delegate: PersistentHeader(
                widget: HeaderDatePicker()
              ),
              pinned: true,
              ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate((context, index) {
            //     return MoneyTransactionModelListItem(
            //       itemIndex: index, transaction: widget.transactions[index]);
                  
            //   }, 
            //   childCount: widget.transactions.length
            //   ),
              
            //   )
            
        ],
      ),
          ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
