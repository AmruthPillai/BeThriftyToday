import 'package:bethriftytoday/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

updateStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: thriftyBlue,
    statusBarBrightness: Brightness.dark,
  ));
}

Future<String> getVersionCode() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  return '$version ($buildNumber)';
}

bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
