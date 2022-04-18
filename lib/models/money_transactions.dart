import 'package:intl/intl.dart';
import 'package:inventory_controller/models/product/product.dart';

class MoneyTransactionModel {
  int id;
  ProductModel product;
  String entryType;
  String quantity;
  int unitPrice;
  String transactionTotal;
  String paidBy;
  DateTime createdAt;
  DateTime updatedAt;

  String get createdAtFormatted =>
      DateFormat.yMMMd().add_Hm().format(createdAt);

  MoneyTransactionModel.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      product = ProductModel.fromJson(json['product']),
      entryType = json['type'],
      quantity = json['quantity'],
      unitPrice = int.parse(json['unit_price']),
      paidBy = json['paid_with'],
      transactionTotal = json['transaction_total'],
      createdAt = DateTime.parse(json['createdAt']),
      updatedAt = DateTime.parse(json['updatedAt']);
}