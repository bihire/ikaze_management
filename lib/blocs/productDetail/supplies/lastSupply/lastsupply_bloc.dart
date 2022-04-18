import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'lastsupply_event.dart';
part 'lastsupply_state.dart';

class LastsupplyBloc extends Bloc<LastsupplyEvent, LastsupplyState> {
  LastsupplyBloc() : super(LastsupplyInitial()) {
    on<Loaddetaillastsupply>((event, emit) async {
      emit(LastsupplyLoading());
      try {
        final response =
            await const WebClient().get('/products/transactions/last_supply');
        emit(
            LastsupplyLoaded(MoneyTransactionModel.fromJson(response['data'])));
      } catch (error) {
        emit(LastsupplyError((error as Map)['message']));
      }
    });
  }
}
