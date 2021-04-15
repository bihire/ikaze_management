import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/auth/login/login.dart';
import 'package:redux/redux.dart';

class LoginContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return LoginScreen(
          loading: vm.loading,
          error: vm.error,
          store: vm.store,
        );
      },
      converter: _ViewModel.fromStore,
      distinct: true,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.loading,
    this.store,
    this.error,
  });

  final bool loading;
  final Store<AppState> store;
  final bool error;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.authState.loading,
      store: store,
      error: store.state.authState.error == null,
    );
  }
}