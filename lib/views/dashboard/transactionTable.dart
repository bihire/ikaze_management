// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:get_it/get_it.dart';
import 'package:inventory_controller/containers/homePage/home_container.dart';
// import 'package:inventory_controller/models/moneyTransaction.dart';
// import 'package:inventory_controller/models/money_transactions.dart';
// import 'package:inventory_controller/redux/AllTransactions/all_transactions_actions.dart';
// import 'package:inventory_controller/redux/store.dart';
// import './TransactioListTile.dart';
// import 'package:inventory_controller/servives/TransactionService.dart';
// import './ExpendableListTile.dart';

class TransactionTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionTableState();
  }
}

class _TransactionTableState extends State {
  // List<Widget> _buildPosts(List<MoneyTransactionModel> transactions) {
  //   return transactions
  //       .map(
  //         (transaction) => ListTile(
  //           title: Text(transaction.productId),
  //           subtitle: Text(transaction.paidBy),
  //           key: Key(transaction.id.toString()),
  //         ),
  //       )
  //       .toList();
  // }

  // void _onFetchPostsPressed() {
  //   Redux.store.dispatch(fetchAllTransactionsAction);
  //   print(StoreConnector);
  // }

  @override
  void initState() {
    // Redux.store.dispatch(fetchAllTransactionsAction);
    super.initState();
  }

  Widget build(BuildContext context) {

    return Container(
      height: 300.0,
      child: HomeContainer(),
    );

    // ;
    // Container(
    //   height: 400.0,
    //   child: Column(
    //   children: [
    //     RaisedButton(
    //       child: Text("Fetch Posts"),
    //       onPressed: _onFetchPostsPressed,
    //     ),
    //     StoreConnector<AppState, bool>(
    //       distinct: true,
    //       converter: (store) => store.state.transactionState.isLoading,
    //       builder: (context, isLoading) {
    //         if (isLoading) {
    //           return CircularProgressIndicator();
    //         } else {
    //           return SizedBox.shrink();
    //         }
    //       },
    //     ),
    //     StoreConnector<AppState, bool>(
    //       distinct: true,
    //       converter: (store) => store.state.transactionState.isError,
    //       builder: (context, isError) {
    //         if (isError) {
    //           return Text("Failed to get posts");
    //         } else {
    //           return SizedBox.shrink();
    //         }
    //       },
    //     ),
    //     Expanded(
    //       child: StoreConnector<AppState, List<MoneyTransactionModel>>(
    //         distinct: true,
    //         converter: (store) => store.state.transactionState.transactions,
    //         builder: (context, posts) {
    //           return ListView(
    //             shrinkWrap: true,
    //             children: _buildPosts(posts),
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // ),
    // );

    // Expansionpanel(transactions: transactions);
  }
}
