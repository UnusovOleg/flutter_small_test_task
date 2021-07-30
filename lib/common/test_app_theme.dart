import 'package:flutter/material.dart';

class TestAppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.dark(),
    backgroundColor: Color(0xFF050505),
    scaffoldBackgroundColor: Color(0xFF050505),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF2F54EB),
        shape: BeveledRectangleBorder(),
        padding: EdgeInsets.zero,
        alignment: Alignment(0, 0),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF2F5400),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: -0.15,
      ),
      headline1: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 26 / 20,
      ),
    ),
  );
}
