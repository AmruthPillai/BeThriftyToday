import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/shared/thrifty_logo.dart';
import 'package:bethriftytoday/shared/wave_clipper.dart';
import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        height: 200,
        color: thriftyBlue,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: ThriftyLogo(
                size: 80,
                isLight: true,
              ),
            ),
          ],
        ),
      ),
      clipper: WaveClipper(),
    );
  }
}
