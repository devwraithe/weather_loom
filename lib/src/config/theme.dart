import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  fontFamily: "Inter",
  visualDensity: VisualDensity.comfortable,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      elevation: 0,
      minimumSize: const Size(
        double.infinity,
        62,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          60,
        ),
      ),
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 41.05,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 36.49,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      fontSize: 32.44,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 28.83,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      height: 1.4,
    ),
    headline5: TextStyle(
      fontSize: 25.63,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      height: 1.4,
    ),
    headline6: TextStyle(
      fontSize: 22.78,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      height: 1.4,
    ),
    subtitle1: TextStyle(
      fontSize: 20.25,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    subtitle2: TextStyle(
      fontSize: 18.00,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 16.00,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 14.22,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    caption: TextStyle(
      fontSize: 12.64,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    overline: TextStyle(
      fontSize: 11.24,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
);
