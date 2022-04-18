part of 'new_transaction_bloc.dart';

abstract class NewTransactionEvent extends Equatable {
  const NewTransactionEvent();

  @override
  List<Object> get props => [];
}

class CreateTransaction extends NewTransactionEvent {
  final int product_id;
  final int quantity;
  final String type;
  final String paid_with;
  final int unit_price;
  final BuildContext context;

  CreateTransaction(this.product_id, this.quantity, this.unit_price, this.type,
      this.paid_with, this.context)
      : super();
}

class CancelTransactionError extends NewTransactionEvent {}
