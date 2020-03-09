import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:after_layout/after_layout.dart';
import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  void afterFirstLayout(BuildContext context) async {
    updateStatusBarColor(context);
    Future.delayed(Duration(seconds: 1), _checkIfUserIsLoggedIn);
  }

  checkUserPreferences() async {
    var settings = Provider.of<SettingsProvider>(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      settings.setAccentColor(Color(prefs.getInt('accentColor')));
      settings.setTheme(ThemeOptions.values[prefs.getInt('themePref')]);
      settings.setBiometricsEnabled(prefs.getBool('biometricsEnabled'));
    } catch (_) {
      settings.setAccentColor(thriftyBlue);
      settings.setTheme(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? ThemeOptions.dark
              : ThemeOptions.light);
      settings.setBiometricsEnabled(false);
    }
  }

  _checkIfUserIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthService _auth = AuthService();
    var user = await _auth.getUser;

    try {
      var isAuthenticated = true;

      if (await _localAuthentication.canCheckBiometrics) {
        if (prefs.getBool('biometricsEnabled') ?? false) {
          isAuthenticated =
              await _localAuthentication.authenticateWithBiometrics(
            localizedReason: "Please authenticate yourself to access the app.",
            sensitiveTransaction: false,
            useErrorDialogs: true,
            stickyAuth: true,
          );
        }
      }

      if (isAuthenticated) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'No soup for you! 🥣',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Text(e.message),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUserPreferences();

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Theme.of(context).accentColor,
        child: Center(
          child: ThriftyLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}
