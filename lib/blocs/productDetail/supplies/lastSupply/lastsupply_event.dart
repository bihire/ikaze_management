part of 'lastsupply_bloc.dart';

abstract class LastsupplyEvent extends Equatable {
  const LastsupplyEvent();

  @override
  List<Object> get props => [];
}

class Loaddetaillastsupply extends LastsupplyEvent {
  final int productId;
  Loaddetaillastsupply(this.productId);
}
