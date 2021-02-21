import 'package:flutter/material.dart';
import 'package:inventory_controller/components/cardFlipper/card_flipper.dart';
import 'package:inventory_controller/redux/actions/dashboard_daily_total.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

import 'package:skeleton_text/skeleton_text.dart';

class DailyTotal extends StatefulWidget {
  @override
  _DailyTotalState createState() => _DailyTotalState();
}

class _DailyTotalState extends State<DailyTotal> {
  int _value = 10;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: vm.isDataLoading == true
                      ? SkeletonAnimation(
                          child: Container(
                            width: 120.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        )
                      : AnimatedFlipCounter(
                          duration: Duration(milliseconds: 500),
                          value: _value, /* pass in a number like 2014 */
                          color: Colors.black,
                          size: 50,
                        ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: vm.isDataLoading == true
                      ? SkeletonAnimation(
                          child: Container(
                            width: 100.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        )
                      : Text(
                          "Today's revenue",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.right,
                        ),
                ),
              ],
            ),
            Row(
              children: [
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _value = _value + 10;
                      });
                    },
                    child: Icon(Icons.add)),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _value = _value - 10;
                      });
                    },
                    child: Icon(Icons.remove))
              ],
            )
          ],
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadDashboardDailyTotalAction(),
        );
      },
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.isDataLoading,
    this.dailTotal,
    this.store,
    this.noError,
  });

  final bool isDataLoading;
  final String dailTotal;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isDataLoading: store.state.dashboardDailyTotalState.isDataLoading,
      dailTotal: store.state.dashboardDailyTotalState.dailTotal,
      store: store,
      noError: store.state.dashboardDailyTotalState.error == null,
    );
  }
}
