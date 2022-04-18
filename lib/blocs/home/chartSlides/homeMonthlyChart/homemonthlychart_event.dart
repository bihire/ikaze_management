part of 'homemonthlychart_bloc.dart';

abstract class HomemonthlychartEvent extends Equatable {
  const HomemonthlychartEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeMonthlyChart extends HomemonthlychartEvent{}
