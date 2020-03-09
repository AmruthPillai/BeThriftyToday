import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeOptions { light, dark, amoled }

class SettingsProvider extends ChangeNotifier {
  ThemeOptions themePref;
  bool biometricsEnabled;

  SettingsProvider() {
    themePref = ThemeOptions.light;
    biometricsEnabled = false;
  }

  setTheme(ThemeOptions value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themePref', value.index);
    themePref = value;
    notifyListeners();
  }

  setBiometricsEnabled(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometricsEnabled', value);
    biometricsEnabled = value;
    notifyListeners();
  }
}
