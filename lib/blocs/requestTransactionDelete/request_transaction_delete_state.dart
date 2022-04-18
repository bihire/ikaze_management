part of 'request_transaction_delete_bloc.dart';

abstract class RequestTransactionDeleteState extends Equatable {
  const RequestTransactionDeleteState();
  
  @override
  List<Object> get props => [];
}

class RequestTransactionDeleteInitial extends RequestTransactionDeleteState {}

class RequestTransactionDeleteLoading extends RequestTransactionDeleteState {}

class RequestTransactionDeleteLoaded extends RequestTransactionDeleteState {
  // final MoneyTransactionModel transaction;

  RequestTransactionDeleteLoaded();
}

class RequestTransactionDeleteError extends RequestTransactionDeleteState {
  final String error;

  RequestTransactionDeleteError(this.error);
}
