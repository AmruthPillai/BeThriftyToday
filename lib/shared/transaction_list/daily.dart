import 'package:intl/intl.dart';
import 'package:bethriftytoday/models/transaction.dart';
import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyTransactionList extends StatefulWidget {
  @override
  _DailyTransactionListState createState() => _DailyTransactionListState();
}

class _DailyTransactionListState extends State<DailyTransactionList> {
  List<Transaction> transactions = [
    Transaction(
      category: 'Food & Drinks',
      description: 'Breakfast at Tiffany\'s',
      timestamp: DateTime.now(),
      amount: 23,
    ),
    Transaction(
      category: 'Food & Drinks',
      description: 'Breakfast at Tiffany\'s',
      timestamp: DateTime.now(),
      amount: -55,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DateLabel(DateTime.now()),
          ...transactions.map((x) => TransactionListTile(transaction: x))
        ],
      ),
    );
  }
}

class TransactionListTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionListTile({
    Key key,
    this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          buildCategoryIcon(),
          SizedBox(width: 12),
          buildMeta(),
          Spacer(),
          buildAmount(user),
        ],
      ),
    );
  }

  CircleAvatar buildCategoryIcon() {
    return CircleAvatar(
      radius: 22,
      backgroundColor: thriftyBlue,
      child: Text(
        transaction.category[0],
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Column buildMeta() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          transaction.category,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        (transaction.description != null)
            ? Column(
                children: <Widget>[
                  SizedBox(height: 2),
                  Text(
                    transaction.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  String formatAmount(User user) {
    return '${transaction.amount > 0 ? '+' : '-'} ${user?.currency?.symbol} ${transaction.amount.abs().toStringAsPrecision(2)}';
  }

  Text buildAmount(User user) {
    return Text(
      formatAmount(user),
      style: TextStyle(
        fontSize: 18,
        color: (transaction.amount > 0) ? Colors.green[400] : Colors.red[700],
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class DateLabel extends StatelessWidget {
  final DateTime timestamp;

  const DateLabel(this.timestamp);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      child: Text(
        DateFormat('dd MMMM y').format(timestamp).toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
