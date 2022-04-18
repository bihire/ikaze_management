import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/common/date_formater.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/range_count.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'rangesearch_event.dart';
part 'rangesearch_state.dart';

class RangesearchBloc extends Bloc<RangesearchEvent, RangesearchState> {
  RangesearchBloc() : super(const RangesearchState()) {
    on<LoadRangesearch>((event, emit) async {
      emit(state.copyWith(status: RangeStatus.loading));
      try {
        await Future.delayed(Duration(seconds: 2));
        final fromDate = Utils.formatToDate(event.fromDate);
        final toDate = Utils.formatToDate(event.toDate);
        final count = await WebClient().get(
            '/transactions/range/count?fromdate=$fromDate&todate=$toDate&product_id=1');
        final rangeList = await WebClient().get(
            '/range/transactions?page=1&numberOfRows=10&fromdate=$fromDate&todate=$toDate&product_id=1');

        print(count['data'][0]);
        print(rangeList['data']);
        emit(state.copyWith(
            status: RangeStatus.success,
            rangeCount: RangeCountModel.fromJson(count['data'][0]),
            rangeDate: RangeDate(
                rangeFromDate: event.fromDate, rangeToDate: event.toDate),
            rangeTransactions: (rangeList['data'] as List)
                .map((item) => MoneyTransactionModel.fromJson(item))
                .toList()));
      } catch (error) {
        print(error);
      }
    });
  }
}
