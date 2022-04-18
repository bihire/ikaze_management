import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'homedailychart_event.dart';
part 'homedailychart_state.dart';

class HomedailychartBloc
    extends Bloc<HomeDailychartEvent, HomeDailychartState> {
  HomedailychartBloc() : super(HomeDailychartInitial()) {
    on<LoadHomeDailyChart>((event, emit) async {
      emit(HomeDailychartLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await WebClient().get('/alltransactions/all/daily?shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(HomeDailychartLoaded(jsonData
                .map((item) => OveralDailyTransactionModel.fromJson(item))
                .toList()));
      } catch (error) {
        print(error);
        emit(HomeDailychartError((error as Map)['message']));
      }
    });
  }
}
