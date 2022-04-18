import 'package:inventory_controller/models/product/product.dart';

class LoadProductListAction {}

class ProductListLoadedAction {
  ProductListLoadedAction(this.products);

  final List<ProductModel> products;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
