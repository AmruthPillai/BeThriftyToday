import 'package:bethriftytoday/shared/thrifty/thrifty_appbar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ThriftyAppBar(
              canGoBack: true,
              hideAccount: true,
            ),
            SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Text('Be Thrifty Today'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
