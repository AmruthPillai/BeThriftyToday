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
    return Container(
      width: size,
      height: size,
      child: Image.asset(
        isLight ? 'assets/logos/logo_white.png' : 'assets/logos/logo_blue.png',
      ),
    );
  }
}
