import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/services/database/user_database.dart';
import 'package:bethriftytoday/shared/thrifty_appbar.dart';
import 'package:bethriftytoday/shared/thrifty_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return StreamProvider<User>.value(
      value: UserDatabaseService(user).userDocument,
      child: Scaffold(
        drawer: Drawer(
          elevation: 0,
          child: ThriftyDrawer(),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ThriftyAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
