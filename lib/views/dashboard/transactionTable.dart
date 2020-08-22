import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_controller/models/moneyTransaction.dart';
import './TransactioListTile.dart';
import 'package:inventory_controller/servives/TransactionService.dart';
import './ExpendableListTile.dart';

class TransactionTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionTableState();
  }
}

class TransactionTableState extends State {
  TransactionService get service => GetIt.I<TransactionService>();

  List<MoneyTransactionModel> transactions = [];
  final List moneyTransactions = [
    new MoneyTransactionModel(
        id: "1",
        productId: "lime",
        entryType: "sold",
        quantity: "60kg",
        unitPrice: "240rwf/kg",
        paidBy: "mtn",
        createdAt: "2020-04-20T00:15:08.932Z"),
    new MoneyTransactionModel(
        id: "2",
        productId: "lime",
        entryType: "sold",
        quantity: "60kg",
        unitPrice: "240rwf/kg",
        paidBy: "mtn",
        createdAt: "2020-04-20T00:15:08.932Z"),
    new MoneyTransactionModel(
        id: "3",
        productId: "lime",
        entryType: "sold",
        quantity: "60kg",
        unitPrice: "240rwf/kg",
        paidBy: "mtn",
        createdAt: "2020-04-20T00:15:08.932Z"),
    new MoneyTransactionModel(
        id: "4",
        productId: "lime",
        entryType: "sold",
        quantity: "60kg",
        unitPrice: "240rwf/kg",
        paidBy: "mtn",
        createdAt: "2020-04-20T00:15:08.932Z"),
  ];

  @override
  void initState() {
    transactions = service.getMoneyTransactions();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Expansionpanel(transactions: transactions);
  }
}
