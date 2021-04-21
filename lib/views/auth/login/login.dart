import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/slideMenuRoute/slide_route.dart';
import 'package:inventory_controller/redux/actions/auth/login.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

import 'package:inventory_controller/components/already_have_an_account_acheck.dart';
import 'package:inventory_controller/components/rounded_button.dart';
import 'package:inventory_controller/components/rounded_input_field.dart';
import 'package:inventory_controller/components/rounded_password_field.dart';
import 'package:inventory_controller/utils/auth/auth.dart';
import 'package:inventory_controller/views/auth/login/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_controller/views/auth/signup/signup.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    @required this.loading,
    @required this.store,
    @required this.error,
  });
  final Store<AppState> store;
  final bool loading;
  final String error;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  String email = '';

  String emailError;

  bool isButtonClickable = false;

  String password = '';

  String passwordError;

  bool _getBtnState() {
    return email != '' && password != '' ? true : false;
  }

  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    if (widget.error != null) {
      _controller.forward();
    }
    if (widget.error == null) {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryLightColor,
      body: Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.15),
              SvgPicture.asset(
                "assets/svg/Final-AGASEKE.svg",
                color: Color(0xFF0bd50b),
                height: size.height * 0.15,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizeTransition(
                sizeFactor: _animation,
                axis: Axis.vertical,
                axisAlignment: -1,
                child: Container(
                  // width: 200,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.store.dispatch(ErrorLoginHandledAction());
                              // print(widget.error);
                            },
                            child: Container(
                                padding:
                                    EdgeInsets.only(top: 7, bottom: 7, left: 7),
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: primaryLightColor,
                                )),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          widget.error == null ? '' : widget.error,
                          style: TextStyle(color: primaryLightColor),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                  // height: 200,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                error: emailError,
                hintText: "Your Email",
                iconColor: darkColor,
                backgroundColor: lightGreyColor,
                onChanged: (value) {
                  setState(() {
                    email = value;
                    isButtonClickable = _getBtnState();
                  });
                },
              ),
              RoundedPasswordField(
                error: passwordError,
                iconColor: darkColor,
                hintText: 'Password',
                backgroundColor: lightGreyColor,
                onChanged: (value) {
                  setState(() {
                    password = value;
                    isButtonClickable = _getBtnState();
                  });
                },
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                loading: widget.loading,
                isBtnClickable: isButtonClickable,
                text: "LOGIN",
                press: () {
                  if (isButtonClickable) {
                    setState(() {
                      emailError = getBackError(
                          email,
                          'email',
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          '* provide a valide email');
                      passwordError = getBackError(
                          password,
                          'password',
                          r"^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,64}",
                          '* password must have 8 - 64 characters, a number');
                    });
                    if (emailError == null && passwordError == null) {
                      // print(widget.store);
                      widget.store.dispatch(
                          LoadingLoginAction(email: email, password: password));
                    }
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              RaisedButton(
                onPressed: () {
                  widget.store.dispatch(ErrorLoginHandledAction());
                },
                child: Text('animate'),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  // Navigator.push(context,
                  //     CupertinoPageRoute(builder: (context) => SignUpScreen()));
                  Navigator.of(context).push(FromMenuRoute(
                      prevPage: widget, nextPage: SignUpScreen()));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return SignUpScreen();
                  //     },
                  //   ),
                  // );
                },
              ),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
