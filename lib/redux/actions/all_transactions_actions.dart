// import 'dart:convert';

// import 'package:inventory_controller/models/money_transactions.dart';
// import 'package:inventory_controller/redux/AllTransactions/all_transactions_state.dart';
// import 'package:inventory_controller/redux/store.dart';
// import 'package:redux/redux.dart';
// import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;

// @immutable
// class SetTransactionStateAction {
//   final TransactionState transactionState;

//   SetTransactionStateAction(this.transactionState);
// }

// Future<void> fetchAllTransactionsAction(Store<AppState> store) async {
//   store.dispatch(SetTransactionStateAction(TransactionState(isLoading: true)));
//   try {
//     final response =
//         await http.get('http://192.168.137.133:5000/api/auth/transactions?page=1&numberOfRows=10');
//     assert(response.statusCode == 200);
//     final jsonData = json.decode(response.body);
//     store.dispatch(
//       SetTransactionStateAction(
//         TransactionState(
//           isLoading: false,
//           transactions: MoneyTransactionModel.listFromJson(jsonData['data']),
//         ),
//       ),
//     );
//   } catch (error) {
//     print(error);
//     store.dispatch(
//         SetTransactionStateAction(TransactionState(isLoading: false)));
//   }
// }

import 'package:flutter/cupertino.dart';
// import 'package:flutter_redux_infinite_list/models/github_issue.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

class LoadTransactionsPageAction {
  LoadTransactionsPageAction({
    required this.pageNumber,
    required this.transactionsPerPage,
  });

  final int pageNumber;
  final int transactionsPerPage;
}

class TransactionsPageLoadedAction {
  TransactionsPageLoadedAction(this.transactionsPage);

  final List<MoneyTransactionModel> transactionsPage;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
