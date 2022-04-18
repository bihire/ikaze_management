import 'package:flutter/material.dart';

const primaryColor = Color(0xFF0bd50b);
const primaryRedColor = Color(0xFFE84842);
const darkColor = Color(0xFF000000);
const primaryLightColor = Color(0xFFFFFFFF);
const lightGreyColor = Color(0x33B6BEC0);
const hardGreyColor = Color(0xFF495D69);
const lightShadeColor = Color(0xFFB0BAC3);
const light1ShadeColor = Color(0xFFC9D2E5);
const blueColor = Color(0xFF224BDA);
const double shopTitleListSize = 16.0;
const shopTitleListWeight = FontWeight.w500;
const shopTitleListFamily = 'Robotto';

const double productTitleSize = 18.0;
const double homePriceTitleSize = 16.0;
const FontWeight productTitleWeight = FontWeight.w600;

Widget noTransactionFound = Center(
    child: Container(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(color: hardGreyColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(
                'No',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: hardGreyColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Text(
                'transaction found.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: hardGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 100,
      )
    ],
  ),
));

Widget errorTryAgain = Center(
    child: Container(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(
                'Error',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: hardGreyColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Text(
                'try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 100,
      )
    ],
  ),
));
