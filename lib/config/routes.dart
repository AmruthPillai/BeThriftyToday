import 'package:bethriftytoday/screens/login/login.dart';
import 'package:bethriftytoday/screens/onboarding/profile_setup.dart';
import 'package:bethriftytoday/screens/splash.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (BuildContext context) => SplashScreen(),
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  ProfileSetupScreen.routeName: (BuildContext context) => ProfileSetupScreen(),
};
