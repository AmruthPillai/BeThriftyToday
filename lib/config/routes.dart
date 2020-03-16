import 'package:bethriftytoday/screens/categories/categories.dart';
import 'package:bethriftytoday/screens/currencies/currencies.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),

  // Authentication
  LoginScreen.routeName: (context) => LoginScreen(),

  // Profile Setup
  ProfileSetupScreen.routeName: (context) => ProfileSetupScreen(),
  CurrencySetupScreen.routeName: (context) => CurrencySetupScreen(),

  // In-App
  HomeScreen.routeName: (context) => HomeScreen(),
  ReportsScreen.routeName: (context) => ReportsScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  CurrenciesScreen.routeName: (context) => CurrenciesScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
};
