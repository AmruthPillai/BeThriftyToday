import 'package:bethriftytoday/screens/onboarding/profile_setup.dart';
import 'package:bethriftytoday/services/auth.dart';
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
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton(
            onPressed: () => signIn(false),
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
            onPressed: () => signIn(true),
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

  Future<void> signIn(bool isAnonymous) async {
    try {
      (isAnonymous)
          ? await _authService.signInAnonymously()
          : await _authService.signInWithGoogle();
      Navigator.pushReplacementNamed(context, ProfileSetupScreen.routeName);
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(content: e));
      return null;
    }
  }
}
