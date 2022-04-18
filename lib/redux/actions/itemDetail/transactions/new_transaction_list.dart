import 'package:flutter/cupertino.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

class LoadNewTransactionsPageAction {
  LoadNewTransactionsPageAction(
      {required this.pageNumber,
      required this.transactionsPerPage,
      required this.productId});

  final int pageNumber;
  final int transactionsPerPage;
  final String productId;
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
