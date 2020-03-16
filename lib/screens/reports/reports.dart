import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/database/transaction_db.dart';
import 'package:bethriftytoday/shared/charts/transactions_by_category.dart';
import 'package:bethriftytoday/shared/thrifty/thrifty_appbar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatelessWidget {
  static const String routeName = '/reports';

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<Object>(
          stream: TransactionDatabaseService(user).transactions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  ThriftyAppBar(canGoBack: true),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MonthlySpending(
                      transactions: snapshot.data,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TopTransactionsByCategory(
                      type: 'expense',
                      title: 'Top 5 Expenses by Category',
                      transactions: snapshot.data,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TopTransactionsByCategory(
                      type: 'income',
                      title: 'Top 5 Incomes by Category',
                      transactions: snapshot.data,
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class OrdinalMonthlySpending {
  int monthYear;
  double amount;

  OrdinalMonthlySpending(
    this.monthYear,
    this.amount,
  );
}

class MonthlySpending extends StatelessWidget {
  final List<Transaction> transactions;

  const MonthlySpending({
    Key key,
    @required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              'Month by Month Spending',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: charts.LineChart(
                generateChartData(transactions),
                defaultRenderer:
                    new charts.LineRendererConfig(includePoints: true),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<charts.Series<OrdinalMonthlySpending, int>> generateChartData(
    List<Transaction> transactions,
  ) {
    var monthWiseTransactions = groupBy(
        transactions.where((x) => x.category.type == 'expense'),
        (Transaction x) => int.parse(DateFormat('Myy').format(x.timestamp)));

    List<OrdinalMonthlySpending> data = [];
    monthWiseTransactions.forEach((monthYear, transactions) {
      data.add(OrdinalMonthlySpending(
        monthYear,
        transactions.fold(0, (prev, txn) => prev + (txn.amount).abs()),
      ));
    });
    data = data.sublist(0, (data.length < 5) ? data.length : 5);

    return [
      new charts.Series<OrdinalMonthlySpending, int>(
        id: 'Monthly Spending',
        domainFn: (OrdinalMonthlySpending spending, _) => spending.monthYear,
        measureFn: (OrdinalMonthlySpending spending, _) => spending.amount,
        data: data,
      )
    ];
  }
}
