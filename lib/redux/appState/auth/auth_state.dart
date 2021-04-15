import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState {
  AuthState({
    this.loading,
    this.token,
    this.error,
  });

  final bool loading;
  final String token;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory AuthState.initial() => AuthState(
        loading: false,
        token: null
      );

  AuthState copyWith({
    loading,
    token,
    error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      token: token ?? this.token,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "AuthState: loading = $loading, "
        "token = $token, "
        "error = $error.";
  }
}