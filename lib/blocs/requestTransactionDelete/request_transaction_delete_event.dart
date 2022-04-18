part of 'request_transaction_delete_bloc.dart';

abstract class RequestTransactionDeleteEvent extends Equatable {
  const RequestTransactionDeleteEvent();

  @override
  List<Object> get props => [];
}

class RequestDelete extends RequestTransactionDeleteEvent {
  final int transaction_id;
  final BuildContext context;

  RequestDelete(this.transaction_id, this.context)
      : super();
}
