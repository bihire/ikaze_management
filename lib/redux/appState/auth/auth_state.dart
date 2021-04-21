import 'package:flutter/material.dart';
import 'package:inventory_controller/models/auth.dart/user.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState {
  AuthState({
    this.loading,
    this.user,
    this.error,
  });

  final bool loading;
  final User user;
  final String error;

  // static const int transactionsPerPage = 10;

  factory AuthState.initial() => AuthState(
      loading: false,
      user: User(country: null, email: null, userName: null, phoneNumber: null),
      error: null
      );

  AuthState copyWith({
    loading,
    user,
    error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
      error: error,
    );
  }

  @override
  String toString() {
    return "AuthState: loading = $loading, "
        "email = $user"
        "error = $error.";
  }
}
