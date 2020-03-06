import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
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
          StreamProvider<List<Category>>.value(
            value: CategoryDatabaseService().categories,
          ),
          StreamProvider<List<Transaction>>.value(
            value: TransactionDatabaseService(user)
                .expensesByMonth(DateTime.now()),
          ),
        ],
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: ThriftyDrawer(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: AddTransactionFloatingButton(),
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ThriftyAppBar(),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ThriftyOverview(),
                      DailyTransactionList(),
                    ],
                  ),
                ),
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
