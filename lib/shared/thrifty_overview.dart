import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThriftyOverview extends StatelessWidget {
  const ThriftyOverview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var balance = Provider.of<double>(context);

    if (user != null) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: thriftyBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'YOUR BALANCE',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  (balance != null)
                      ? Text(
                          formatAmount(user, balance),
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      : Container(),
                  SizedBox(height: 8),
                  Text(
                    'Tap to set a monthly budget\nand manage your expenses efficiently.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: (35 - 6).toDouble(),
                backgroundColor: thriftyBlue,
                child: Text(
                  '34%',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
