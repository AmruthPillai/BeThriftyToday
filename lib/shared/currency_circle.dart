import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/currency.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/screens/home/home.dart';
import 'package:bethriftytoday/services/database/user_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyCircle extends StatelessWidget {
  final Currency currency;

  const CurrencyCircle(this.currency);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return FloatingActionButton(
      elevation: 0,
      heroTag: currency.name,
      backgroundColor: thriftyBlue,
      foregroundColor: Colors.white,
      onPressed: () async {
        await UserDatabaseService(user).updateUserCurrency(currency);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      child: Text(
        currency.symbol,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
