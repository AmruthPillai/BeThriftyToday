import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/services/database/transaction_db.dart';
import 'package:bethriftytoday/services/database/user_db.dart';
import 'package:bethriftytoday/shared/thrifty_appbar.dart';
import 'package:bethriftytoday/shared/thrifty_drawer.dart';
import 'package:bethriftytoday/shared/thrifty_overview.dart';
import 'package:bethriftytoday/shared/transaction_list/daily.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    if (user != null) {
      return MultiProvider(
        providers: [
          StreamProvider<User>.value(
            value: UserDatabaseService(user).userDocument,
          ),
          StreamProvider<double>.value(
            value: TransactionDatabaseService(user).balance,
          ),
        ],
        child: Scaffold(
          drawer: Drawer(
            child: ThriftyDrawer(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            splashColor: Theme.of(context).accentColor.withOpacity(0.5),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).accentColor,
            child: Icon(
              Icons.add,
              size: 32,
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ThriftyAppBar(),
                ThriftyOverview(),
                DailyTransactionList(),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
