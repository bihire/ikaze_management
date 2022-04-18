part of 'homedailychart_bloc.dart';

abstract class HomeDailychartState extends Equatable {
  const HomeDailychartState({this.overalDailyData = const [], this.error});
  final List<OveralDailyTransactionModel> overalDailyData;
  final String? error;

  @override
  List<Object> get props => [];
}

class HomeDailychartInitial extends HomeDailychartState {}

class HomeDailychartLoading extends HomeDailychartState {}

class HomeDailychartLoaded extends HomeDailychartState {
  final List<OveralDailyTransactionModel> overalDailyData;

  HomeDailychartLoaded(this.overalDailyData);
}

class HomeDailychartError extends HomeDailychartState {
  final String error;

  HomeDailychartError(this.error);
}
