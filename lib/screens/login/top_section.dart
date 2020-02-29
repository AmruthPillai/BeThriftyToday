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
              size: 100,
              isLight: true,
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 260,
            margin: const EdgeInsets.only(bottom: 30),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
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
                Align(
                  alignment: Alignment.bottomRight,
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
