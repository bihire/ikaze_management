part of 'homemonthlychart_bloc.dart';

abstract class HomemonthlychartState extends Equatable {
  const HomemonthlychartState({this.error, this.overalMonthlyData = const []});

  final List<OveralMonthlyTransactionModel> overalMonthlyData;
  final String? error;

  @override
  List<Object> get props => [];
}

class HomemonthlychartInitial extends HomemonthlychartState {}

class HomemonthlychartLoading extends HomemonthlychartState {}

class HomemonthlychartLoaded extends HomemonthlychartState {
  final List<OveralMonthlyTransactionModel> overalMonthlyData;

  HomemonthlychartLoaded(this.overalMonthlyData);
}

class HomemonthlychartError extends HomemonthlychartState {
  final String error;

  HomemonthlychartError(this.error);
}
