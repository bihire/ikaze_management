import 'package:flutter/material.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_monthly_action.dart';
import 'package:inventory_controller/views/homePage/chartSlide/monthly_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

makeDoubleDigit(number) => (number.toString()).length < 2
    ? '0' + number.toString()
    : number.toString();
String getDate(DateTime date, int number) {
  int curNum = date.month;
  if (curNum - number > 0) return '${makeDoubleDigit(curNum - number)}/${date.year}';
  return '${makeDoubleDigit(curNum - number + 12)}/${date.year - 1}';
}

class HomeMonthlyChartContainer extends StatefulWidget {
  HomeMonthlyChartContainer({Key key}) : super(key: key);

  @override
  _HomeMonthlyChartContainerState createState() =>
      _HomeMonthlyChartContainerState();
}

class _HomeMonthlyChartContainerState extends State<HomeMonthlyChartContainer>
    with AutomaticKeepAliveClientMixin<HomeMonthlyChartContainer> {
  @override
  Widget build(BuildContext context) {
    final dateObj = DateTime.now();
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return HomeMonthlyChartScreen(
          loading: vm.loading,
          error: vm.noError,
          overalMonthlyData: vm.overalMonthlyData
          // refresh: 
          
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadOveralMonthlyAction(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ViewModel {
  _ViewModel({
    this.loading,
    this.overalMonthlyData,
    this.store,
    this.noError,
  });

  final bool loading;
  final List<OveralMonthlyTransactionModel> overalMonthlyData;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.ovaraldailyState.isDataLoading,
      overalMonthlyData: store.state.overalMonthlyState.overalMonthlyData,
      store: store,
      noError: store.state.ovaraldailyState.error == null,
    );
  }
}
