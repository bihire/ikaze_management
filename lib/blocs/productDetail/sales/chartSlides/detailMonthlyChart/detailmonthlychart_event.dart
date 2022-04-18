part of 'detailmonthlychart_bloc.dart';

abstract class DetailmonthlychartEvent extends Equatable {
  const DetailmonthlychartEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailMonthlyChart extends DetailmonthlychartEvent{}
