part of 'lastsupply_bloc.dart';

abstract class LastsupplyState extends Equatable {
  const LastsupplyState({this.lastSupply, this.error});

  final MoneyTransactionModel? lastSupply;
  final String? error;
  
  @override
  List<Object?> get props => [lastSupply, error];
}

class LastsupplyInitial extends LastsupplyState {}

class LastsupplyLoading extends LastsupplyState {}

class LastsupplyLoaded extends LastsupplyState {
  final MoneyTransactionModel lastSupply;

  LastsupplyLoaded(this.lastSupply);
}

class LastsupplyError extends LastsupplyState {
  final String? error;

  LastsupplyError(this.error);
}
