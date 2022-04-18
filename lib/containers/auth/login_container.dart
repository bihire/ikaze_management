import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:inventory_controller/blocs/login/login_bloc.dart';
import 'package:inventory_controller/views/auth/login/login.dart';

class LoginContainer extends StatefulWidget {
  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final LoginBloc loginBloc = LoginBloc();
  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (context, state) {
        return LoginScreen(
            bloc: loginBloc,
            loading: state is LoginLoading ? true : false,
            error: state.error);
      },
    );
  }
}
