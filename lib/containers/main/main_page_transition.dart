
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

import 'main_card_opacity.dart';

class MainCardTransitionContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return MainCardOpacity(
          opacity: vm.opacity,
        );
      },
      converter: _ViewModel.fromStore,
      distinct: true,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.opacity,
    // this.store
  });

  final double  opacity;
  // final Store<AppState> store;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      opacity: store.state.reelsEpicOpacityState.opacity,
    );
  }
}