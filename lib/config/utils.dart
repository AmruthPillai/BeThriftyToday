import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

updateStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: thriftyBlue,
    systemNavigationBarColor: thriftyBlue,
    statusBarBrightness: Brightness.dark,
  ));
}

String formatAmount(User user, double amount) {
  return '${amount > 0 ? '' : '- '}${user?.currency?.symbol} ${amount.abs().ceil()}';
}

Future<String> getVersionCode() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  return '$version ($buildNumber)';
}

bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
