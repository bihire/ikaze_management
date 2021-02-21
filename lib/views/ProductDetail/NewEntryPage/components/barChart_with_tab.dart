import 'package:flutter/material.dart';
// import 'package:inventory_controller/containers/homePage/overal_daily_mv.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/bar_chart.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:inventory_controller/views/screens/buttons_tabbar.dart';

import 'package:inventory_controller/models/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/overal_daily_action.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        // print(;
        return Container(
          margin: const EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
          ),
          // width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height / 2,
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: Color(0xFFBEB501),
                  radius: 20,
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 11.0),
                  tabs: [
                    Tab(
                      text: "Overall(Dailly)",
                    ),
                    Tab(
                      text: "Overall(Weekly)",
                    ),
                    Tab(
                      text: "Overall(Monthly)",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Center(
                          
                          child: BarChartSample1(
                            day_0: ((vm.overalDailydata).firstWhere((item) => item.rangeName == 'day_0')).totalAmount,
                            day_1: ((vm.overalDailydata).firstWhere((item) => item.rangeName == 'day_1')).totalAmount,
                            day_2: ((vm.overalDailydata).firstWhere((item) => item.rangeName == 'day_2')).totalAmount,
                            day_3: ((vm.overalDailydata).firstWhere((item) => item.rangeName == 'day_3')).totalAmount,
                            day_4: ((vm.overalDailydata).firstWhere((item) => item.rangeName == 'day_4')).totalAmount,
                            day_5: ((vm.overalDailydata).firstWhere((item) => item.rangeName == 'day_5')).totalAmount,
                            day_6: ((vm.overalDailydata).firstWhere((item) => item.rangeName == 'day_6')).totalAmount,
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(Icons.directions_transit),
                      ),
                      Center(
                        child: Icon(Icons.directions_bike),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ),
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadOvaralDailyAction(),
        );
      },
    );
  }
}


class _ViewModel {
  _ViewModel({
    this.isDataLoading,
    this.overalDailydata,
    this.store,
    this.noError,
  });

  final bool isDataLoading;
  final List<OveralDailyTransactionModel> overalDailydata;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isDataLoading: store.state.ovaraldailyState.isDataLoading,
      overalDailydata: store.state.ovaraldailyState.overalDailydata,
      store: store,
      noError: store.state.ovaraldailyState.error == null,
    );
  }
}