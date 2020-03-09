import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateBudgetDialog extends StatefulWidget {
  final double initialValue;

  const UpdateBudgetDialog({
    Key key,
    this.initialValue,
  }) : super(key: key);

  @override
  _UpdateBudgetDialogState createState() => _UpdateBudgetDialogState();
}

class _UpdateBudgetDialogState extends State<UpdateBudgetDialog> {
  TextEditingController _budgetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _budgetController.text = widget.initialValue.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    if (user != null) {
      return Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Please enter a monthly budget that you feel is conservative according to your spending habits.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Budget',
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    UserDatabaseService(user).updateUserBudget(null);
                    Navigator.pop(context);
                  },
                  textColor: Colors.red,
                  icon: Icon(Icons.clear),
                  label: Text('CLEAR'),
                ),
                FlatButton.icon(
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    if (_budgetController.text.isEmpty) return;
                    UserDatabaseService(user).updateUserBudget(
                      double.parse(_budgetController.text),
                    );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.check),
                  label: Text('SET BUDGET'),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
