import 'package:bethriftytoday/models/models.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

updateStatusBarColor(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Theme.of(context).accentColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));
}

String formatAmount(User user, double amount) {
  return '${amount >= 0 ? '' : '- '}${user?.currency?.symbol} ${amount?.abs()?.toStringAsFixed(2)}'
      .replaceAllMapped(
    new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]},',
  );
}

double calculateAbsoluteSum(List<Transaction> transactions) {
  return transactions.fold<double>(0, (value, txn) => value + txn.amount).abs();
}

String transformCategoryToKey(Category category) {
  return category.name.replaceAll(new RegExp(r'[& ]'), '');
}

Future<String> getVersionCode() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  return '$version ($buildNumber)';
}
