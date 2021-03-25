import 'package:intl/intl.dart';

class MoneyTransactionModel {
  int id;
  String productId;
  String entryType;
  String quantity;
  String unitPrice;
  String transactionTotal;
  String paidBy;
  DateTime createdAt;
  DateTime updatedAt;

  String get createdAtFormatted =>
      DateFormat.yMMMd().add_Hm().format(createdAt);

  MoneyTransactionModel.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      productId = json['productId'],
      entryType = json['entryType'],
      quantity = json['quantity'],
      unitPrice = json['unitPrice'],
      paidBy = json['paidBy'],
      transactionTotal = json['transactionTotal'],
      createdAt = DateTime.parse(json['createdAt']),
      updatedAt = DateTime.parse(json['updatedAt']);
}