import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/auth/signup/signup.dart';
import 'package:redux/redux.dart';

class LoginContainer extends StatelessWidget {
  // final ProductInfoModel productInfo;
  // const LoginContainer({
  //   Key key,
  //   @required this.productInfo
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return SignUpScreen();
        // HomePageScreen(
        //   loading: vm.loading,
        //   isNextPageAvailable: vm.isNextPageAvailable,
        //   transactions: vm.transactions,
        //   // refresh: vm.onRefresh,
        //   loadNextPage: vm.onLoadNextPage,
        //   noError: vm.noError,
        // );
      },
      converter: _ViewModel.fromStore,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.loading,
    // this.isNextPageAvailable,
    // this.transactions,
    this.store,
    this.error,
  });

  final bool loading;
  final Store<AppState> store;
  final bool error;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.newTransactionListState.loading,
      isNextPageAvailable: store.state.newTransactionListState.isNextPageAvailable,
      transactions: store.state.newTransactionListState.transactions,
      store: store,
      error: store.state.newTransactionListState.error == null,
    );
  }
}
