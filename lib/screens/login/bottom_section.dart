import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:flutter/material.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({Key key}) : super(key: key);

  @override
  _BottomSectionState createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  AuthService _authService = AuthService();

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
        SizedBox(height: 20),
        Text(
          'For those who want to be in control.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton(
            onPressed: () => signIn(false),
            color: isDarkMode(context) ? Colors.black54 : Colors.white,
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
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Future<void> signIn(bool isAnonymous) async {
    try {
      var user = isAnonymous
          ? await _authService.signInAnonymously()
          : await _authService.signInWithGoogle();

      if (await UserDatabaseService(user).checkIfUserExists) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, ProfileSetupScreen.routeName);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
