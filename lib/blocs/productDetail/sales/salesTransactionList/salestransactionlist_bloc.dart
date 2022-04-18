import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:inventory_controller/utils/constants.dart';

part 'salestransactionlist_event.dart';
part 'salestransactionlist_state.dart';

class SalestransactionlistBloc
    extends Bloc<SalestransactionlistEvent, SalestransactionlistState> {
  SalestransactionlistBloc() : super(SalestransactionlistInitial()) {
    on<Loadsalestransactions>((event, emit) async {
      emit(SalestransactionlistLoading(transactions: state.transactions));
      try {
        final shop = await getJson('active_shop');
        final response = await const WebClient().get(
            '/transactions?page=${event.pageNumber}&numberOfRows=$transactionsPerPage&shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(SalestransactionlistLoaded(
            transactions: List.from(state.transactions)
              ..addAll(jsonData
                  .map((item) => MoneyTransactionModel.fromJson(item))
                  .toList())));
      } catch (error) {
        emit(SalestransactionlistError((error as Map)['error']));
      }
    });
  }
}
