

import '../models/moneyTransaction.dart';

class TransactionService {
  List getMoneyTransactions () {
    return [
      new MoneyTransactionModel (
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
  }
}