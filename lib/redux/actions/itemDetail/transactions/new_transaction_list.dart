

import 'package:flutter/cupertino.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

class LoadNewTransactionsPageAction {
  LoadNewTransactionsPageAction({
    @required this.pageNumber,
    @required this.transactionsPerPage,
  });

  final int pageNumber;
  final int transactionsPerPage;
}

class NewTransactionsPageLoadedAction {
  NewTransactionsPageLoadedAction(this.transactionsPage);

  final List<MoneyTransactionModel> transactionsPage;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
