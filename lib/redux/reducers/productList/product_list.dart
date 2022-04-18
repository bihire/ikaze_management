import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/redux/actions/productList/product_list.dart';
import 'package:inventory_controller/redux/appState/productList/product_list.dart';

import 'package:redux/redux.dart';

ProductListState productListReducer(ProductListState state, action) {
  return state.copyWith(
    loading: _isDataLoadingReducer(state.loading, action),
    products: _productsReducer(state.products, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadProductListAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, ProductListLoadedAction>(_isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

List<ProductModel> _productsReducer(
    List<ProductModel> products, dynamic action) {
  if (action is ProductListLoadedAction) {
    return action.products;
  } else {
    return products;
  }
}

final Reducer<Exception> _errorReducer = combineReducers<Exception>([
  TypedReducer<Exception, ErrorOccurredAction>(_errorOccurredReducer),
  TypedReducer<Exception, ErrorHandledAction>(_errorHandledReducer),
]);

Exception _errorOccurredReducer(Exception _, ErrorOccurredAction action) {
  return action.exception;
}

Exception _errorHandledReducer(Exception _, ErrorHandledAction action) {
  return null;
}
