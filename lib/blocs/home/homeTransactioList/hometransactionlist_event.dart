part of 'hometransactionlist_bloc.dart';

abstract class HometransactionlistEvent extends Equatable {
  const HometransactionlistEvent();
  @override
  List<Object> get props => [];
}


class LoadHomeTransactionAction extends HometransactionlistEvent {
  final int pageNumber;

  LoadHomeTransactionAction({required this.pageNumber});
}
