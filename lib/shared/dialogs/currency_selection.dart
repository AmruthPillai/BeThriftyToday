import 'package:bethriftytoday/models/models.dart';
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
    var currencies = Provider.of<List<Currency>>(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: currencies.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text(
            currencies[index].symbol,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).accentColor,
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
    );
  }
}
