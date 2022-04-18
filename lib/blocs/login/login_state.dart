part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState({this.error});
  final String? error;

  @override
  List<Object?> get props => [error];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginError extends LoginState {
  final String error;

  LoginError(this.error);
}
