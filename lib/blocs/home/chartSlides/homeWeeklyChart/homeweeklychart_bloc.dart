import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'homeweeklychart_event.dart';
part 'homeweeklychart_state.dart';

class HomeweeklychartBloc
    extends Bloc<HomeweeklychartEvent, HomeweeklychartState> {
  HomeweeklychartBloc() : super(HomeweeklychartInitial()) {
    on<LoadHomeWeeklyChart>((event, emit) async {
      emit(HomeweeklychartLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await WebClient().get('/alltransactions/all/weekly?shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(HomeweeklychartLoaded(jsonData
            .map((item) => OveralWeeklyTransactionModel.fromJson(item))
            .toList()));
      } catch (error) {
        print(error);
        emit(HomeweeklychartError((error as Map)['message']));
      }
    });
  }

}
