part of 'new_product_bloc.dart';

abstract class NewProductState extends Equatable {
  const NewProductState({this.product, this.error});
  final ProductModel? product;
  final String? error;

  @override
  List<Object?> get props => [product, error];
}

class NewProductInitial extends NewProductState {}

class NewProductLoading extends NewProductState {}

class NewProductLoaded extends NewProductState {
  final ProductModel product;

  NewProductLoaded(this.product);
}

class NewProductError extends NewProductState {
  final String error;

  NewProductError(this.error);
}
