import 'package:flutter/material.dart';
import 'package:inventory_controller/components/slideMenuRoute/enum.dart';
import 'package:inventory_controller/components/slideMenuRoute/page_routing.dart';

import 'package:inventory_controller/models/auth.dart/user.dart';
import 'package:inventory_controller/pages/home.dart';
import 'package:inventory_controller/redux/actions/auth/login.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:redux/redux.dart';

Middleware<AppState> loginMiddleware() {
  return TypedMiddleware<AppState, LoadingLoginAction>(_loadUser());
}

Middleware<AppState> loginMiddlewareErrorHandled() {
  return TypedMiddleware<AppState, ErrorLoginHandledAction>(
      _loadErrorHandled());
}

_loadErrorHandled() {
  return (Store<AppState> store, ErrorLoginHandledAction action,
      NextDispatcher next) {
    next(action);
  };
}

_loadUser() {
  return (Store<AppState> store, LoadingLoginAction action,
      NextDispatcher next) async {
    next(action);
    try {
      final response = await const WebClient().npost(
          '/auth/login', {'email': action.email, 'password': action.password});
      final String token = response['data']['token'];
      final storage = new FlutterSecureStorage();
      await storage.write(key: 'jwt', value: token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      var newUser =
          User(email: payload['email'], userName: payload['user_name']);
      await store.dispatch(UserLoginSuccess(user: newUser));
      Navigator.pushNamed(action.context, '/home');
    } catch (exception) {
      store.dispatch(ErrorOccurredAction((exception as Map)["message"]));
    }
  };
}
