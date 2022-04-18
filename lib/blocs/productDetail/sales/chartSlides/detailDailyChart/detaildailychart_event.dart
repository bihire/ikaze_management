part of 'detaildailychart_bloc.dart';

abstract class DetailDailychartEvent extends Equatable {
  const DetailDailychartEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailDailyChart extends DetailDailychartEvent {}
