import 'package:bethriftytoday/config/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'FiraSans',
  brightness: Brightness.light,
  primaryColor: thriftyBlue,
  primaryColorBrightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      fontWeight: FontWeight.w600,
    ),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w600,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: thriftyBlue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: thriftyBlue,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'FiraSans',
  primaryColor: Colors.white,
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      fontWeight: FontWeight.w600,
    ),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w600,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: thriftyBlue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: thriftyBlue,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
  ),
);
