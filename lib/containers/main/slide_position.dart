import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/main/components/slide_position.dart';
import 'package:redux/redux.dart';

import 'main_card_opacity.dart';

class SlidePositionContainer extends StatelessWidget {
  final Widget child;
  SlidePositionContainer({
    this.child
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return MainSlidePosition(
          position: vm.position,
          child: child,
        );
      },
      converter: _ViewModel.fromStore,
      distinct: true,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.position,
    // this.store
  });

  final double position;
  // final Store<AppState> store;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      position: store.state.mainSlideEpicPositionState.position,
      // store: store,
    );
  }
}
