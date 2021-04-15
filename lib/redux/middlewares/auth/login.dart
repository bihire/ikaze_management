import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/redux/actions/auth/login.dart';
// import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
// import 'package:inventory_controller/redux/actions/homePage/overal_daily_action.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:redux/redux.dart';

Middleware<AppState> loginMiddleware() {
  return TypedMiddleware<AppState, LoadingLoginAction>(_loadUser());
}

_loadUser() {
  return (Store<AppState> store, LoadingLoginAction action,
      NextDispatcher next) {
    next(action);

    const WebClient().post('/auth/login',
        {'email': action.email, 'password': action.password}).then(
      (token) {
        print('=====================This is the token======================');
        print(token);
        // store.dispatch(UserLoginSuccess(token: token));
      },
    ).catchError((exception, stacktrace) {
      print(
          '======================================= this is the error ====================================');
      print(exception);
      // store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

// Future<String> _loadUserToken() async {
//   var response =
//       await http.post('http://10.1.10.185:5000/api/auth/login');
//   if (response.statusCode == 200) {
//     final jsonData = (json.decode(response.body))['data']['token'] as String;
//     return jsonData;
//   } else {
//     throw Exception('Error getting data, http code: ${response.statusCode}.');
//   }
// }
