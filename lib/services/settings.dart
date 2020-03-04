import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool isDarkMode;

  SettingsProvider() {
    isDarkMode = false;
  }

  setDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}
