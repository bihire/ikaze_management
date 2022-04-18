import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'detailweeklychart_event.dart';
part 'detailweeklychart_state.dart';

class DetailweeklychartBloc
    extends Bloc<DetailweeklychartEvent, DetailweeklychartState> {
  DetailweeklychartBloc() : super(DetailweeklychartInitial()) {
    on<LoadDetailWeeklyChart>((event, emit) async {
      emit(DetailweeklychartLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await WebClient().get('/alltransactions/all/weekly?shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(DetailweeklychartLoaded(jsonData
            .map((item) => OveralWeeklyTransactionModel.fromJson(item))
            .toList()));
      } catch (error) {
        print(error);
        emit(DetailweeklychartError((error as Map)['message']));
      }
    });
  }
}
