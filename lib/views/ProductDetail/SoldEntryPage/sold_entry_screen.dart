import 'package:flutter/material.dart';
import 'package:inventory_controller/blocs/productDetail/supplies/suppliesTransactionList/suppliestransactionlist_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/ScreenContainer/screen_container.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/components/section_tilte.dart';
import 'package:inventory_controller/containers/entryPage/SoldEntry/supplylist_container.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/utils/auth/auth.dart';
import 'package:inventory_controller/components/transaction_item.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/utils/constants.dart';
import 'package:inventory_controller/utils/debounce.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/barChart_with_tab.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:inventory_controller/views/ProductDetail/SoldEntryPage/components/LastTransactionCard.dart';
// import 'package:inventory_controller/views/ProductDetail/SoldEntryPage/components/SoldEntryPage.dart';

import 'components/persistent_header.dart';

class SoldEntryScreen extends StatefulWidget {
  final ProductInfoModel productInfo;
  final SuppliestransactionlistBloc supplyTransactionList;
  
  const SoldEntryScreen(
      {Key? key,required this.loading,required this.lastSupply, this.error,required this.productInfo,required this.supplyTransactionList});

  final bool loading;
  final MoneyTransactionModel? lastSupply;
  final String? error;
  @override
  State<StatefulWidget> createState() => SoldEntryPageState();
}

class SoldEntryPageState extends State<SoldEntryScreen>
    with AutomaticKeepAliveClientMixin<SoldEntryScreen> {
      late ScrollController controller;
  // to start
  final _debouncer = Debouncer(milliseconds: 500);

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
  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      loading: widget.loading,
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        titleSpacing: 0,
        elevation:  4.0,
        shadowColor: lightGreyColor,
        automaticallyImplyLeading: false,
        title: AppBarContainer(productInfo: widget.productInfo),
      ),
      slivers: [
                SliverToBoxAdapter(
                  child: LastTransactionCard(lastSupply: widget.lastSupply!),
                ),
                SliverToBoxAdapter(
                  child: SectionTitle(title: 'Supply History',),
                ),
                SuppplyListContainer(supplyListBloc: widget.supplyTransactionList, productInfo: widget.productInfo,),
              ],
    );
  }
  void _scrollListener() {
    if (!widget.loading &&
        widget.supplyTransactionList.state is SuppliestransactionlistLoaded &&
        controller.position.extentAfter < 20.0) {
      _debouncer.run(() => widget.supplyTransactionList.add(
          Loadsuppliestransactions(
          pageNumber: (widget.supplyTransactionList.state.transactions.length ~/
                  transactionsPerPage) +
              1,
          productId: widget.productInfo.productId)));

      // widget.loadNextPage('${widget.productInfo.productId}');
    }
  }

  Future _onRefresh() {
    // widget.refresh();
    return Future.value();
  }
  @override
  bool get wantKeepAlive => true;
}
