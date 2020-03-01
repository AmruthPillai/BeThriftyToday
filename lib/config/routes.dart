import 'package:bethriftytoday/screens/home/home.dart';
import 'package:bethriftytoday/screens/login/login.dart';
import 'package:bethriftytoday/screens/onboarding/currency_setup.dart';
import 'package:bethriftytoday/screens/onboarding/profile_setup.dart';
import 'package:bethriftytoday/screens/splash.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),

  // Authentication
  LoginScreen.routeName: (context) => LoginScreen(),

  // Profile Setup
  ProfileSetupScreen.routeName: (context) => ProfileSetupScreen(),
  CurrencySetupScreen.routeName: (context) => CurrencySetupScreen(),

  HomeScreen.routeName: (context) => HomeScreen(),
};
