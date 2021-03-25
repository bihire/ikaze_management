import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/pages/home.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/middlewares/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/middlewares/homePage/overal_daily_middleware.dart';
import 'package:inventory_controller/redux/middlewares/homePage/overal_monthly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/homePage/overal_weekly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_daily_total.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_overal_daily_middleware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_overal_monthly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_overal_weekly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/popup_middleware.dart';
import 'package:inventory_controller/redux/middlewares/productList/product_list.dart';
import 'package:inventory_controller/redux/middlewares/range_middleware.dart';
import 'package:inventory_controller/redux/reducers/app_reducer.dart';
import 'package:inventory_controller/redux/middlewares/all_transactins_middlewares.dart';
import 'package:inventory_controller/servives/TransactionService.dart';
import 'package:redux/redux.dart';
import 'package:get_it/get_it.dart';


void setupLocator() {
  GetIt.I.registerLazySingleton(() => TransactionService());
}

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      createAllTransactionsMiddleware(),
      dashboardDailyTotalMiddleware(),
      overalDailyTransactionsMiddleware(),
      overalWeeklyTransactionsMiddleware(),
      createAllTransactionsRangeMiddleware(),
      popupMiddleware(),
      overalMonthlyTransactionsMiddleware(),
      detailDailyTotalMiddleware(),
      detailOveralDailyTotalMiddleware(),
      detailOveralMonthlyMiddleware(),
      detailOveralWeeklyMiddleware(),
      productListMiddleware()
    ]
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
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:inventory_controller/tryAnimation/container_transition.dart';
// import 'package:inventory_controller/tryAnimation/fade_scale_transition.dart';
// import 'package:inventory_controller/tryAnimation/fade_through_transition.dart';
// import 'package:inventory_controller/tryAnimation/shared_axis_transition.dart';

// // import 'container_transition.dart';
// // import 'fade_scale_transition.dart';
// // import 'fade_through_transition.dart';
// // import 'shared_axis_transition.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData.from(
//         colorScheme: const ColorScheme.light(),
//       ).copyWith(
//         pageTransitionsTheme: const PageTransitionsTheme(
//           builders: <TargetPlatform, PageTransitionsBuilder>{
//             TargetPlatform.android: ZoomPageTransitionsBuilder(),
//           },
//         ),
//       ),
//       home: _TransitionsHomePage(),
//     ),
//   );
// }

// class _TransitionsHomePage extends StatefulWidget {
//   @override
//   _TransitionsHomePageState createState() => _TransitionsHomePageState();
// }

// class _TransitionsHomePageState extends State<_TransitionsHomePage> {
//   bool _slowAnimations = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Material Transitions')),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView(
//               children: <Widget>[
//                 _TransitionListTile(
//                   title: 'Container transform',
//                   subtitle: 'OpenContainer',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return OpenContainerTransformDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 _TransitionListTile(
//                   title: 'Shared axis',
//                   subtitle: 'SharedAxisTransition',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return SharedAxisTransitionDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 _TransitionListTile(
//                   title: 'Fade through',
//                   subtitle: 'FadeThroughTransition',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return FadeThroughTransitionDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 _TransitionListTile(
//                   title: 'Fade',
//                   subtitle: 'FadeScaleTransition',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return FadeScaleTransitionDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const Divider(height: 0.0),
//           SafeArea(
//             child: SwitchListTile(
//               value: _slowAnimations,
//               onChanged: (bool value) async {
//                 setState(() {
//                   _slowAnimations = value;
//                 });
//                 // Wait until the Switch is done animating before actually slowing
//                 // down time.
//                 if (_slowAnimations) {
//                   await Future<void>.delayed(const Duration(milliseconds: 300));
//                 }
//                 timeDilation = _slowAnimations ? 20.0 : 1.0;
//               },
//               title: const Text('Slow animations'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TransitionListTile extends StatelessWidget {
//   const _TransitionListTile({
//     this.onTap,
//     this.title,
//     this.subtitle,
//   });

//   final GestureTapCallback onTap;
//   final String title;
//   final String subtitle;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 15.0,
//       ),
//       leading: Container(
//         width: 40.0,
//         height: 40.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           border: Border.all(
//             color: Colors.black54,
//           ),
//         ),
//         child: const Icon(
//           Icons.play_arrow,
//           size: 35,
//         ),
//       ),
//       onTap: onTap,
//       title: Text(title),
//       subtitle: Text(subtitle),
//     );
//   }
// }