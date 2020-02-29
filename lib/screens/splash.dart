import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/shared/thrifty_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thriftyBlue,
      body: Center(
        child: ThriftyLogo(
          size: 100,
          isLight: true,
        ),
      ),
    );
  }
}
