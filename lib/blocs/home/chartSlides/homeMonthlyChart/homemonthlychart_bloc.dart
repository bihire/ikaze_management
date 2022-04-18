import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'homemonthlychart_event.dart';
part 'homemonthlychart_state.dart';

class HomemonthlychartBloc
    extends Bloc<HomemonthlychartEvent, HomemonthlychartState> {
  HomemonthlychartBloc() : super(HomemonthlychartInitial()) {
    on<LoadHomeMonthlyChart>((event, emit) async {
      emit(HomemonthlychartLoading());
      try {
        final shop = await getJson('active_shop');
        final response = await WebClient().get('/alltransactions/all/monthly?shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(HomemonthlychartLoaded(jsonData
            .map((item) => OveralMonthlyTransactionModel.fromJson(item))
            .toList()));
      } catch (error) {
        print(error);
        emit(HomemonthlychartError((error as Map)['message']));
      }
    });
  }
}
