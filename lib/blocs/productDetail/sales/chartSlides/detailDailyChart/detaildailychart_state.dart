part of 'detaildailychart_bloc.dart';

abstract class DetailDailychartState extends Equatable {
  const DetailDailychartState({this.overalDailyData = const [], this.error});
  final List<OveralDailyTransactionModel> overalDailyData;
  final String? error;

  @override
  List<Object> get props => [];
}

class DetailDailychartInitial extends DetailDailychartState {}

class DetailDailychartLoading extends DetailDailychartState {}

class DetailDailychartLoaded extends DetailDailychartState {
  final List<OveralDailyTransactionModel> overalDailyData;

  DetailDailychartLoaded(this.overalDailyData);
}

class DetailDailychartError extends DetailDailychartState {
  final String? error;

  DetailDailychartError(this.error);
}
