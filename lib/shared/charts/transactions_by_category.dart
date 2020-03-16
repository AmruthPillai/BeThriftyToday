import 'package:bethriftytoday/models/models.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OrdinalSpendingByCategory {
  String category;
  double amount;

  OrdinalSpendingByCategory(
    this.category,
    this.amount,
  );
}

class TopTransactionsByCategory extends StatelessWidget {
  final String title;
  final String type;
  final List<Transaction> transactions;

  const TopTransactionsByCategory({
    Key key,
    @required this.type,
    @required this.title,
    @required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: charts.BarChart(
                generateChartData(this.transactions),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<charts.Series<OrdinalSpendingByCategory, String>> generateChartData(
    List<Transaction> transactions,
  ) {
    var categoryWiseTransactions = groupBy(
        transactions.where((x) => x.category.type == this.type),
        (Transaction x) => x.category.name);

    List<OrdinalSpendingByCategory> data = [];
    categoryWiseTransactions.forEach((category, transactions) {
      data.add(OrdinalSpendingByCategory(
        category,
        transactions.fold(0, (prev, txn) => prev + (txn.amount).abs()),
      ));
    });
    data.sort((a, b) => b.amount.compareTo(a.amount));
    data = data.sublist(0, (data.length < 5) ? data.length : 5);

    return [
      new charts.Series<OrdinalSpendingByCategory, String>(
        id: this.title,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSpendingByCategory spending, _) => spending.category,
        measureFn: (OrdinalSpendingByCategory spending, _) => spending.amount,
        data: data,
      )
    ];
  }
}
