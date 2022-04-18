

import 'package:flutter/cupertino.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

class LoadSupplyTransactionsPageAction {
  LoadSupplyTransactionsPageAction({
    required this.pageNumber,
    required this.transactionsPerPage,
  });

  final int pageNumber;
  final int transactionsPerPage;
}

class SupplyTransactionsPageLoadedAction {
  SupplyTransactionsPageLoadedAction(this.transactionsPage);

  final List<MoneyTransactionModel> transactionsPage;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
