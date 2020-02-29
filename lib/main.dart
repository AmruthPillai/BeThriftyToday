import 'package:bethriftytoday/config/routes.dart';
import 'package:bethriftytoday/config/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be Thrifty Today',
      theme: theme,
      initialRoute: '/splash',
      routes: routes,
    );
  }
}
