import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/containers/homePage/daily_total.dart';
import 'package:inventory_controller/containers/homePage/homeList/home_list_container.dart';
import 'package:inventory_controller/redux/actions/homePage/transactions/transactionList.dart';
import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/homePage/chartSlide/home_chart_slide.dart';
import 'package:redux/redux.dart';

import 'components/persistent_header.dart';

class HomePageScreen extends StatefulWidget {
  final bool homeloading;
  final bool isNextPageAvailable;
  final Store<AppState> store;

  const HomePageScreen({
    Key key,
    this.homeloading,
    this.isNextPageAvailable,
    this.transactions,
    this.store,
    this.refresh,
    // this.loadNextPage,
    // this.noError,
  });

  // final bool loading;
  // final bool isNextPageAvailable;
  final transactions;
  final Function refresh;
  // final Function loadNextPage;
  // final bool noError;
  @override
  State<StatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: primaryColor,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  width: MediaQuery.of(context).size.width * 1,
                  child: DailyTotal()),
            ),
            SliverToBoxAdapter(
              child: HomeChartScreens(),
            ),
            SliverPersistentHeader(
              delegate: PersistentHeader(widget: HeaderDatePicker()),
              pinned: true,
            ),
            HomePageContainer()
            // SliverList(
            //   delegate: SliverChildBuilderDelegate((context, index) {
            //     return MoneyTransactionModelListItem(
            //         itemIndex: index, transaction: widget.transactions[index]);
            //   }, childCount: widget.transactions.length),
            // )
          ],
        ),
      ),
    );
  }

  void _scrollListener() {
    if (!widget.homeloading &&
        widget.isNextPageAvailable &&
        controller.position.extentAfter < 20.0) {
          widget.store.dispatch(
        LoadHomeTransactionsPageAction(
            pageNumber: (widget.transactions.length ~/ TransactionState.transactionsPerPage) + 1,
            transactionsPerPage: TransactionState.transactionsPerPage),
      );
    }
  }

  Future _onRefresh() {
    widget.refresh();
    return Future.value();
  }
}
