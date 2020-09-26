import 'package:inventory_controller/models/api_response.dart';

import '../models/moneyTransaction.dart';
import 'dart:async';
import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  static const API = 'http://localhost:5000';

  static Future<List<MoneyTransactionModel>> getMoneyTransactions() async {
    final response = await Future.delayed(Duration(seconds: 2));
    // if (response.statusCode == 200) {
    //   final jsonData = json.decode(response.body);
    //   print(jsonData);
      return [
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
            productId: "Travetine",
            entryType: "sold",
            quantity: "60kg",
            unitPrice: "240rwf/kg",
            paidBy: "mtn",
            createdAt: "2020-04-20T00:15:08.932Z"),
        new MoneyTransactionModel(
            id: "3",
            productId: "Travetine",
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
    // } else {
    //   // If that call was not successful, throw an error.
    //   throw Exception('Failed to load post');
    // }
    // return APIResponse.fromJson(json.decode(response.body));
  }

  
}
