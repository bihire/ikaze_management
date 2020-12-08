import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/already_have_an_account_acheck.dart';
import 'package:inventory_controller/components/rounded_button.dart';
import 'package:inventory_controller/components/rounded_input_field.dart';
import 'package:inventory_controller/components/rounded_password_field.dart';
import 'package:inventory_controller/views/auth/login/components/background.dart';
import 'package:inventory_controller/views/auth/login/login.dart';
import 'package:inventory_controller/views/auth/signup/components/or_divider.dart';
import 'package:inventory_controller/views/auth/signup/components/social_icon.dart';
import 'package:inventory_controller/views/auth/signup/signup.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              iconColor: darkColor,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your username",
              iconColor: darkColor,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
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
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}