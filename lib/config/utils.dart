import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

updateStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: thriftyBlue,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));
}

String formatAmount(User user, double amount) {
  return '${amount >= 0 ? '' : '- '}${user?.currency?.symbol} ${amount?.abs()?.ceil()}'
      .replaceAllMapped(
    new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]},',
  );
}

double calculateAbsoluteSum(List<Transaction> transactions) {
  return transactions.fold<double>(0, (value, txn) => value + txn.amount).abs();
}

Future<String> getVersionCode() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  return '$version ($buildNumber)';
}

bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
