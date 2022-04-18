import 'package:flutter/material.dart';

import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/transaction_item.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/models/money_transactions.dart';

class HomeTransactionListScreen extends StatelessWidget {
  final bool loading;
  final List<MoneyTransactionModel> transactions;
  final String? error;

  HomeTransactionListScreen(
      {required this.loading,
      required this.transactions,
      required this.error});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return index == transactions.length
            ? Container(
                width: width,
                height: 80,
                color: primaryLightColor,
                child: Center(
                  child: loading == true
                      ? LoadingIndicator()
                      : Text(
                          'No transactions',
                          style: TextStyle(color: hardGreyColor),
                        ),
                ),
              )
            : TransactionItem(
                itemIndex: index, transaction: transactions[index]);
      }, childCount: transactions.length + 1),
    );
  }
}
