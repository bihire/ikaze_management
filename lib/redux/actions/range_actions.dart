import 'package:flutter/cupertino.dart';
// import 'package:flutter_redux_infinite_list/models/github_issue.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/range_count.dart';
import 'package:meta/meta.dart';

class LoadTransactionsRangePageAction {
  LoadTransactionsRangePageAction({
    required this.pageNumber,
    required this.transactionsPerPage,
    required this.fromDate,
    required this.toDate,
  });

  final int pageNumber;
  final int transactionsPerPage;
  final DateTime fromDate;
  final DateTime toDate;
}

class SetDateRangePageLoadedAction {
  SetDateRangePageLoadedAction(
    this.fromDate,
    this.toDate,
  );

  final DateTime fromDate;
  final DateTime toDate;
}

class TransactionsRangePageLoadedAction {
  TransactionsRangePageLoadedAction(this.transactionsPage);

  final List<MoneyTransactionModel> transactionsPage;
}

class TransactionsRangeCountLoadedAction {
  TransactionsRangeCountLoadedAction(this.rangeCount);

  final RangeCountModel rangeCount;
}

class ErrorRangeOccurredAction {
  ErrorRangeOccurredAction(this.exception);

  final Exception exception;
}

class ErrorRangeHandledAction {}
