import 'package:flutter/material.dart';
import 'package:inventory_controller/models/auth.dart/user.dart';

class AppStarted {}

class LoadingLoginAction {
  final String email;
  final String password;
  final BuildContext context;

  LoadingLoginAction({required this.email,required this.password, required this.context});
}

class UserLoginSuccess {
  final User user;

  UserLoginSuccess({required this.user});
}

class UserLoaded {
  final User user;

  UserLoaded({required this.user});
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final String exception;
}

class ErrorLoginHandledAction {}

class UserLogout {}
