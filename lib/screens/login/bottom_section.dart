import 'package:flutter/material.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            'A simple money management app for those who want to be in control of their financial life.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton(
            onPressed: () {},
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/google_icon.png',
                  width: 28,
                  height: 28,
                ),
                SizedBox(width: 15),
                Text(
                  'Login with Google',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton(
            onPressed: () {},
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              'Sign in as a Guest',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
