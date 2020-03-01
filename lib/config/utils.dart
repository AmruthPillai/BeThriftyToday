import 'package:bethriftytoday/config/colors.dart';
import 'package:flutter/services.dart';

updateStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: thriftyBlue,
    statusBarBrightness: Brightness.dark,
  ));
}
