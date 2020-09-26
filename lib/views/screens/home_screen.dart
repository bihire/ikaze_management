// import 'package:flutter_redux_infinite_list/common/debouncer.dart';
// import 'package:flutter_redux_infinite_list/models/github_issue.dart';
// import 'package:flutter_redux_infinite_list/presentation/components/custom_progress_indicator.dart';
// import 'package:flutter_redux_infinite_list/presentation/components/github_issue_list_item.dart';
// import 'package:flutter_redux_infinite_list/presentation/error_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/common/debouncer.dart';
import 'package:inventory_controller/components/custom_progress_indicator.dart';
import 'package:inventory_controller/components/error_notifier.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/models/money_transactions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    this.isDataLoading,
    this.isNextPageAvailable,
    this.transactions,
    this.refresh,
    this.loadNextPage,
    this.noError,
  });

  final bool isDataLoading;
  final bool isNextPageAvailable;
  final transactions;
  final Function refresh;
  final Function loadNextPage;
  final bool noError;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return ErrorNotifier(
        child: widget.isDataLoading && widget.transactions.length == 0
            ? CustomProgressIndicator(isActive: widget.isDataLoading)
            : RefreshIndicator(
                child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: widget.isNextPageAvailable
                      ? widget.transactions.length + 1
                      : widget.transactions.length,
                  itemBuilder: (context, index) {
                    return (index < widget.transactions.length)
                        ? MoneyTransactionModelListItem(
                            itemIndex: index, transaction: widget.transactions[index])
                        : CustomProgressIndicator(isActive: widget.noError);
                  },
                  controller: _scrollController,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(color: Theme.of(context).dividerColor),
                ),
                onRefresh: _onRefresh,
              ),
      );
  //   Scaffold(
  //     appBar: AppBar(
  //       title: Text('Infinite ListView with Redux'),
  //     ),
  //     body: ,
  //   );
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
    widget.refresh();
    return Future.value();
  }
}