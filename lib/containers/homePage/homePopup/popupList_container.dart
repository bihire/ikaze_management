import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
import 'package:inventory_controller/views/homePopup/popupList.dart';
import 'package:redux/redux.dart';

class HomePopupListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return PopupListScreen(
          underLine: vm.underLine,
          store: vm.store
        );
      },
      distinct: true,
      converter: _ViewModel.fromStore,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.underLine,
    this.store
  });

  final bool underLine;
  final Store<AppState> store;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      underLine: store.state.popupState.underLine,
      store: store,
    );
  }
}