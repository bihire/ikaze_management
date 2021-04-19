

import 'package:inventory_controller/models/auth.dart/user.dart';

class AppStarted {}

class LoadingLoginAction {
  final String email;
  final String password;

  LoadingLoginAction({this.email, this.password});
}

class UserLoginSuccess {
  final User user;

  UserLoginSuccess({this.user});
}

class UserLoaded {
  final User user;

  UserLoaded({this.user});
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final String exception;
}

class ErrorHandledAction {}

class UserLogout {}