import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'request_transaction_delete_event.dart';
part 'request_transaction_delete_state.dart';

class RequestTransactionDeleteBloc
    extends Bloc<RequestTransactionDeleteEvent, RequestTransactionDeleteState> {
  RequestTransactionDeleteBloc() : super(RequestTransactionDeleteInitial());

  @override
  Stream<RequestTransactionDeleteState> mapEventToState(
    RequestTransactionDeleteEvent event,
  ) async* {
    if (event is RequestDelete) {
      yield RequestTransactionDeleteLoading();
      try {
        final response = await const WebClient()
            .delete('/transactions/${event.transaction_id}/delete');
        print(response);
        // yield RequestTransactionDeleteLoaded()
      } catch (error) {
        flushErrorMsg(String msg) => Flushbar(
              blockBackgroundInteraction: true,
              barBlur: 10,
              isDismissible: true,
              margin: EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.red,
              flushbarPosition: FlushbarPosition.TOP,
              message: msg,
              animationDuration: Duration(milliseconds: 500),
              // duration: Duration(seconds: 3),
            )..show(event.context);
        flushErrorMsg((error as Map)['error']);
        yield RequestTransactionDeleteError(error['error']);
      }
    }
  }
}
