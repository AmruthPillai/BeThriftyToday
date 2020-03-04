import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/shared/thrifty/thrifty_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ThriftyAppBar extends StatefulWidget {
  final bool canGoBack;

  const ThriftyAppBar({
    Key key,
    this.canGoBack = false,
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
          widget.canGoBack
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Theme.of(context).primaryColor,
                  icon: Icon(Icons.arrow_back_ios),
                )
              : IconButton(
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

  Widget buildCircleAvatar(User user) {
    if (user != null) {
      return Container(
        width: 60,
        child: ClipOval(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: user.photoURL,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return Container();
  }
}
