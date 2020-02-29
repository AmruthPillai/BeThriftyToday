import 'package:after_layout/after_layout.dart';
import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/screens/login/login.dart';
import 'package:bethriftytoday/shared/thrifty_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  void afterFirstLayout(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: thriftyBlue,
      statusBarBrightness: Brightness.dark,
    ));

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: thriftyBlue,
        child: Center(
          child: ThriftyLogo(
            size: 100,
            isLight: true,
          ),
        ),
      ),
    );
  }
}
