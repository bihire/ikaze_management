import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/already_have_an_account_acheck.dart';
import 'package:inventory_controller/components/rounded_button.dart';
import 'package:inventory_controller/components/rounded_input_field.dart';
import 'package:inventory_controller/components/rounded_password_field.dart';
import 'package:inventory_controller/views/auth/login/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_controller/views/auth/signup/signup.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              iconColor: darkColor,
              backgroundColor: lightGreyColor,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              iconColor: darkColor,
              hintText: 'Password',
              backgroundColor: lightGreyColor,
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              loading: false,
              isBtnClickable: false,
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}