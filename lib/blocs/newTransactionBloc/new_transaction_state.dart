part of 'new_transaction_bloc.dart';

abstract class NewTransactionState extends Equatable {
  const NewTransactionState({this.transaction, this.error });

  final MoneyTransactionModel? transaction;
  final String? error;
  
  @override
  List<Object?> get props => [transaction, error];
}

class NewTransactionInitial extends NewTransactionState {}

class NewTransactionLoading extends NewTransactionState {}

class NewTransactionLoaded extends NewTransactionState {
  final MoneyTransactionModel transaction;

  NewTransactionLoaded(this.transaction);
}

class NewTransactionError extends NewTransactionState {
  final String? error;

  NewTransactionError(this.error);
}
