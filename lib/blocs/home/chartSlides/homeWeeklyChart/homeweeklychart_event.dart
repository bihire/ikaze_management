part of 'homeweeklychart_bloc.dart';

abstract class HomeweeklychartEvent extends Equatable {
  const HomeweeklychartEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeWeeklyChart extends HomeweeklychartEvent {}
