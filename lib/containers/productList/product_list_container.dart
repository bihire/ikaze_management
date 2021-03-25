import 'package:flutter/material.dart';
import 'package:inventory_controller/models/productList/product_list.dart';
// import 'package:inventory_controller/redux/actions/itemDetail/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/actions/productList/product_list.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:inventory_controller/views/homePage/floatingButton/floating_dialogue.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class ProductListContainer extends StatefulWidget {
  @override
  _ProductListContainerState createState() => _ProductListContainerState();
}

class _ProductListContainerState extends State<ProductListContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return ProductListScreen(
          loading: vm.loading,
          products: vm.products,
          error: vm.error,
        );
      },
      converter: _ViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        if (store.state.productListState.products.length == 0) {
          store.dispatch(
            LoadProductListAction(),
          );
        }
      },
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.loading,
    this.products,
    this.store,
    this.error,
  });

  final bool loading;
  final List<ProductModel> products;
  final Store<AppState> store;
  final bool error;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.productListState.loading,
      products: store.state.productListState.products,
      store: store,
      error: store.state.detailDailySalesTotalState.error == null,
    );
  }
}
