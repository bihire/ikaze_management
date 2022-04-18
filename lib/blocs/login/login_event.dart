part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoadLogin extends LoginEvent {
  final String phone;
  final String password;
  final BuildContext context;

  LoadLogin(this.phone, this.password, this.context) : super();
}
