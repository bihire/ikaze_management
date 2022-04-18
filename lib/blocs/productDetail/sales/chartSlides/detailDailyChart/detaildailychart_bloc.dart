import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'detaildailychart_event.dart';
part 'detaildailychart_state.dart';

class DetaildailychartBloc
    extends Bloc<DetailDailychartEvent, DetailDailychartState> {
  DetaildailychartBloc() : super(DetailDailychartInitial()) {
    on<LoadDetailDailyChart>((event, emit) async {
      emit(DetailDailychartLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await WebClient().get('/alltransactions/all/daily?shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(DetailDailychartLoaded(jsonData
                .map((item) => OveralDailyTransactionModel.fromJson(item))
                .toList()));
      } catch (error) {
        print(error);
        emit(DetailDailychartError((error as Map)['message']));
      }
    });
  }
}
