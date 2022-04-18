import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'detailmonthlychart_event.dart';
part 'detailmonthlychart_state.dart';

class DetailmonthlychartBloc
    extends Bloc<DetailmonthlychartEvent, DetailmonthlychartState> {
  DetailmonthlychartBloc() : super(DetailmonthlychartInitial()) {
    on<LoadDetailMonthlyChart>((event, emit) async {
      emit(DetailmonthlychartLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await WebClient().get('/alltransactions/all/monthly?shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(DetailmonthlychartLoaded(jsonData
            .map((item) => OveralMonthlyTransactionModel.fromJson(item))
            .toList()));
      } catch (error) {
        print(error);
        emit(DetailmonthlychartError((error as Map)['message']));
      }
    });
  }
}
