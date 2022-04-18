import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:inventory_controller/utils/constants.dart';

part 'suppliestransactionlist_event.dart';
part 'suppliestransactionlist_state.dart';

class SuppliestransactionlistBloc
    extends Bloc<SuppliestransactionlistEvent, SuppliestransactionlistState> {
  SuppliestransactionlistBloc() : super(SuppliestransactionlistInitial()) {
    on<Loadsuppliestransactions>((event, emit) async {
      emit(SuppliestransactionlistLoading(transactions: state.transactions));
      try {
        final response = await const WebClient().get(
            '/transactions/${event.productId}?page=${event.pageNumber}&numberOfRows=$transactionsPerPage&type=new');
        final jsonData = response['data'] as List;
        emit(SuppliestransactionlistLoaded(
            transactions: List.from(state.transactions)
              ..addAll(jsonData
                  .map((item) => MoneyTransactionModel.fromJson(item))
                  .toList())));
      } catch (error) {
        emit(SuppliestransactionlistError((error as Map)['error']));
      }
    });
  }
}
