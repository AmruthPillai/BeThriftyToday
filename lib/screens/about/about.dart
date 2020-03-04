import 'package:bethriftytoday/shared/thrifty/thrifty_appbar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ThriftyAppBar(
              canGoBack: true,
              hideAccount: true,
            )
          ],
        ),
      ),
    );
  }
}
