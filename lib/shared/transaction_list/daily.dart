import 'package:bethriftytoday/models/transaction.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/services/database/transaction_db.dart';
import 'package:bethriftytoday/shared/transaction_list/transaction_list.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:provider/provider.dart';

class DailyTransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return StreamBuilder<List<Transaction>>(
      stream: TransactionDatabaseService(user).transactions,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return NoTransactionsFound();
          }

          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text('There seems to be an error!'),
              ),
            );
          }

          var grouped = TransactionDatabaseService(user)
              .groupTransactionsByDate(snapshot.data);

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: grouped.keys.length,
            itemBuilder: (context, index) {
              return TransactionList(
                date: grouped.keys.elementAt(index),
                grouped: grouped,
              );
            },
          );
        }

        return Container();
      },
    );
  }
}

class NoTransactionsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('assets/images/money_man.png'),
            SizedBox(height: 20),
            Text(
              'This list is looking a little bit empty...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Tap on the + button below to add a new income/expense.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
