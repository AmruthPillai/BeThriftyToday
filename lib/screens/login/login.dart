import 'package:bethriftytoday/screens/login/top_section.dart';
import 'package:bethriftytoday/shared/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    child: TopSection(),
                    clipper: WaveClipper(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
