import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/shared/thrifty_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThriftyAppBar extends StatefulWidget {
  const ThriftyAppBar({
    Key key,
  }) : super(key: key);

  @override
  _ThriftyAppBarState createState() => _ThriftyAppBarState();
}

class _ThriftyAppBarState extends State<ThriftyAppBar> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return SizedBox(
      height: 120,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.menu),
          ),
          SizedBox(width: 10),
          ThriftyLogo(size: 80),
          Spacer(),
          buildCircleAvatar(user),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  CircleAvatar buildCircleAvatar(User user) {
    if (user != null) {
      return CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(user.photoURL),
      );
    } else {
      return CircleAvatar(
        radius: 25,
        backgroundColor: Theme.of(context).primaryColor,
      );
    }
  }
}
