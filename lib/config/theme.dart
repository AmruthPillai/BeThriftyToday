import 'package:bethriftytoday/config/config.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'FiraSans',
  primaryColor: Colors.white,
  accentColor: thriftyBlue,
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  backgroundColor: Color(0xFFFFFFFF),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    brightness: Brightness.dark,
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    },
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
    ),
    focusColor: Colors.grey,
    hintStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
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
  primaryColor: Colors.grey[800],
  accentColor: thriftyBlue,
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF212121),
  backgroundColor: Color(0xFF212121),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    brightness: Brightness.dark,
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    },
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.white.withOpacity(0.75),
      fontWeight: FontWeight.w500,
    ),
    hintStyle: TextStyle(
      color: Colors.white.withOpacity(0.75),
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
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

ThemeData amoledTheme = ThemeData(
  fontFamily: 'FiraSans',
  primaryColor: Colors.black,
  accentColor: thriftyBlue,
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    brightness: Brightness.dark,
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    },
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.white.withOpacity(0.75),
      fontWeight: FontWeight.w500,
    ),
    hintStyle: TextStyle(
      color: Colors.white.withOpacity(0.75),
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
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
