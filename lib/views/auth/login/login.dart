// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/blocs/login/login_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/RoundedPhoneNumberField/rounded_phone_number_field.dart';
import 'package:inventory_controller/components/errorContainer/error_container.dart';
import 'package:inventory_controller/components/slideMenuRoute/enum.dart';
import 'package:inventory_controller/components/slideMenuRoute/page_routing.dart';
import 'package:inventory_controller/containers/auth/signup_container.dart';
import 'package:inventory_controller/pages/home.dart';
import 'package:inventory_controller/utils/debounce.dart';
// import 'package:inventory_controller/redux/actions/auth/login.dart';
// import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

import 'package:inventory_controller/components/already_have_an_account_acheck.dart';
import 'package:inventory_controller/components/rounded_button.dart';
import 'package:inventory_controller/components/rounded_input_field.dart';
import 'package:inventory_controller/components/rounded_password_field.dart';
import 'package:inventory_controller/utils/auth/auth.dart';
// import 'package:inventory_controller/views/auth/login/components/background.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:inventory_controller/views/auth/signup/signup.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    required this.loading,
    required this.bloc,
    this.error,
  });
  final LoginBloc bloc;
  final bool loading;
  final String? error;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  // final LoginBloc loginBloc = LoginBloc();
  final Debouncer debouncer = Debouncer(milliseconds: 300);
  String phone = '';
  String phoneError = '';
  bool isButtonClickable = false;
  String password = '';
  String passwordError = '';

  bool _getBtnState() {
    return phone != '' && password != '' ? true : false;
  }

  bool passwordVisible = false;
  setPasswordVisible() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  late AnimationController _controller;
  // late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryLightColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.15),
              Image.asset('assets/images/Untitled-1-01.png',
                  height: size.height * 0.15),
              SizedBox(height: size.height * 0.03),
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Errorcontainer(error: widget.error, close: () {}, scrollTop: () {},
              ),
              SizedBox(height: size.height * 0.03),
              RoundedPhoneNumberField(
                error: phoneError,
                // iconColor: darkColor,
                hintText: '78  XXX  XXX',
                backgroundColor: lightGreyColor,
                onChanged: (value) {
                  setState(() {
                    phone = value;

                    isButtonClickable = _getBtnState();
                  });
                },
              ),

              // RoundedInputField(
              //   error: phoneError,
              //   hintText: "Phone Number",
              //   iconColor: darkColor,
              //   backgroundColor: lightGreyColor,
              //   onChanged: (value) {
              //     setState(() {
              //       phone = value;
              //       isButtonClickable = _getBtnState();
              //     });
              //   },
              // ),
              RoundedPasswordField(
                error: passwordError,
                iconColor: hardGreyColor,
                hintText: 'Password',
                visibility: passwordVisible,
                changeVisibility: setPasswordVisible,
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
                    FocusScope.of(context).unfocus();
                    setState(() {
                      phoneError = getBackError(phone, 'phone', r"^[0-9]{9}$",
                          '* provide a valide phone Number');
                      passwordError = getBackError(
                          password,
                          'password',
                          r"^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,64}",
                          '* password must have 8 - 64 characters, a number');
                    });
                    if (phoneError == '' &&
                        passwordError == '' &&
                        widget.loading == false) {
                      FocusScope.of(context).unfocus();
                      debouncer.run(() => widget.bloc.add(LoadLogin('250$phone', password, context)));
                      
                    }
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              // RaisedButton(
              //   onPressed: () {
              //     widget.store.dispatch(ErrorLoginHandledAction());
              //   },
              //   child: Text('animate'),
              // ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  FocusScope.of(context).unfocus();
                  // Navigator.push(context,
                  //     CupertinoPageRoute(builder: (context) => SignUpScreen(), maintainState: true));
                  Navigator.push(
                      context,
                      PageRouting(
                          curve: Curves.easeIn,
                          reverseDuration: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 500),
                          child: SignupContainer(),
                          type: PageRoutingType.rightToLeft));

                  // Navigator.push(
                  //   context,
                  //   PageRouting(
                  //       curve: Curves.easeIn,
                  //       reverseDuration: Duration(seconds: 2),
                  //       duration: Duration(seconds: 2),
                  //       child: MyHomePage(),
                  //       type: PageRoutingType.rightToLeftWithOpacity));

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
