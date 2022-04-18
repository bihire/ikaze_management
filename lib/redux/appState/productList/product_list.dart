// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:meta/meta.dart';

@immutable
class ProductListState {
  ProductListState({
    required this.loading,
    required this.products,
    this.error,
  });

  final bool loading;
  final List<ProductModel> products;
  final Exception? error;

  static const int transactionsPerPage = 10;

  factory ProductListState.initial() =>
      ProductListState(loading: false, products: []);

  ProductListState copyWith({
    loading,
    products,
    error,
  }) {
    return ProductListState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "ProductListState: loading = $loading, "
        "itemsDailTotal = $products, "
        "error = $error.";
  }
}
