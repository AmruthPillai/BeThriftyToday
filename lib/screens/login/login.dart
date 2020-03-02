import 'dart:io';

import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/screens/login/bottom_section.dart';
import 'package:bethriftytoday/screens/login/top_section.dart';
import 'package:bethriftytoday/shared/wave_clipper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    updateStatusBarColor();

    return Scaffold(
      body: SafeArea(
        top: !Platform.isIOS,
        bottom: false,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
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
              flex: 2,
              child: BottomSection(),
            ),
          ],
        ),
      ),
    );
  }
}
