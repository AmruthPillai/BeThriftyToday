import 'package:bethriftytoday/shared/shared.dart';
import 'package:flutter/material.dart';

class AddTransactionFloatingButton extends StatelessWidget {
  AddTransactionFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => TransactionBottomSheet(),
        );
      },
      elevation: 0,
      splashColor: Theme.of(context).accentColor.withOpacity(0.5),
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Theme.of(context).accentColor,
      child: Icon(
        Icons.add,
        size: 32,
      ),
    );
  }
}
