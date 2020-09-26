import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/containers/homePage/home_container.dart';
import 'package:inventory_controller/pages/home.dart';
import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/middlewares/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/middlewares/overal_daily_middleware.dart';
import 'package:inventory_controller/redux/reducers/app_reducer.dart';
import 'package:inventory_controller/redux/middlewares/all_transactins_middlewares.dart';
// import 'package:inventory_controller/redux/store.dart';
import 'package:inventory_controller/servives/TransactionService.dart';
import 'package:redux/redux.dart';
// import './pages/home.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => TransactionService());
}

void main() async {
  // await Redux.init();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//   void main() {
//   var now = new DateTime.now();
//   var formatter = new DateFormat('MM');
//   String month = formatter.format(now);
//   print(now.month);
// }
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createAllTransactionsMiddleware() ..addAll(dashboardDailyTotalMiddleware()) ..addAll(overalDailyTransactionsMiddleware()),
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
    // MaterialApp(
    //   title: 'ikaze management',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: StoreProvider<AppState>(
    //     store: Redux.store,
    //     child: MyHomePage(),
    //   )
    // );
  }
}
