import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/already_have_an_account_acheck.dart';
import 'package:inventory_controller/components/rounded_button.dart';
import 'package:inventory_controller/components/rounded_input_field.dart';
import 'package:inventory_controller/components/rounded_password_field.dart';
import 'package:inventory_controller/utils/auth/auth.dart';
import 'package:inventory_controller/views/auth/login/components/background.dart';
import 'package:inventory_controller/views/auth/login/login.dart';
import 'package:inventory_controller/views/auth/signup/components/or_divider.dart';
import 'package:inventory_controller/views/auth/signup/components/social_icon.dart';
import 'package:inventory_controller/views/auth/signup/signup.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  // AnimationController _controller;
  // Animation<double> _animation;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     duration: const Duration(seconds: 1),
  //     vsync: this,
  //   )..repeat();
  //   _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.fastOutSlowIn,
  // );
  // }
  //
  // AnimationController _animationController;
  String email = '';
  String emailError;

  bool isButtonClickable = false;

  String user_name = '';
  String user_nameError;

  String password = '';
  String passwordError;

  String confirm_password = '';
  String confirm_passwordError;

  // Animation<Color> animation;
  // AnimationController controller;

  // initState() {
  //   super.initState();
  //   controller = AnimationController(
  //       duration: const Duration(milliseconds: 500), vsync: this);
  //   final CurvedAnimation curve =
  //       CurvedAnimation(parent: controller, curve: Curves.linear);
  //   animation =
  //       ColorTween(begin: Colors.white, end: Colors.blue).animate(curve);
  //   animation.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       controller.reverse();
  //     } else if (status == AnimationStatus.dismissed) {
  //       controller.forward();
  //     }
  //     setState(() {});
  //   });
  //   controller.forward();
  // }

  // @override
  // void initState() {
  //   _animationController =
  //       new AnimationController(vsync: this, duration: Duration(seconds: 1));
  //   _animationController.repeat(reverse: true);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  Widget _buildErrors() {
    List<String> _fields = [email, user_name, password, confirm_password];
    var customErrors = {
      'email': 'provide a valid email',
      'user_name': 'username is at least 3 letters and only letters',
      'password': 'password is between 8 - 64 characters with atleast a number',
      'confirm_password': 'confirm_password must be same as password'
    };
    List<Widget> _errors = [];
    for (var i = 0; i < _fields.length; i++) {
      if (_fields[i] == null) {
        _errors.add(Text('* ${_fields[i]} is required'));
      } else if ('${_fields[i]}Error' == true) {
        _errors.add(Text(customErrors[_fields[i]]));
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _errors,
    );
  }

  bool _getBtnState() {
    return email != '' &&
            user_name != '' &&
            password != '' &&
            confirm_password != ''
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.20),
            SvgPicture.asset(
              "assets/svg/Final-AGASEKE.svg",
              color: Color(0xFF0bd50b),
              height: size.height * 0.20,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "SIGN-UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // SizeTransition(
            //   sizeFactor: _animation,
            //   axis: Axis.vertical,
            //   axisAlignment: -1,
            //   child: Container(
            //     // width: 200,
            //     margin: EdgeInsets.symmetric(horizontal: 10),
            //     color: Colors.red[300],
            //     height: 200,
            //   ),
            // ),
            // AnimatedBuilder(
            //   animation: animation,
            //   builder: (BuildContext context, Widget child) {
            //     return new Container(
            //       child: new Container(
            //         color: animation.value,
            //         // onPressed: () {
            //         //   controller.forward();
            //         // },
            //         child: _buildErrors(),
            //       ),
            //     );
            //   },
            // ),
            // FadeTransition(
            //   opacity: _animationController,
            //   child: Container(
            //     // width: 200,
            //     margin: EdgeInsets.symmetric(horizontal: 10),
            //     color: Colors.red[300],
            //     // height: 200,
            //     child: _buildErrors(),
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              error: emailError,
              hintText: "Your Email",
              backgroundColor: lightGreyColor,
              iconColor: darkColor,
              onChanged: (value) {
                setState(() {
                  email = value;
                  isButtonClickable = _getBtnState();
                });
              },
            ),
            RoundedInputField(
              error: user_nameError,
              hintText: "Your username",
              iconColor: darkColor,
              backgroundColor: lightGreyColor,
              onChanged: (value) {
                setState(() {
                  user_name = value;
                  isButtonClickable = _getBtnState();
                });
              },
            ),
            RoundedPasswordField(
              error: passwordError,
              hintText: "Password",
              iconColor: darkColor,
              backgroundColor: lightGreyColor,
              onChanged: (value) {
                setState(() {
                  password = value;
                  isButtonClickable = _getBtnState();
                });
              },
            ),
            RoundedPasswordField(
              error: confirm_passwordError,
              hintText: "Confirm Password",
              iconColor: darkColor,
              backgroundColor: lightGreyColor,
              onChanged: (value) {
                setState(() {
                  confirm_password = value;
                  isButtonClickable = _getBtnState();
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              loading: false,
              isBtnClickable: isButtonClickable,
              text: "SIGNUP",
              press: () {
                if (isButtonClickable) {
                  setState(() {
                    emailError = getBackError(
                        email,
                        'email',
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        '* provide a valide email');
                    user_nameError = getBackError(
                        user_name,
                        'username',
                        r"^(.*[a-zA-Z0-9]){3,30}",
                        '* username must have at least 3 characters');
                    passwordError = getBackError(
                        password,
                        'password',
                        r"^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,64}",
                        '* password must have 8 - 64 characters, a number');
                    confirm_passwordError = getConfirmPass(
                        confirm_password,
                        'confirm_password',
                        password,
                        '* confirm_password must equal to password');
                  });
                  if (emailError == null &&
                      user_nameError == null &&
                      passwordError == null &&
                      confirm_passwordError == null) {
                    print('bro this works to some extent');
                  }
                  print('emailError');
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pop(context);
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/svg/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/svg/google-plus.svg",
                  press: () {},
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
