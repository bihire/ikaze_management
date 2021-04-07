class StartRegisterAction {
  final String email;
  final String username;
  final String password;
  final String confirmPassword;

  StartRegisterAction(
      {this.email, this.password, this.confirmPassword, this.username});
}

class SuccessRegisterAction {
  final String token;

  SuccessRegisterAction({this.token});
}

class ErrorRegisterAction {
  final String error;

  ErrorRegisterAction({this.error});
}