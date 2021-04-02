// import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/containers/itemDetail/transactions/new_product_list_container.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/productList/product_list.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/chartSlide/detail_chart_slide.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:skeleton_text/skeleton_text.dart';

import 'components/persistent_header.dart';

class NewEntryScreen extends StatefulWidget {
  final ProductInfoModel productInfo;
  const NewEntryScreen({
    Key key,
    this.loading,
    this.dailyTotal,
    this.isNextPageAvailable,
    this.transactions,
    this.refresh,
    this.loadNextPage,
    this.error,
    this.productInfo,
  });
  // final  productInfo;
  // ProductDetail({
  //   this.productInfo,
  // });

  final bool loading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final String dailyTotal;
  final Function refresh;
  final Function loadNextPage;
  final bool error;
  @override
  State<StatefulWidget> createState() => NewEntryPageState();
}

class NewEntryPageState extends State<NewEntryScreen>
    with AutomaticKeepAliveClientMixin<NewEntryScreen> {
  ScrollController controller;
  // List<String> items = new List.generate(100, (index) => 'Hello $index');

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  Widget _buildLoadingWidget() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: TopSummaryCardLoading(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(
          child: _buildLoadingChart(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return SkeletonAnimation(
              child: Container(
                color: primaryLightColor,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(height: 60, color: lightGreyColor),
              ),
            );
          }, childCount: 3),
        )
      ],
    );
  }

  Widget _buildLoadingChart() {
    return Container(
      color: primaryLightColor,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 20),
            height: 40,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                SkeletonAnimation(
                  child: Container(
                    width: 150.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SkeletonAnimation(
                  child: Container(
                    width: 150.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SkeletonAnimation(
                  child: Container(
                    width: 150.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 1.47,
              child: Container(
                color: lightGreyColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
                color: primaryLightColor,
                border: Border(
                    bottom: BorderSide(color: lightGreyColor, width: 1))),
            child: Row(
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
                      child: Text(
                        'Lime new-entries',
                        style: TextStyle(color: Colors.black),
                      )),
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
        ),
        body: widget.loading
            ? _buildLoadingWidget()
            : CustomScrollView(
                controller: controller,
                slivers: [
                  SliverToBoxAdapter(
                    child: TopSummaryCard(
                      productInfo: widget.productInfo,
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
                    delegate: PersistentHeader(widget: HeaderDatePicker()),
                    pinned: true,
                  ),
                  NewPageListContainer()
                ],
              ),
      ),
    );
  }

  void _scrollListener() {
    if (!widget.loading &&
        widget.isNextPageAvailable &&
        controller.position.extentAfter < 20.0) {
      widget.loadNextPage();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
