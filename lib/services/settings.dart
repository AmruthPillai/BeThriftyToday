import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool isDarkMode;
  bool biometricsEnabled;

  SettingsProvider() {
    isDarkMode = false;
    biometricsEnabled = false;
  }

  setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    isDarkMode = value;
    notifyListeners();
  }

  setBiometricsEnabled(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometricsEnabled', value);
    biometricsEnabled = value;
    notifyListeners();
  }
}
