part of 'dailysales_bloc.dart';

abstract class DetaildailysalesEvent extends Equatable {
  const DetaildailysalesEvent();

  @override
  List<Object> get props => [];
}

class LoaddetaildailySales extends DetaildailysalesEvent {
  final int productId;
  LoaddetaildailySales(this.productId);
}
