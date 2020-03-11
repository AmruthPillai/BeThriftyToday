import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeOptions { light, dark, amoled }

class SettingsProvider extends ChangeNotifier {
  Locale appLang;
  Color accentColor;
  ThemeOptions theme;
  bool biometricsEnabled;

  setAppLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLang', locale.languageCode);
    appLang = locale;
    notifyListeners();
  }

  setAccentColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accentColor', color.value);
    accentColor = color;
    notifyListeners();
  }

  setTheme(ThemeOptions themeOption) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', themeOption.index);
    theme = themeOption;
    notifyListeners();
  }

  setBiometricsEnabled(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometricsEnabled', value);
    biometricsEnabled = value;
    notifyListeners();
  }
}
