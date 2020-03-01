import 'package:bethriftytoday/config/colors.dart';
import 'package:flutter/material.dart';

class ThriftyButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  const ThriftyButton({
    Key key,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  _ThriftyButtonState createState() => _ThriftyButtonState();
}

class _ThriftyButtonState extends State<ThriftyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        onPressed: this.widget.onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: thriftyBlue,
        disabledColor: thriftyBlue.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.widget.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              width: 28,
              height: 28,
              child: Image.asset('assets/images/double_arrow.png'),
            ),
          ],
        ),
      ),
    );
  }
}
