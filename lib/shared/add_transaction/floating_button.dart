import 'package:bethriftytoday/shared/add_transaction/bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddTransactionFloatingButton extends StatelessWidget {
  AddTransactionFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await showModalBottomSheet(
          elevation: 10,
          context: context,
          isDismissible: true,
          useRootNavigator: true,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          builder: (context) => AddTransactionBottomSheet(),
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
