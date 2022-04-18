part of 'homedailychart_bloc.dart';

abstract class HomeDailychartEvent extends Equatable {
  const HomeDailychartEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeDailyChart extends HomeDailychartEvent {}
