import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/main/main_view_flipper.dart';
import 'package:redux/redux.dart';

class MainViewFlipperContainer extends StatelessWidget {
  final Widget child;
  MainViewFlipperContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return MainViewFlipper(
          store: vm.store,
          child: child
        );
      },
      converter: _ViewModel.fromStore,
      distinct: true,
    );
  }
}

class _ViewModel {
  _ViewModel({this.store});

  final Store<AppState> store;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      store: store,
    );
  }
}
