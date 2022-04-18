part of 'suppliestransactionlist_bloc.dart';

abstract class SuppliestransactionlistEvent extends Equatable {
  const SuppliestransactionlistEvent();
  @override
  List<Object> get props => [];
}

class Loadsuppliestransactions extends SuppliestransactionlistEvent {
  final int pageNumber;
  final int productId;

  Loadsuppliestransactions({
    required this.pageNumber,
    required this.productId
  }) : super();
}
