import 'package:flutter/material.dart';

class ThriftyLogo extends StatelessWidget {
  final double size;
  final bool isLight;

  const ThriftyLogo({
    Key key,
    this.size,
    this.isLight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'thrifty_logo',
      child: Image.asset(
        isLight ? 'assets/logos/logo_white.png' : 'assets/logos/logo_blue.png',
        width: this.size,
        height: this.size,
      ),
    );
  }
}
