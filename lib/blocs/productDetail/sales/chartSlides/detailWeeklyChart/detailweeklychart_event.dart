part of 'detailweeklychart_bloc.dart';

abstract class DetailweeklychartEvent extends Equatable {
  const DetailweeklychartEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailWeeklyChart extends DetailweeklychartEvent {}
