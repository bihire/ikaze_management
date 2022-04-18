part of 'salestransactionlist_bloc.dart';

abstract class SalestransactionlistEvent extends Equatable {
  const SalestransactionlistEvent();
  @override
  List<Object> get props => [];
}

class Loadsalestransactions extends SalestransactionlistEvent {
  final int pageNumber;
  final int productId;
  // final BuildContext context;

  Loadsalestransactions({
    required this.pageNumber,
    required this.productId
  }) : super();
}
