import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'dailysales_event.dart';
part 'dailysales_state.dart';

class DailysalesBloc extends Bloc<DailysalesEvent, DailysalesState> {
  DailysalesBloc() : super(DailysalesInitial()) {
    on<LoadDailySales>((event, emit) async {
      emit(DailysalesLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await const WebClient()
            .get('/transactions/all/daily_total?shop_id=${shop['id']}');
        
        emit(DailysalesLoaded(int.parse(response['data'][0]['total_amount'])));
      } catch (error) {
        emit(DailysalesError((error as Map)['message']));
      }
    });
  }
}
