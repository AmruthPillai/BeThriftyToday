import 'package:bethriftytoday/models/transaction.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/services/database/transaction_db.dart';
import 'package:bethriftytoday/shared/transaction_list/transaction_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyTransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return StreamBuilder<List<Transaction>>(
      stream: TransactionDatabaseService(user).transactions,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var grouped = TransactionDatabaseService(user)
              .groupTransactionsByDate(snapshot.data);

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...grouped.keys.map((date) {
                  return TransactionList(
                    date: date,
                    grouped: grouped,
                  );
                }),
              ],
            ),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Text('There seems to be an error!'),
            ),
          );
        }

        return Container();
      },
    );
  }
}

class TransactionList extends StatefulWidget {
  final String date;
  final Map<String, List<Transaction>> grouped;

  const TransactionList({
    Key key,
    @required this.date,
    @required this.grouped,
  }) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() => visible = !visible);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DateLabel(widget.date),
                Row(
                  children: <Widget>[
                    visible
                        ? Container()
                        : Text(
                            '${widget.grouped[widget.date].length} transactions hidden',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                    SizedBox(width: 5),
                    Icon(
                      visible ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ...visible
            ? widget.grouped[widget.date].map((txn) => TransactionListTile(txn))
            : [],
      ],
    );
  }
}
