part of 'dailysales_bloc.dart';

abstract class DetaildailysalesState extends Equatable {
  const DetaildailysalesState({this.dailySales, this.error});

  final int? dailySales;
  final String? error;

  @override
  List<Object?> get props => [dailySales, error];
}

class DetaildailysalesInitial extends DetaildailysalesState {}

class DetaildailysalesLoading extends DetaildailysalesState {}

class DetaildailysalesLoaded extends DetaildailysalesState {
  final int dailySales;

  DetaildailysalesLoaded(this.dailySales);
}

class DetaildailysalesError extends DetaildailysalesState {
  final String? error;

  DetaildailysalesError(this.error);
}
