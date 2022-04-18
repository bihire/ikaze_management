class StartRegisterAction {
  final String email;
  final String username;
  final String password;
  final String confirmPassword;

  StartRegisterAction(
      {required this.email,
      required  this.password,
      required  this.confirmPassword,
      required  this.username});
}

class SuccessRegisterAction {
  final String token;

  SuccessRegisterAction({required this.token});
}

class ErrorRegisterAction {
  final String error;

  ErrorRegisterAction({required this.error});
}