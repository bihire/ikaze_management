part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState extends Equatable {
  const ProductListState({this.products = const [], this.error});

  final List<ProductModel> products;
  final String? error;

  @override
  List<Object?> get props => [products, error];
}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<ProductModel> products;

  ProductListLoaded(this.products);
}

class ProductListError extends ProductListState {
  final String error;

  ProductListError(this.error);
}
