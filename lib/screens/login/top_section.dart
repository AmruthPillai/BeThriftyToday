import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/shared/thrifty_logo.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: thriftyBlue,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: ThriftyLogo(
              size: 80,
              isLight: true,
            ),
          ),
          Spacer(),
          Container(
            height: 280,
            margin: const EdgeInsets.only(
              bottom: 40,
              left: 20,
              right: 20,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.25,
                    child: Image.asset(
                      'assets/images/coins.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/money_plant.png',
                    width: 240,
                    height: 240,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 0.25,
                    child: Image.asset(
                      'assets/images/wallet.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
