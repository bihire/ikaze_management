import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:inventory_controller/common/date_formater.dart';
import 'package:inventory_controller/components/custom_progress_indicator.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/models/moneyTransaction.dart';
import 'package:inventory_controller/views/ProductDetail/SoldEntryPage/SoldEntryPage.dart';
// import 'package:inventory_controller/views/dashboard/ExpendableListTile.dart';
import 'package:inventory_controller/views/dashboard/transactionTable.dart';
import 'package:inventory_controller/views/screens/home_screen.dart';

import './common.dart';

class SoldEntryScreen extends StatelessWidget {
  const SoldEntryScreen({
    Key key,
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
  Widget build(BuildContext context) {
    var history = {};

    transactions.forEach((element) {
      final formatedDate = Utils.dateFormater(element.createdAt);
      if ((history[formatedDate['dateClass']] == null))
        return (history[formatedDate['dateClass']] = [element]);
      return history[formatedDate['dateClass']].add(element);
    });
    print(history);
    return AppScaffold(
      title: 'List Example',
      slivers: [
        SliverToBoxAdapter(
          child: SoldEntryPage(),
        ),
        _StickyHeaderDateSort(history: history),
      ],
    );
  }
}

class _StickyHeaderList extends StatelessWidget {
  const _StickyHeaderList({
    Key key,
    this.keyTitle,
    this.keyData,
  }) : super(key: key);

  final keyTitle;
  final keyData;

  @override
  Widget build(BuildContext context) {
    print(keyData);
    return SliverStickyHeader(
      header: Header(title: keyTitle),
      sliver: SliverToBoxAdapter(
        child: Container(
          child: ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            // shrinkWrap: true,
          // physics: AlwaysScrollableScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Text('hello $index');
          },
          separatorBuilder: (BuildContext context, int index) =>
              Divider(color: Theme.of(context).dividerColor),
        ),
        )
      ),
    );
  }
}

class _StickyHeaderDateSort extends StatelessWidget {
  const _StickyHeaderDateSort({
    Key key,
    this.history,
  }) : super(key: key);

  final history;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: HeaderDatePicker(),
      sliver: SliverToBoxAdapter(
        child: ShrinkWrappingViewport(
          offset: ViewportOffset.zero(),
          slivers: [
            for (var key in history.keys)
              _StickyHeaderList(keyTitle: key, keyData: history[key])
          ],
        ),
      ),
    );
  }
}
