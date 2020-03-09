import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var settings = Provider.of<SettingsProvider>(context);

    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: UserDatabaseService(user).userDocument,
        ),
      ],
      child: Scaffold(
        body: Consumer<User>(
          builder: (context, user, _) => SafeArea(
            child: ListView(
              children: <Widget>[
                ThriftyAppBar(canGoBack: true),
                SizedBox(height: 20),
                buildHeader('Preferences'),
                buildThemeSelector(settings),
                buildBiometricsSwitch(settings),
                Divider(),
                buildHeader('Account'),
                buildNameSetting(context, user),
                buildEmailSetting(user),
                buildCurrencySetting(context, user),
                Divider(),
                buildHeader('Danger Zone'),
                buildDeleteAccount(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildNameSetting(BuildContext context, User user) {
    return ListTile(
      leading: Icon(
        Icons.person,
        color: thriftyBlue,
      ),
      title: Text(
        'Name',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user.name ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => UpdateNameDialog(
            name: user.name,
          ),
        );
      },
    );
  }

  ListTile buildEmailSetting(User user) {
    return ListTile(
      enabled: false,
      leading: Icon(
        Icons.mail,
        color: thriftyBlue,
      ),
      title: Text(
        'Email',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user.email ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  ListTile buildCurrencySetting(BuildContext context, User user) {
    return ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: thriftyBlue,
      ),
      title: Text(
        'Currency',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        '${user?.currency?.symbol} (${user?.currency?.name})' ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CurrencySelectionDialog(),
        );
      },
    );
  }

  Padding buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 4,
      ),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: thriftyBlue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  ListTile buildDeleteAccount(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.delete_sweep,
        color: Colors.red[800],
      ),
      title: Text(
        'Delete Account',
        style: TextStyle(
          color: Colors.red[800],
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Do you really want to delete your account?',
            ),
            content: Text(
              'You will lose all the data (including profile information and you transaction history) when you delete your account. This is an irreversible process, are you sure you want to go through with it?',
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No, I don\'t want to leave'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  try {
                    AuthService().deleteUser();
                  } catch (error) {
                    print('Something went wrong, please try again!');
                  }
                },
                child: Text(
                  'Yes, delete my data',
                  style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );

        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          (route) => false,
        );
      },
    );
  }

  FutureBuilder<bool> buildBiometricsSwitch(SettingsProvider settings) {
    return FutureBuilder<bool>(
      initialData: false,
      future: _localAuth.canCheckBiometrics,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var enabled = snapshot.data;

          return ListTile(
            enabled: enabled,
            leading: Icon(
              Icons.fingerprint,
              color: thriftyBlue,
            ),
            title: Text(
              'Biometric Fortification',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle:
                Text('Asks for your fingerprint everytime you open the app.'),
            trailing: Switch(
              value: settings.biometricsEnabled,
              activeColor: thriftyBlue,
              onChanged: enabled
                  ? (value) {
                      settings.setBiometricsEnabled(value);
                    }
                  : null,
            ),
            onTap: () {
              settings.setBiometricsEnabled(!settings.biometricsEnabled);
            },
          );
        }

        return Container();
      },
    );
  }

  ListTile buildThemeSelector(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.brightness_medium,
        color: thriftyBlue,
      ),
      title: Text(
        'Theme',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: DropdownButton<ThemeOptions>(
        onChanged: (val) {
          settings.setTheme(val);
        },
        value: settings.themePref,
        items: [
          DropdownMenuItem(
            value: ThemeOptions.light,
            child: Text('Light'),
          ),
          DropdownMenuItem(
            value: ThemeOptions.dark,
            child: Text('Dark'),
          ),
          DropdownMenuItem(
            value: ThemeOptions.amoled,
            child: Text('AMOLED'),
          ),
        ],
      ),
    );
  }
}
