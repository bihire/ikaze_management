part of 'dailysales_bloc.dart';

abstract class DailysalesState extends Equatable {
  const DailysalesState({this.dailySales, this.error});

  final int? dailySales;
  final String? error;

  @override
  List<Object> get props => [];
}

class DailysalesInitial extends DailysalesState {}

class DailysalesLoading extends DailysalesState {}

class DailysalesLoaded extends DailysalesState {
  final int dailySales;

  DailysalesLoaded(this.dailySales);
}

class DailysalesError extends DailysalesState {
  final String error;

  DailysalesError(this.error);
}
