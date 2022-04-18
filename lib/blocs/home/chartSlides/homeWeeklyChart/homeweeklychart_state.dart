part of 'homeweeklychart_bloc.dart';

abstract class HomeweeklychartState extends Equatable {
  const HomeweeklychartState({this.overalWeeklyData = const [], this.error});

  final List<OveralWeeklyTransactionModel> overalWeeklyData;
  final String? error;

  @override
  List<Object> get props => [];
}

class HomeweeklychartInitial extends HomeweeklychartState {}

class HomeweeklychartLoading extends HomeweeklychartState {}

class HomeweeklychartLoaded extends HomeweeklychartState {
  final List<OveralWeeklyTransactionModel> overalWeeklyData;

  HomeweeklychartLoaded(this.overalWeeklyData);
}

class HomeweeklychartError extends HomeweeklychartState {
  final String error;

  HomeweeklychartError(this.error);
}
