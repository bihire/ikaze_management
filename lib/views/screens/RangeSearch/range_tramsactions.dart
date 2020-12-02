import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/common/debouncer.dart';
import 'package:inventory_controller/components/custom_appbar.dart';
import 'package:inventory_controller/components/custom_progress_indicator.dart';
import 'package:inventory_controller/components/error_notifier.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/auto_animated_utils.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/range_count.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/range_count_loading.dart';
import 'package:expandable/expandable.dart';
import 'package:inventory_controller/models/range_count.dart';

class RangeTransactions extends StatefulWidget {
  RangeTransactions({
    this.isDataLoading,
    this.isNextPageAvailable,
    this.transactions,
    this.refresh,
    this.onSearch,
    this.rangeCount,
    this.rangeDate,
    this.loadNextPage,
    this.noError,
  });

  final bool isDataLoading;
  final bool isNextPageAvailable;
  final transactions;
  final Function refresh;
  final Function() onSearch;
  final Function loadNextPage;
  final bool noError;
  final Map rangeDate;
  final RangeCountModel rangeCount;

  @override
  _RangeTransactionsState createState() => _RangeTransactionsState();
}

class _RangeTransactionsState extends State<RangeTransactions> {
  ScrollController _scrollController = ScrollController();
  final _scrollThresholdInPixels = 100.0;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool rangeSearchLoading = false;
  bool firstClick = false;
  DateTime fromDate;
  DateTime endDate = new DateTime.now();
  void notifySearch() {
    setState(() {
      firstClick = true;
    });
  }

  void _setFormDate(DateTime pickeDate) {
    setState(() {
      fromDate = pickeDate;
    });
  }

  void _setToDate(DateTime pickeDate) {
    setState(() {
      endDate = pickeDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    switchFunction(bool isLoading, int transactionsLength) {
      if (!isLoading && transactionsLength == 0) return Container();
      if (isLoading && transactionsLength == 0)
        return RangeCountLoading();
      else
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: RangeCount(rangeCount: widget.rangeCount, rangeDate: widget.rangeDate),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                sliver: LiveSliverList(
                  controller: _scrollController,
                  showItemInterval: Duration(milliseconds: 30),
                  // showItemDuration: Duration(milliseconds: 100),
                  itemCount: widget.isNextPageAvailable
                      ? widget.transactions.length + 1
                      : widget.transactions.length,
                  itemBuilder: animationItemBuilder(
                      (index, transitionLength) => (index < transitionLength)
                          ? MoneyTransactionModelListItem(
                              itemIndex: index,
                              transaction: widget.transactions[index])
                          : CustomProgressIndicator(isActive: widget.noError),
                      padding: EdgeInsets.symmetric(vertical: 0),
                      transactionLength: widget.transactions.length),
                ),
              ),
            ],
          ),
        );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new CustomAppBar(
          notifySearch: notifySearch,
          setFormDate: _setFormDate,
          setToDate: _setToDate,
          fromDate: fromDate,
          toDate: endDate,
          rangeSearchLoading:
              (widget.isDataLoading && widget.transactions.length == 0),
          onSearch: widget.onSearch),
      body: SafeArea(
        child: switchFunction(widget.isDataLoading, widget.transactions.length),
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThresholdInPixels &&
        !widget.isDataLoading) {
      _debouncer.run(() => widget.loadNextPage());
    }
  }

  Future _onRefresh() {
    widget.refresh(widget.rangeDate["rangeFromDate"], widget.rangeDate["rangeToDate"]);
    return Future.value();
  }
}
