part of 'detailweeklychart_bloc.dart';

abstract class DetailweeklychartState extends Equatable {
  const DetailweeklychartState({this.overalWeeklyData = const [], this.error});

  final List<OveralWeeklyTransactionModel> overalWeeklyData;
  final String? error;

  @override
  List<Object?> get props => [overalWeeklyData, error];
}

class DetailweeklychartInitial extends DetailweeklychartState {}

class DetailweeklychartLoading extends DetailweeklychartState {}

class DetailweeklychartLoaded extends DetailweeklychartState {
  final List<OveralWeeklyTransactionModel> overalWeeklyData;

  DetailweeklychartLoaded(this.overalWeeklyData);
}

class DetailweeklychartError extends DetailweeklychartState {
  final String? error;

  DetailweeklychartError(this.error);
}
