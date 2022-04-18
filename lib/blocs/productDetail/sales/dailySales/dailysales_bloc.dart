import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'dailysales_event.dart';
part 'dailysales_state.dart';

class DetaildailysalesBloc
    extends Bloc<DetaildailysalesEvent, DetaildailysalesState> {
  DetaildailysalesBloc() : super(DetaildailysalesInitial()) {
    on<LoaddetaildailySales>((event, emit) async {
      emit(DetaildailysalesLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await const WebClient().get(
            '/transactions/${event.productId}/daily_total?shop_id=${shop['id']}');
        emit(DetaildailysalesLoaded(
            int.parse(response['data'][0]['total_amount'])));
      } catch (error) {
        emit(DetaildailysalesError((error as Map)['message']));
      }
    });
  }
}
