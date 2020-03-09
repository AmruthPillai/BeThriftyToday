import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/currency.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencySelectionDialog extends StatelessWidget {
  const CurrencySelectionDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var currencyProvider = Provider.of<CurrencyProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: currencyProvider.currencies.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text(
            currencyProvider.currencies[index].symbol,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            currencyProvider.currencies[index].name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            UserDatabaseService(user).updateUserCurrency(
              currencyProvider.currencies[index],
            );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
