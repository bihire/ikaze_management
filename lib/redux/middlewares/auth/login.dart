// import 'dart:html';

import 'package:inventory_controller/models/auth.dart/user.dart';
import 'package:inventory_controller/redux/actions/auth/login.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:redux/redux.dart';

Middleware<AppState> loginMiddleware() {
  return TypedMiddleware<AppState, LoadingLoginAction>(_loadUser());
}

// Middleware<AppState> loginMiddlewareErrorHandled() {
//   return TypedMiddleware<AppState, ErrorHandledAction>(_loadErrorHandled());
// }

// _loadErrorHandled() {
//   // Store<AppState> store;
//   return ErrorHandledAction();
// }

_loadUser() {
  return (Store<AppState> store, LoadingLoginAction action,
      NextDispatcher next) async {
    next(action);
    try {
      final response = await const WebClient().post(
          '/auth/login', {'email': action.email, 'password': action.password});
      final String token = response['data']['token'];
      final storage = new FlutterSecureStorage();
      await storage.write(key: 'jwt', value: token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      var newUser =
          User(email: payload['email'], userName: payload['user_name']);
      await store.dispatch(UserLoginSuccess(user: newUser));
      await store.dispatch(ErrorHandledAction());
    } catch (exception) {
      print(exception["message"]);
      store.dispatch(ErrorOccurredAction(exception["message"]));
    }
  };
}

// Future<String> _loadUserToken() async {
//   var response =
//       await http.post('http://192.168.137.97:5000/api/auth/login');
//   if (response.statusCode == 200) {
//     final jsonData = (json.decode(response.body))['data']['token'] as String;
//     return jsonData;
//   } else {
//     throw Exception('Error getting data, http code: ${response.statusCode}.');
//   }
// }
