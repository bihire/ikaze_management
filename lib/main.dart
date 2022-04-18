import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inventory_controller/blocs/themeNotifier/theme_notifier_cubit.dart';
import 'package:inventory_controller/components/slideMenuRoute/enum.dart';
import 'package:inventory_controller/components/slideMenuRoute/page_routing.dart';
import 'package:inventory_controller/containers/auth/login_container.dart';
import 'package:inventory_controller/containers/entryPage/SoldEntry/sold_entry_container.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/new_entry_container.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/product_range.dart';
import 'package:inventory_controller/containers/userShops/user_shops.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/pages/home.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/theme_notifier.dart';
import 'package:inventory_controller/views/shops/my_shops.dart';
import 'package:provider/provider.dart';
import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
import 'package:inventory_controller/views/homePage/home_menu_page.dart';
import 'package:inventory_controller/views/onboarding/onboarding.dart';

final storage = new FlutterSecureStorage();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
late ThemeNotifierCubit themeBloc;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.white, // navigation bar color
  //   statusBarColor: Colors.transparent, // status bar color
  // ));
  final theme = await getString('theme');
  // final
  runApp(MyApp(theme: theme));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final String? theme;
  MyApp({this.theme});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    themeBloc = ThemeNotifierCubit(theme: getTheme(widget.theme));
    super.initState();
  }

  ThemeData? getTheme(String? theme) {
    switch (theme) {
      case 'dark':
        return darkTheme;
      case 'light':
        return lightTheme;
      default:
        return null;
    }
  }

  @override
  void dispose() {
    themeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => themeBloc,
      child: BlocBuilder<ThemeNotifierCubit, ThemeNotifierState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme,
            initialRoute: '/onboarding',
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case '/signin':
                  return PageRouting(
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: LoginContainer(),
                      type: PageRoutingType.leftToRightLeave);
                // case '/range_search':
                //   return PageRouting(
                //       duration: Duration(milliseconds: 500),
                //       reverseDuration: Duration(milliseconds: 500),
                //       curve: Curves.easeInOut,
                //       child: ProductRange(),
                //       type: PageRoutingType.leftToRightLeave);
                case '/myshops':
                  return PageRouting(
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: UserShopsContainer(),
                      type: PageRoutingType.leftToRightWithOpacity);
                case '/home':
                  return PageRouting(
                      duration: Duration(milliseconds: 1000),
                      reverseDuration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: MyHomePage(),
                      type: PageRoutingType.leftToRightWithOpacity);
                case '/onboarding':
                  return PageRouteBuilder(
                      pageBuilder: (c, a, s) => OnboardingScreen());
                case '/range_search':
                  return PageRouteBuilder(
                      pageBuilder: (c, a, s) => ProductRange());
                case '/product_sales':
                  return PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DetailSalesContainer(
                              productInfo:
                                  settings.arguments as ProductInfoModel));
                case '/product_supplies':
                  return PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SoldEntryContainer(
                              productInfo:
                                  settings.arguments as ProductInfoModel));
                default:
                  return null;
              }
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
    // );
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
