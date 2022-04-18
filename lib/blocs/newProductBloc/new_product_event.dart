part of 'new_product_bloc.dart';

abstract class NewProductEvent extends Equatable {
  const NewProductEvent();

  @override
  List<Object> get props => [];
}

class CreateProduct extends NewProductEvent {
  final String product_name;
  final int unit_price;
  final String unit_quantity;

  CreateProduct(this.product_name, this.unit_price, this.unit_quantity) : super();
}
