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
      splashColor: Colors.white.withOpacity(0.5),
      backgroundColor: Theme.of(context).accentColor,
      foregroundColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 32,
      ),
    );
  }
}
