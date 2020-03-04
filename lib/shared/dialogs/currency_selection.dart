import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/currency.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/services/database/user_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencySelectionDialog extends StatelessWidget {
  const CurrencySelectionDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var currencies = Provider.of<List<Currency>>(context);

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: currencies.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text(
              currencies[index].symbol,
              style: TextStyle(
                fontSize: 24,
                color: thriftyBlue,
              ),
            ),
            title: Text(
              currencies[index].name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              UserDatabaseService(user).updateUserCurrency(
                currencies[index],
              );
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
