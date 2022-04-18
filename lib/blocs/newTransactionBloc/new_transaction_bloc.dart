import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:inventory_controller/models/product/product.dart';

part 'new_transaction_event.dart';
part 'new_transaction_state.dart';

class NewTransactionBloc
    extends Bloc<NewTransactionEvent, NewTransactionState> {
  NewTransactionBloc() : super(NewTransactionInitial());

  @override
  Stream<NewTransactionState> mapEventToState(
    NewTransactionEvent event,
  ) async* {
    if (event is CreateTransaction) {
      yield NewTransactionLoading();
      try {
        final response = await const WebClient()
            .post('/transactions/${event.product_id}/add', {
          'quantity': event.quantity,
          'paid_with': event.paid_with.toLowerCase(),
          'type': event.type.toLowerCase(),
          'unit_price': event.unit_price,
        });
        final MoneyTransactionModel transaction =
            MoneyTransactionModel.fromJson(response['data']);
        Navigator.popAndPushNamed(event.context, '/product',
            arguments: ProductInfoModel(transaction.id,
                transaction.product.productName, transaction.unitPrice));
      } catch (error) {
        yield NewTransactionError((error as Map)['error']);
      }
    }
    
    if (event is CancelTransactionError) {
      yield NewTransactionError(null);
    }
  }
}
