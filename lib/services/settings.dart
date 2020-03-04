import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool isDarkMode;

  SettingsProvider() {
    isDarkMode = false;
  }

  setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    isDarkMode = value;
    notifyListeners();
  }
}
