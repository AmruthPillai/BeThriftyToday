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
        Spacer(flex: 2),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            'A simple and secure money manager that keeps you financially vigilant.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Spacer(flex: 2),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton.icon(
            onPressed: () => signIn(false),
            color: Theme.of(context).primaryColor,
            textColor: Colors.blue[800],
            padding: const EdgeInsets.symmetric(vertical: 15),
            icon: Image.asset(
              'assets/images/google_icon.png',
              width: 28,
              height: 28,
            ),
            label: Text(
              'Login with Google',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton(
            onPressed: () => signIn(true),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text('Login as Guest'),
          ),
        ),
        Spacer(flex: 2),
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
