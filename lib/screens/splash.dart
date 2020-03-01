import 'package:after_layout/after_layout.dart';
import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/screens/login/login.dart';
import 'package:bethriftytoday/screens/onboarding/profile_setup.dart';
import 'package:bethriftytoday/services/auth.dart';
import 'package:bethriftytoday/shared/thrifty_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  void afterFirstLayout(BuildContext context) async {
    updateStatusBarColor();

    Future.delayed(Duration(seconds: 1), _checkIfUserIsLoggedIn);
  }

  Future _checkIfUserIsLoggedIn() async {
    AuthService _auth = AuthService();
    var user = await _auth.getUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, ProfileSetupScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
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
