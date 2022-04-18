part of 'detailmonthlychart_bloc.dart';

abstract class DetailmonthlychartState extends Equatable {
  const DetailmonthlychartState({this.error, this.overalMonthlyData = const []});

  final List<OveralMonthlyTransactionModel> overalMonthlyData;
  final String? error;

  @override
  List<Object?> get props => [overalMonthlyData, error];
}

class DetailmonthlychartInitial extends DetailmonthlychartState {}

class DetailmonthlychartLoading extends DetailmonthlychartState {}

class DetailmonthlychartLoaded extends DetailmonthlychartState {
  final List<OveralMonthlyTransactionModel> overalMonthlyData;

  DetailmonthlychartLoaded(this.overalMonthlyData);
}

class DetailmonthlychartError extends DetailmonthlychartState {
  final String? error;

  DetailmonthlychartError(this.error);
}
