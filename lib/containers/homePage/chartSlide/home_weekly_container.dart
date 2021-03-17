import 'package:flutter/material.dart';
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_weekly_actions.dart';
import 'package:inventory_controller/views/homePage/chartSlide/weekly_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class HomeWeeklyChartContainer extends StatefulWidget {
  HomeWeeklyChartContainer({Key key}) : super(key: key);

  @override
  _HomeWeeklyChartContainerState createState() => _HomeWeeklyChartContainerState();
}

class _HomeWeeklyChartContainerState extends State<HomeWeeklyChartContainer> with AutomaticKeepAliveClientMixin <HomeWeeklyChartContainer>{
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return HomeWeeklyChartScreen(
          week_0: ((vm.overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_0')).totalAmount,
          week_1: ((vm.overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_1')).totalAmount,
          week_2: ((vm.overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_2')).totalAmount,
          week_3: ((vm.overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_3')).totalAmount
        );
      },
      converter: _ViewModel.fromStore,
      // onInit: (store) {
      //   store.dispatch(
      //     LoadOveralWeeklyAction(),
      //   );
      // },
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class _ViewModel {
  _ViewModel({
    this.loading,
    this.overalWeeklyData,
    this.store,
    this.noError,
  });

  final bool loading;
  final List<OveralWeeklyTransactionModel> overalWeeklyData;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.ovaraldailyState.isDataLoading,
      overalWeeklyData: store.state.overalWeeklyState.overalWeeklyData,
      store: store,
      noError: store.state.ovaraldailyState.error == null,
    );
  }
}